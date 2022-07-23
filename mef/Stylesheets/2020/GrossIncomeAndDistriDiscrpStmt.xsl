<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/GrossIncomeAndDistriDiscrpStmt"/><!--Schema Root Name-->
  <!-- - Form 972 displays as - Gross Income and Consent Distribution Discrepancy Statement - -->
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
        <!-- Dependency Yellow Title Bar --> 
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="padding-right:2mm;">
            <span><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <!-- Explanation Line-->
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Explanation:</span></div>
          <div style="float:left;clear:none;width:187mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/ExplanationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>