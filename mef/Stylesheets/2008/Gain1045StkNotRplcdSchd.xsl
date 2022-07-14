<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/Gain1045StkNotRplcdSchd" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="Gain1045StkNotRplcdSchdTemp">
    <table id="Gain1045StkNotRplcdSchdTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
<!--          <th class="styTblCell" scope="col">Item No.</th>       -->
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Name of Corporation That Issued Stock</th>
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Partner’s Share of Partnership’s Adjusted Basis</th>
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Sales Price of Stock</th>           
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Date Stock Purchased</th>
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Date Stock Sold</th>

<!--New Fields-->                       
           <th class="styDepTblCell"  scope="col" style="font-size: 7pt">Partner's Distributive Share of Gain</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/Gain1045StkNotRplcd">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
<!--          <td class="styDepTblCell" style="text-align:center;" >
            <xsl:value-of select="position()" />
          </td> -->
          <td class="styDepTblCell" style="text-align:left;width:75mm;font-size: 7pt" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="NameOfCorpThatIssuedStock/BusinessNameLine1" />
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="NameOfCorpThatIssuedStock/BusinessNameLine2" />
            </xsl:call-template>
            <span style="width:22mm"></span>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:40mm;font-size: 7pt" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PartnersSharePrtshpsAdjBasis" />
            </xsl:call-template>
            <span style="width:22mm"></span>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;font-size: 7pt" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="SalesPriceOfStock" />
            </xsl:call-template>          
            <span style="width:22mm"></span>
          </td>                    
          <td class="styDepTblCell" style="text-align:center;width:25mm;font-size: 7pt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="DateStockPurchased" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:25mm;font-size: 7pt" >
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="DateStockSold" />
            </xsl:call-template>
            <span style="width:13mm"></span>
          </td>
          
<!--New Fields-->                                 
          <td class="styDepTblCell" style="text-align:right;width:35mm;font-size: 7pt" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PartnershipShareOfGain" />
            </xsl:call-template>
            <span style="width:22mm"></span>
          </td>
        </tr>
      </xsl:for-each>
    </table>
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
            <span style="width:86mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>

        <!-- Transform Controlled Foreign Partnership Reporting Statement -->
        <xsl:call-template name="Gain1045StkNotRplcdSchdTemp" />    

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







