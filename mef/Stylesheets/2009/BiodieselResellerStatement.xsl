<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/BiodieselResellerStatement" />
  <!--Display name is Biodiesel Reseller Statement -->
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
          <span class="styDepTitle" style="width:88mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData/CertForBiodieselReseller"/>
        </xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Certificate Identification Number:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CertForBiodieselReseller/CertificateIdNumber"/>
            </xsl:call-template>
          </div>
        </div>
	 <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Gallons of Biodiesel:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CertForBiodieselReseller/TotalGallonsofBiodiesel"/>
            </xsl:call-template>
          </div>
        </div>
	<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Gallons Claimed on Schedule 3 (Form 8849):</span></div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CertForBiodieselReseller/TotGalsClmSchedule3Form8849"/>
            </xsl:call-template>
          </div>
        </div>
	<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Gallons Claimed on Schedule C (Form 720):</span></div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CertForBiodieselReseller/TotGalsClmScheduleCForm720"/>
            </xsl:call-template>
          </div>
        </div>
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







