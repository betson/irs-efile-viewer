<?xml version="1.0" encoding="UTF-8"?>
<!-- This form by Doug Peterson 6-14-2006 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/AllowableSEExpenseExplnStmt"/>
  <xsl:param name="DependencyData" select="$RtnDoc/AllowableSEExpenseExplnStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
    <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
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
        <style type="text/css">
                  </style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
      <body class="styBodyClass">
        <div style="width: 187mm; height: 5mm; clear: left; float: left;">
        <xsl:call-template name="DocumentHeaderDependency"/>
        </div>  
        <div class="styDepTitleLine" style="width: 187mm; height: 5mm; clear: left; float: left; margin-bottom: 1.5mm;">
          <div class="styDepTitle" style="width:auto;"> 
            <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
			<xsl:if test="$FormData/ExplanationTxt">
				<div class="styTopSectionLine" style="width: 187mm; height: 4.5mm; margin-top:0px; clear: left; float: left;">
					<div class="styTopSectionLineLbl" style="float:left; ">
					  <b>Explanation: </b>
				</div>
				</div>
				<div class="styExplanationLine" style="width: 186mm; height: 4mm; text-align: justify; font-size: 10pt; float: right; padding-right: 2mm;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormData/ExplanationTxt"/>
					  </xsl:call-template>
				</div>
			</xsl:if>
        <br/>      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>