<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/OthExpenseDedItemsWithDiffSch"/>
  <!-- 1120 Common Dependency - Other Expense/Deduction Items with Differences Schedule -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Template to display OthExpenseDedItemsWithDiffSchedule table-->
  <xsl:template name="OthExpenseDedItemsWithDiffSchTemp">
    <table id="OthExpenseDedItemsWithDiffSchTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:85mm;">Description</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;">Expense per Income Statement Amount</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;">Temporary Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;">Permanent Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;">Other Permanent Differences for Allocations to Non-ECI and ECI</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;">Deductions per Tax Return Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/OthExpenseDedItemsWithDiff">
        <tr>
          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:85mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="ExpensePerIncmStatementAmount"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="OtherPermanentDifferenceAmount"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="DeductionsPerTaxReturnAmount"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
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
          <span class="styDepTitle" style="width:154mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="OthExpenseDedItemsWithDiffSchTemp"/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
