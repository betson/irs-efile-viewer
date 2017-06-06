<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/Section631aAttachment" />

  <xsl:template name="ShowAOVSS">
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$AOVSSData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
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
         <meta name="Author" content="Chris Sinderson" />
         <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
      
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:45mm">          
            <xsl:value-of select="$depDocTitle" />  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$AOVSSData" /></xsl:call-template>      

        <div class="styTopSectionLine">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 28 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine28Info"/>
            </xsl:call-template>            
          </div>
          <br /><br />
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 29 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine29Info"/>
            </xsl:call-template>            
          </div>
          <br /><br />
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 30 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine30Info"/>
            </xsl:call-template>            
          </div>
          <br /><br />
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 31 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine31Info"/>
            </xsl:call-template>            
          </div>
          <br /><br />
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 32 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine32Info"/>
            </xsl:call-template>            
          </div>
          <br /><br />
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Form T Part II Line 33 Info:</span></div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$AOVSSData/FormTPartIILine33Info"/>
            </xsl:call-template>            
          </div>
        </div>
                  
        <xsl:call-template name="ShowAOVSS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>