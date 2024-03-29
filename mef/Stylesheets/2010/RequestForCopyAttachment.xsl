<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/RequestForCopyAttachment" />
  
  <!-- Main template -->
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

        <xsl:call-template name="DocumentHeaderDependency" />  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:88mm;"><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Copy Receiver Government Code:</div>
          <div class="styExplanationLine">
            <xsl:for-each select="$DependencyData/CopyReceiverGovtCode">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="."/>
              </xsl:call-template>
              <!-- If this is not the last Gov't Code, put in a comma -->
              <xsl:if test="position() != count($DependencyData/CopyReceiverGovtCode)">, </xsl:if>
            </xsl:for-each>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Name of person making the consent:</div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Name"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Title of person making the consent:</div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Title"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">PIN:</div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PIN"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Date:</div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Date"/>
            </xsl:call-template>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







