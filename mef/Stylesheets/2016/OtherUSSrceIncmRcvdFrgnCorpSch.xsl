<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/OtherUSSrceIncmRcvdFrgnCorpSch"/>
  <!-- - Common Form Display name is - Other U.S. Source Income Received by Foreign Corporation Schedule -  -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
  <!-- New -->
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
         <meta name="Desc" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
                  </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"/>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass" style="width:187mm;">
        <xsl:call-template name="DocumentHeaderDependency"/>  
         <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Description:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Desc"/>
            </xsl:call-template>
          </div>
        </div>
                <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Amount of income:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/IncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Tax Rate:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/TaxRt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Amount of Tax:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/TaxAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>