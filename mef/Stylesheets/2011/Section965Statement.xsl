<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/Section965Statement" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
 
    <xsl:template name="Section965Statement">
    
     <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="width:65mm;float:left;clear:both;">
          Pursuant to section 965(b)(4) and notice 2005-10 statement:</div>
          <div style="float:left;clear:right;">            
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/PursuantSect965b4AndNtc200510"/>
          </xsl:call-template>
        </div>
        </div> 
        
   
     <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="width:65mm;float:left;clear:both;">
        Description of any permitted investment made during the taxable year:</div>
          <div style="float:left;clear:right;">            
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/PrmtInvstDuringTaxableYear"/>
          </xsl:call-template>
        </div>
        </div> 
        
   
     <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="width:65mm;float:left;clear:both;">
       Permitted Investments Were Alternative Investments:</div>
          <div style="float:left;clear:right;">            
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/PrmtInvstWereAlternativeInvst"/>
          </xsl:call-template>
        </div>
        </div> 
        
  
     <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="width:65mm;float:left;clear:both;">
             Additional information:</div>
          <div style="float:left;clear:right;">            
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/AdditionalInformation"/>
          </xsl:call-template>
        </div>
        </div> 
       
    
  </xsl:template>  
  

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
         <meta name="Author" content="Trin Xue" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
        </script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:73mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
                            <xsl:call-template name="PopulateDepCommonLeftover">
                                <xsl:with-param name="TargetNode" select="$DependencyData" />
                              </xsl:call-template>
                      
                    <xsl:call-template name="Section965Statement" />
               
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

