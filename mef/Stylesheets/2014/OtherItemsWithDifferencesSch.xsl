<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/OtherItemsWithDifferencesSch"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="OtherItemsWithDifferencesScheduleTemp">
    <table id="OtherItemsWithDifferencesScheduleTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col">Description</th>
              <th class="styDepTblCell" scope="col">Income (loss) per income statement</th>
              <th class="styDepTblCell" scope="col">Temporary difference</th>
              <th class="styDepTblCell" scope="col">Permanent difference</th>
              <th class="styDepTblCell" scope="col">Income (loss) per tax return</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/OthItemsWithDifferencesDescGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
              <td class="styDepTblCell" style="text-align:left;font-size:7pt;">
                <span style="text-align:left;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
                  </xsl:call-template>
                </span>
              </td>          
              <td class="styDepTblCell" style="text-align:right;width: 34mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styDepTblCell" style="text-align:right;width: 34mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styDepTblCell" style="text-align:right;width: 34mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styDepTblCell" style="text-align:right;width: 34mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmt"/>
                  </xsl:call-template>
                </span>
              </td>
       </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$depDocTitle"/></title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Beju Ekperigin"/>
        <meta name="ShortExplanationTxt" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
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
            <span class="styDepTitle">
              <span style="width:80mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="OtherItemsWithDifferencesScheduleTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>