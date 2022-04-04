<?xml version="1.0" encoding="UTF-8"?>
<!-- This form by Doug Peterson 6-19-2006 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/Section754Election"/>
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
          <span class="styDepTitle" style="width:100mm;">
            <span><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
       
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Name of Partnership:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/Section754Election/PartnershipName/BusinessNameLine1Txt"/>
            </xsl:call-template><br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/Section754Election/PartnershipName/BusinessNameLine2Txt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
        
                 <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">Partnership Address:</div>
          <div style="float:left;clear:none;width:118mm;">
         <xsl:if test="$RtnDoc/Section754Election/PartnershipUSAddress!= ''">
        		
                    <xsl:call-template name="PopulateUSAddressTemplate"><xsl:with-param name="TargetNode" select="$RtnDoc/Section754Election/PartnershipUSAddress"/></xsl:call-template>
              </xsl:if>             
              
               <xsl:if test="$RtnDoc/Section754Election/PartnershipForeignAddress!= ''">
                    <xsl:call-template name="PopulateForeignAddressTemplate"><xsl:with-param name="TargetNode" select="$RtnDoc/Section754Election/PartnershipForeignAddress"/></xsl:call-template>
              </xsl:if>
              </div>
        </div><br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 754 Declaration:</div>
          <div style="width:187mm;padding-top:2mm;float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/Section754Election/Section754DeclarationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
       
    
     
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>