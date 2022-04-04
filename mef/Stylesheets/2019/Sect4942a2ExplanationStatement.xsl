<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependancyData" select="$RtnDoc/Sect4942a2ExplanationStatement"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependancyData"/></xsl:call-template>  
  </xsl:param>  
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title>
           <!--Total Carryover of Foreign Taxes Schedule-->
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
         <meta name="Author" content="Jason Iozzo"/>
         <!--meta name="Description" content="Total carryover of foreign taxes schedule" /-->
         <meta name="Description" content="{$depDocTitle}"/>  
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
      <!-- NameDisplay - IRS990PF - Section 4942(a)(2) Explanation Statement -->
      <body class="styBodyClass">  
        <xsl:call-template name="DocumentHeaderDependency"/>
          
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="padding-right:5mm">
            <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependancyData"/>
        </xsl:call-template>    
        
        <div class="styTopSectionLine" style="clear:both">  
          <div class="styTopSectionLineLbl" style="float:left">
            <b>Explanation: </b>
          </div>
          <div class="styExplanationLine" style="float:left">  
            <xsl:call-template name="PopulateText">
            	<xsl:with-param name="TargetNode" select="$DependancyData/ShortExplanationTxt"/>
            </xsl:call-template>                     
          </div>                  
        </div>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>