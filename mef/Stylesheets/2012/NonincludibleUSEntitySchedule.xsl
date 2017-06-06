<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/NonincludibleUSEntitySchedule"/>
  <!-- Share Common Dependency - Nonincludible U.S. Entity Schedule -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="NonincludibleUSEntitySheduleTemp2">
    <table id="NonincludibleUSEntityScheduleTbl2" class="styDepTblLandscape" style="font-size: 8pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;" >EIN</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">Net Income (Loss) Amount</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;">Total Assets</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;">Total Liabilities</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;">Net Amounts</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/NonincludibleUSEntity">
          <!-- set row background -->
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <!-- Name - Column 1-->
            <td class="styDepTblCell" style="width:106mm; text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="Name/BusinessNameLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <!-- EIN - Column 2 -->
            <td class="stydepTblCell" style="width: 30mm; text-align:center;padding-top:3mm">
              <span style="width:21mm;text-align:center;">
                <xsl:choose>
                  <xsl:when test="EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </td>
            <!-- Net Income (Loss) Amount - Column 3 -->
            <td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NetIncomeLossAmount"/>
              </xsl:call-template>
            </td>
            <!-- Total Assets - Column 4 -->
            <td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalAssets"/>
              </xsl:call-template>
            </td>
            <!-- Total Liabilities - Column 5 -->
            <td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalLiabilites"/>
              </xsl:call-template>
            </td>
            <!-- Net Amounts - Column 6 -->
            <td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NetAmounts"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
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
        <meta name="Author" content="Trin Xue"/>
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:95mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="NonincludibleUSEntitySheduleTemp2"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
