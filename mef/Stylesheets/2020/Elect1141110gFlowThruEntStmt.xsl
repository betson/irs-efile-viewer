<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 08/31/2015 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/Elect1141110gFlowThruEntStmt"/>
  <xsl:param name="depDocTitle">

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
          <span class="styDepTitle" style="width:170mm;">
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
            <span class="styTopSectionLineLbl">Entity Name:</span>
          </div>
          <div style="float:left;clear:none;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/EntityName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/EntityName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Entity EIN:</span>
          </div>
          <div style="float:left;clear:none;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/EntityEIN"/>
                </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Person Name:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/PersonNm"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">SSN:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/SSN"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Elect Under Regulations Section 1.1411 Text:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/ElectUnderRegsSect11411Txt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Business Name:</span>
          </div>
          <div style="float:left;clear:none;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/BusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/BusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>
          </div>
         <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">EIN:</span>
          </div>
          <div style="float:left;clear:none;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/EIN"/>
                </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Foreign Entity Identification Group:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Elect1141110gFlowThruEntGrp/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
            </xsl:call-template>
          </div>
        </div>
        </div>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
