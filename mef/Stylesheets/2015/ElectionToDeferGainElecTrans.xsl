<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/ElectionToDeferGainElecTrans"/>
  <!-- Common Form Displays as -  Election to Defer Gain From Qualifying Electric Transmission Transactions - --> 
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
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Property Description:</span>			  
		  </div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PropertyDesc"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Date of the Qualifying Transaction:</span></div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$DependencyData/QualifyingTransactionDt"/>
            </xsl:call-template>
          </div>
        </div>
	<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Amount of Proceeds Realized:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/RealizedProceedsAmt"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Amount of Gain Realized:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/RealizedGainAmt"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Description of Any Exempt Utility Property Purchased:</span></div>
          <div class="styExplanationLine" style="padding-top:3mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/ExemptUtilityPropPrchsDesc"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Cost of Exempt Utility Property Purchased:</span></div>
          <div style="float:left;clear:none;padding-top:2mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/CostExemptUtilityPropPrchsAmt"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Date of Purchase of Exempt Utility Property:</span></div>
          <div style="float:left;clear:none;padding-top:2mm;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$DependencyData/ExemptUtilityPropPrchsDt"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Name of Purchaser:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PurchaserPersonNm"/>
            </xsl:call-template>
          </div>
        </div>
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
			  <span class="styTopSectionLineLbl">Representation Indicating the Total Cost of Exempt Utility Property the Taxpayer Intends to Purchase:</span>
		  </div>
          <div class="styExplanationLine" style="padding-top:11mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/TotExemptUtilityPropPrchsDesc"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>