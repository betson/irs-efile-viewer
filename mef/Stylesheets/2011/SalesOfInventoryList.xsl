<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
<!-- change -->    
  <xsl:param name="Form990DepsData" select="$RtnDoc/SalesOfInventoryList" />
<!-- end change -->
    
    
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>  
  </xsl:param>

  <!-- Template to display dependency schedule -->
  <xsl:template name="ShowDS">
    <!-- Itemized dependency Schedule -->
    <table id="DSTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
<!-- change -->    
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Category</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Gross Sales</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Cost of Goods Sold</th>
        <th class="styDepTblCell" scope="col">Net (Gross Sales Minus<br/> Cost of Goods Sold)</th>
      </tr>          
      <xsl:for-each select="$Form990DepsData/SaleOfInventory">
<!-- end change -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>    
<!-- change -->    
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Category" /></xsl:call-template>             
          </td>                                    
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="GrossSales" /></xsl:call-template>             
          </td>                                    
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="CostOfGoodsSold" /></xsl:call-template>             
          </td>                                    
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Net" /></xsl:call-template>             
          </td>                                    
<!-- end change -->    
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
         <meta name="Author" content="lshen@us.ibm.com" />
<!-- change -->    
         <meta name="Description" content="{$depDocTitle}" />
<!-- end change -->    
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
<!-- change -->    
            <xsl:value-of select="$depDocTitle" />&nbsp;
<!-- end change -->    
          </span>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$Form990DepsData" /></xsl:call-template>
        
        <br/>            
        <xsl:call-template name="ShowDS" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







