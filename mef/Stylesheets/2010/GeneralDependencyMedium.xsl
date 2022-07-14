<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/GeneralDependencyMedium"/>
  <xsl:param name="depDocTitle">
    <!--1120 Common Dependency  - General Dependency Medium  -->
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <!-- New -->
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
          <span class="styDepTitle" style="width:88mm;">
            <span>
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;padding-left:6mm;">
            <span class="styTopSectionLineLbl"> 
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$DependencyData"/>
            </xsl:call-template>
            </span>
          </div>
        </div>
        <!--Data info Begin -->
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Business Name or Person Name:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:choose>
              <xsl:when test="$DependencyData/BusinessName/BusinessNameLine1 !=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="$DependencyData/BusinessName/BusinessNameLine2 !=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/PersonName"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Taxpayer Identification Number:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:choose>
              <xsl:when test="$DependencyData/EIN">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/EIN"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="$DependencyData/SSN">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/SSN"/>
                </xsl:call-template>
                <br/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReason"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Form, Line or Instruction Reference:</span>
          </div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/FormLineOrInstructionReference"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Regulations Reference:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/RegulationsReference"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Description:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$DependencyData/Description"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Attachment Information:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/AttachmentInformation"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
