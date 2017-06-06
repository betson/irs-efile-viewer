<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/IRSPayment"/>
   <!-- - Common form displays as - IRS Payment - -->
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
        <meta name="Author" content="Venkata Boggavarapu :: boggav@us.ibm.com"/>
        <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
		  <xsl:if test="not($Print) or $Print=''">
			<xsl:call-template name="AddOnStyle"/>    
		  </xsl:if>
		</style>
		<xsl:call-template name="GlobalStylesDep"/>
	  </head>
      <body class="styBodyClass" style="width:187mm;">
        <xsl:call-template name="DocumentHeaderDependency"/>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="padding-right:2mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
          <!-- Transform IRS Corporate Payment-->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Routing Transit Number: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/RoutingTransitNum"/>
            </xsl:call-template>
           </div>                  
        </div>
          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Bank Account Number: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/BankAccountNum"/>
            </xsl:call-template>
           </div>                  
        </div>
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Type of Account: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:if test="$DependencyData/BankAccountTypeCd=1">Checking</xsl:if>
              <xsl:if test="$DependencyData/BankAccountTypeCd=2">Savings</xsl:if>
          </div>                  
        </div>
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Payment Amount in Dollars and Cents: </div>
          </div><br/>
          <div class="styExplanationLine" style="float:left">          
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="MaxSize" select="11"/>
              <xsl:with-param name="TargetNode" select="$DependencyData/PaymentAmt"/>
            </xsl:call-template>
          </div>                  
        </div>
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Requested Payment Date: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/RequestedPaymentDt"/>
            </xsl:call-template>
            </div>                  
        </div>
          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Taxpayer's Daytime Phone Number: </div>
          </div><br/>
          <div class="styExplanationLine" style="float:left">          
               <xsl:call-template name="PopulatePhoneNumber">
              <xsl:with-param name="TargetNode" select="$DependencyData/TaxpayerDaytimePhoneNum"/>
            </xsl:call-template>
            </div>                  
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>