<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl" />
  <xsl:include href="CommonPathRef.xsl" />
  <xsl:include href="AddHeader.xsl" />
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/CarryforwardGeneralBusinessCr" />
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <xsl:param name="DepTargetNode" /> 
    <xsl:param name="ColName"/>
    <!-- Itemized Other Income Schedule Data -->
    <table id="CFGBTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">
             <xsl:value-of select="$ColName" />
           </th>
           <th class="styDepTblCell" scope="col">Carry Amount Allowed</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DepTargetNode">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="CarryYear" /></xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CarryAmountAllowed" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  
  <!-- Main template -->
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
  
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine" style="float:none;clear:both;">
          <span class="styDepTitle" style="width:100mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
                  
        <div class="styTopSectionLine"><span class="styTopSectionLineLbl" style="vertical-align:top" >Credit identification:</span>
          <span style="width:110mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CreditIdentification"/>
            </xsl:call-template>
          </span>
        </div>
        
        <div class="styTopSectionLine"><span class="styTopSectionLineLbl" style="vertical-align:top;">The Tax Year the Credit Originated:</span>
          <xsl:call-template name="PopulateMonthDayYear"><xsl:with-param name="TargetNode" select="$DependencyData/TaxYearCreditOriginated"/></xsl:call-template>
        </div>
        
        
        <div class="styTopSectionLine"><span class="styTopSectionLineLbl">The Amount of the Credit:</span>
          <span style="width:32mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/CreditAmount"/>
            </xsl:call-template>
          </span>
        </div>
        <div class="styTopSectionLine"><span class="styTopSectionLineLbl">The Amount Allowed for that Year:</span>
          <span style="width:32mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/CreditAmountAllowedForYear"/>
            </xsl:call-template>
          </span>
        </div>
        <br/>
        <xsl:call-template name="DependencyTemplate" >
          <xsl:with-param name="DepTargetNode" select="$DependencyData/CarrybackCreditRemaining"/>
          <xsl:with-param name="ColName">Carryback Year </xsl:with-param> 
        </xsl:call-template>  
        <br/>    
        <xsl:call-template name="DependencyTemplate" >
          <xsl:with-param name="DepTargetNode" select="$DependencyData/CarryforwardCreditRemaining"/>
          <xsl:with-param name="ColName">Carryforward Year</xsl:with-param>
        </xsl:call-template>            
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







