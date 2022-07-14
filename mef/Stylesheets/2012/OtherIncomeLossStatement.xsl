<?xml version="1.0" encoding="UTF-8" ?>
<!-- This form by Doug Peterson 6-14-2006 -->
<!-- Last Modified by Eugenia McDonald on 02/08/2013 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/OtherIncomeLossStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

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
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
                  </style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
      <body class="styBodyClass">
  
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:92mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Description:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Description"/>
            </xsl:call-template>
          </div>
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Income Loss Per Income<br/>Statement:</div>
          <div style="float:left;clear:none;width:118mm;">
            <br/><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/IncomeLossPerIncomeStatement"/>
            </xsl:call-template>
          </div>
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Temporary Difference Amount:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/TemporaryDifferenceAmount"/>
            </xsl:call-template>
          </div>
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Permanent Difference Amount:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PermanentDifferenceAmount"/>
            </xsl:call-template>
          </div>
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Income Loss Per Tax Return:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/IncomeLossPerTaxReturn"/>
            </xsl:call-template>
          </div>
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Other Permanent Difference<br/>Amount:</div>
          <div style="float:left;clear:none;width:118mm;">
            <br/><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/OtherPermanentDifferenceAmount"/>
            </xsl:call-template>
          </div>
        </div>
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
