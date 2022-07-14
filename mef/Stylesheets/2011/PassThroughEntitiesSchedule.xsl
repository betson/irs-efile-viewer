<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/PassThroughEntitiesSchedule"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="PassThroughEntitiesScheduleTemp">
    <table id="PassThroughEntitiesScheduleTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="text-align:center">Name</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">EIN</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">EOY Profit-Sharing Percentage</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">EOY Loss-Sharing Percentage</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/PassThroughItem">
          <!-- set row background -->
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <!-- Name -->
            <td class="styDepTblCell" style="width: 64mm;text-align:left;">
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
            <!-- EIN -->
            <td class="stydepTblCell" style="width:64mm;text-align:center;">
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
            </td>
            <!-- EOYProfitSharingPercentage-->
            <td class="stydepTblCell" style="width:64mm;text-align:center;">
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="EOYProfitSharingPercentage"/>
              </xsl:call-template>
            </td>
            <!-- EOYLossSharingPercentage-->
            <td class="stydepTblCell" style="width:64mm;text-align:center;">
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="EOYLossSharingPercentage"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <!-- Next template to display ItemRelatingReportableTransSch -->
  <xsl:template name="PassThroughEntitiesScheduleTemp2">
    <table id="PassThroughEntitiesScheduleTbl2" class="styDepTblLandscape" style="font-family:'verdana' ">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:50mm;">Income (Loss) per Income Statement Amount</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Temporary Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Permanent Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="width:51mm;">Other Permanent Differences for Allocations to Non-ECI and ECI</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Income (Loss) per Tax Return Amount</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/PassThroughItem">
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:51mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherPermanentDifferenceAmount"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount"/>
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
            <span style="width:90mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="PassThroughEntitiesScheduleTemp"/>
        <br/>
        <br/>
        <xsl:call-template name="PassThroughEntitiesScheduleTemp2"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
