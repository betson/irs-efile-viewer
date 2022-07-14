<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />  
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
    
  <xsl:param name="DependencyData" select="$RtnDoc/GrossForeignDivNotPrevTaxedSch" />
  
  <!-- Template to display Gross Foreign Dividends Not Previously Taxed Schedule-->
  
  <xsl:template name="ShowDependencyData">
    <!-- Gross Foreign Dividends Not Previously Taxed Schedule Data -->
    <table class="styDepTblLandscape" style="font-size:7pt" >
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:56mm">Name</th>        
           <th class="styDepTblCell" scope="col" style="width:35mm">Class of voting</th>
           <th class="styDepTblCell" scope="col" style="width:15mm">EIN</th> 
           <th class="styDepTblCell" scope="col" style="width:22mm">Percentage of Stock Class</th>    
           <th class="styDepTblCell" scope="col" style="width:32mm">Income (Loss) per Income Statement Amount</th>    
           <th class="styDepTblCell" scope="col" style="width:32mm">Temporary Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:32mm">Permanent Difference Amount</th>        
           <th class="styDepTblCell" scope="col" style="width:32mm">Income (Loss) per Tax Return Amount</th>            
        </tr>
      </thead>
        <tfoot></tfoot>
       <tbody>
        <xsl:for-each select="$DependencyData/PartnershipGFDNPTItem">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:50mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name"/>
              </xsl:call-template>                  
            </td>
            <td class="styDepTblCell" style="width:50mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ClassOfVoting"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell"  style="width:15mm;text-align:center">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>
            </td> 
            <td class="styDepTblCell"  style="width:22mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PercentageOfStockClass"/>
              </xsl:call-template>
            </td>                
            <td class="styDepTblCell" style="width:26mm;text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount"/>
              </xsl:call-template>
            </td>   
            <td class="styDepTblCell" style="width:26mm;text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount"/>
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:26mm;text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount"/>
              </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:26mm;text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount"/>
              </xsl:call-template>
            </td>         
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
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
      <body class="styBodyClass" >      
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>          
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="width:76mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>                
        <xsl:call-template name="ShowDependencyData" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







