<?xml version="1.0" encoding="UTF-8" ?>
<!-- This form by Doug Peterson 6-14-2006 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/AMTAdjustedGainOrLossStatement" />
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
          <span class="styDepTitle" style="width:46mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Net Short Term Capital Gain/Loss :</div>
          <div style="float:left;clear:none;width:118mm;"><br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetShortTermCapitalGainLoss"/>
            </xsl:call-template>
            </div>
            </div>
            <br/>
            <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Net Short Term Capital Gain/Loss Amount:</div>
            <div style="float:left;clear:none;width:44mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetShortTermCapitalGainLossAmt"/>
            </xsl:call-template>

          </div>
        </div>
        <br />     
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Net Long Term Capital Gain/Loss:</div>
            <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetLongTermCapitalGainLoss"/>
            </xsl:call-template>

          </div>
        </div>
        <br />  
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Net Long Term Capital Gain/Loss Amount:</div>
            <div style="float:left;clear:none;width:44mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetLongTermCapitalGainLossAmt"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Collectables 28% Gain/Loss:</div>
            <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Collectables28GainLoss"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Collectables 28% Gain/Loss Amount:</div>
            <div style="float:left;clear:none;width:44mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/Collectables28GainLossAmt"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Net Section 1231 Gain/Loss</div>
            <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetSection1231GainLoss"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">NetSection 1231 Gain/Loss Amount:</div>
            <div style="float:left;clear:none;width:44mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetSection1231GainLossAmt"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Unrecaptured Section 1250 Gain:</div>
            <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/UnrecapturedSection1250Gain"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Unrecaptured Section 1250 Gain Amount:</div>
            <div style="float:left;clear:none;width:44mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/UnrecapturedSection1250GainAmt"/>
            </xsl:call-template>

          </div>
        </div>
        <br />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

     
