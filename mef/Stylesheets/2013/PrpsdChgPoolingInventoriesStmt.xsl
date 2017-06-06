<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="PCPISData" select="$RtnDoc/PrpsdChgPoolingInventoriesStmt"/>
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="ShowPCPIS">
    <!-- Itemized Other Income Schedule Data -->
    <table id="PCPISTbl" class="styDepTblLandscape">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="font-size: 9pt;">Present Use Description of the Contents of the Dollar-Value Pool Used</th>
          <th class="styDepTblCell" scope="col" style="font-size: 9pt;">Present Use Base Year</th>
          <th class="styDepTblCell" scope="col" style="font-size: 9pt;">Proposed Use Description of the Contents of the Dollar-Value Pool Used</th>
          <th class="styDepTblCell" scope="col" style="font-size: 9pt;">Proposed Use Base Year</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$PCPISData/PrpsdChgPoolingInventoriesInfo">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 9pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PresentUseDollarVlPoolUsedDesc"/>
                        </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 9pt;width:13mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PresentUseBaseYr"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 9pt;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ProposedUseDolVlPoolUsedDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 9pt;width:13mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ProposedUseBaseYr"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each> 
      </tbody>
    </table>
  </xsl:template>
  
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$PCPISData"/>
      </xsl:call-template>  
    </xsl:param>
    
    <!-- Main template -->
    <xsl:template match="/">
      <html>
        <head>
          <title>
            <xsl:value-of select="$depDocTitle"/>
          </title>
          <!-- No Browser Caching -->
          <meta http-equiv="Pragma" content="no-cache"/>
          <meta http-equiv="Cache-Control" content="no-cache"/>
          <meta http-equiv="Expires" content="0"/>
          <!-- No Proxy Caching -->
          <meta http-equiv="Cache-Control" content="private"/>
          <!-- Define Character Set -->
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
          <meta name="Author" content="Chris Sinderson"/>
          <meta name="Description" content="{$depDocTitle}"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
          <xsl:call-template name="InitJS"/>
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="AddOnStyle"/>    
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesDep"/>
        </head>
        <body class="styBodyClass">
          <xsl:call-template name="DocumentHeaderDependencyLandscape"/>  
          <div class="styDepTitleLineLandscape">
            <span class="styDepTitle">
              <span style="width:70mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>    
            </span>
          </div>
          <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
            <xsl:with-param name="TargetNode" select="$PCPISData"/>
          </xsl:call-template>
          <span style="height:5px;"/>
          <!-- Transform Itemized Other Income Schedule -->
          <xsl:call-template name="ShowPCPIS"/>
          <br/>
        </body>
      </html>
    </xsl:template>
 </xsl:stylesheet>