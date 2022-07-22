<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/InvestmentsGovtObligationsSch" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
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
        <meta name="Author" content="Beju Ekperigin" />
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
          <span class="styDepTitle">
            <span style="width:78mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
    
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv">
            <span class="styTopSectionLineLbl">US Government Securities - End of Year Book Value:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;"><br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/USGovtSecuritiesEOYBookValue" />
              </xsl:call-template>
            </span>
          </div>
        </div>
                        
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">US Government Securities - End of Year Fair Market Value:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;"><br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/USGovtSecuritiesEOYFMV" />
              </xsl:call-template>
            </span>
          </div>
        </div>

        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">State &#x26; Local Government Securities - End of Year Book Value:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;"><br/><br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/StateLocalSecuritiesEOYBookVal" />
              </xsl:call-template>
            </span>
          </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">
              State &#x26; Local Government Securities - End of Year Fair Market Value:
            </span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;"><br/><br/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/StateLocalSecuritiesEOYFMV" />
              </xsl:call-template>
            </span>
          </div>
        </div>        
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
