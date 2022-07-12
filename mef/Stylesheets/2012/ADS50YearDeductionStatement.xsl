<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl" />
  <xsl:include href="CommonPathRef.xsl" />
  <xsl:include href="AddHeader.xsl" />
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/ADS50YearDeductionStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Header info -->
  
  <!-- Because of the schema changes from 2001 to 2002 the following dep got changed to a recurring structure.-->
  
    <xsl:template name="DependencyTemplate">
    <table id="ADSYTbl" class="styDepTbl" >
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">Month and Year Placed in Service</th>
           <th class="styDepTblCell" scope="col">Basis for Depreciation</th>
           <th class="styDepTblCell" scope="col">Recovery Period</th>
           <th class="styDepTblCell" scope="col">Convention</th>
           <th class="styDepTblCell" scope="col">Method</th>
           <th class="styDepTblCell" scope="col">Depreciation Deduction</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/ADS50YearDeductionInfo">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" style="text-align:center;" nowrap="nowrap">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MonthAndYearPlacedInService"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="BasisForDepreciation"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;">  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="2" /> 
                <xsl:with-param name="TargetNode" select="RecoveryPeriod" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Convention" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Method" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DepreciationDeduction" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
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

        <xsl:call-template name="DocumentHeaderDependency"  />
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:100mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>            
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div style="height:5px;"></div>
                
        <xsl:call-template name="DependencyTemplate"  />  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







