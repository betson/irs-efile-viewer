<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/CurrencyConversionStatement" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="CurConvStmt">
    <xsl:for-each select="$DependencyData/CurrencyConversion">
    <table id="CurConvStmtTbl" class="styDepTbl">

<!-- Item No.   -->
    <tr class="styDepTblRow1">
<!--      <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
      <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>-->
    </tr>

<!--Reference to form-->
    <tr  class="styDepTblRow2">
      <th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">
        Reference to form in the form of "Part#, Column #, Line #"
      </th>
      <td class="styDepTblCell" style="text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReferenceToForm" />
          </xsl:call-template>
      </td>
    </tr>
<!--Amount in foreign currency-->
    <tr  class="styDepTblRow1">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
        Amount In foreign currency
      </th>
      <td class="styDepTblCell" style="text-align:left;" >
        <span style="width:44mm;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="MaxSize" select="17" />
            <xsl:with-param name="TargetNode" select="AmountInForeignCurrency" />
          </xsl:call-template>
        </span>
      </td>
    </tr>
<!--Conversion rate-->
    <tr  class="styDepTblRow2">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
        Conversion rate
      </th>
      <td class="styDepTblCell" style="text-align:left;" >
        <span style="width:44mm;text-align:right;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ConversionRate" />
          </xsl:call-template>
        </span>
      </td>
    </tr>
<!--U.S. dollar amount (as converted)-->
    <tr  class="styDepTblRow1">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
        U.S. dollar amount (As Converted)
      </th>
      <td class="styDepTblCell" style="text-align:left;" >
        <span style="width:44mm;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="USDollarAmountAsConverted" />
          </xsl:call-template>
        </span>
      </td>
    </tr>
<!--Explanation of conversion rate (i.e., average, date paid, date accrued, spot rate, year-end)-->
    <tr  class="styDepTblRow2">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
        Explanation of conversion rate (i.e., average, date paid, date accrued, spot rate, year-end)
      </th>
      <td class="styDepTblCell" style="text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationOfConversionRate" />
          </xsl:call-template>
      </td>
    </tr>
    </table><br/>
    </xsl:for-each>
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
         <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com" />
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
            <span style="width:93mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>

        <!-- Transform Controlled Foreign Partnership Reporting Statement -->
        <xsl:call-template name="CurConvStmt" />    

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







