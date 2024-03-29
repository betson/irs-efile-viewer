<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/IRSPayment" />
  
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
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
         <meta name="Author" content="Venkata Boggavarapu :: boggav@us.ibm.com" />
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
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:75mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
          <!-- Transform IRS Corporate Payment-->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Routing Transit Number: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/RoutingTransitNumber" />
            </xsl:call-template>
           </div>                  
        </div>        
          
          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Bank Account Number: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/BankAccountNumber" />
            </xsl:call-template>
           </div>                  
        </div>      
           
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Type of Account: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:if test="$DependencyData/AccountType=1">Checking</xsl:if>
              <xsl:if test="$DependencyData/AccountType=2">Savings</xsl:if>
          </div>                  
        </div>        

          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Payment Amount in Whole Dollars: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="MaxSize" select="11" />
              <xsl:with-param name="TargetNode" select="$DependencyData/PaymentAmount" />
            </xsl:call-template>
             </div>                  
        </div>      

           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Requested Payment Date: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/RequestedPaymentDate" />
            </xsl:call-template>
            </div>                  
        </div>      

          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Taxpayer's Daytime Phone Number: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
               <xsl:call-template name="PopulatePhoneNumber">
              <xsl:with-param name="TargetNode" select="$DependencyData/TaxpayerDaytimePhone" />
            </xsl:call-template>
            </div>                  
        </div>      

        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Opt To Receive Email Regarding Payment: </div>
          </div>
       
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/OptToReceiveEmail" />
                </xsl:call-template>    
               <div style="float:left"> <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/OptToReceiveEmail" />
                </xsl:call-template>  
                </div>     
             
            </div>                  
        </div>      

      <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Email Address: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
               <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmailAddress" />
            </xsl:call-template>
            </div>                  
        </div>      

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







