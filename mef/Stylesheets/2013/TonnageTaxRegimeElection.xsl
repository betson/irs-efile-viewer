<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/TonnageTaxRegimeElection"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
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
  
        <xsl:call-template name="DocumentHeaderDependency"/>
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:87mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
        
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Corporation Name:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2"/>
            </xsl:call-template>

            
          </div>
          </div>
          
             <div class="styTopSectionLine" style="width:187mm;">
           <xsl:choose>
              <xsl:when test="$DependencyData/CorporationUSAddress">

           <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Electing Corporation U.S. Address:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateUSAddressTemplate">
              <xsl:with-param name="TargetNode" select="$DependencyData/CorporationUSAddress"/>
            </xsl:call-template>
          </div>
           </xsl:when>
              <xsl:otherwise>
 
           <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Electing Corporation Foreign Address:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateForeignAddressTemplate">
              <xsl:with-param name="TargetNode" select="$DependencyData/CorporationForeignAddress"/>
            </xsl:call-template>
          </div>
           </xsl:otherwise>
            </xsl:choose> 
            </div>   


  
        <div class="styTopSectionLine" style="width:187mm;">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">
             Electing Corporation EIN:</span></div>
             <div style="float:left;clear:none;">
              <xsl:call-template name="PopulateEIN">
               <xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
            </xsl:call-template>
            
                 <xsl:if test="$DependencyData/MissingEINReasonCd !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReasonCd"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
            
          </div>
         </div>
     
   <div class="styTopSectionLine" style="width:187mm;">
            <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">
             Taxable Year Which Election is Being Made:</span></div>
             <div style="float:left;clear:none;">
              <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$DependencyData/TaxYr"/>
            </xsl:call-template>
          </div>
         </div>
    
        <br/>  
            
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>