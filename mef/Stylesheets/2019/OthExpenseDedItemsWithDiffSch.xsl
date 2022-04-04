<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/OthExpenseDedItemsWithDiffSch"/>
  <!--  - Form Common Dependency Displays as - Other Expense/Deduction Items with Differences Schedule - -->
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
          <th class="styDepTblCell" style="width:75mm;" scope="col">Description</th>
          <th class="styDepTblCell" style="width:36mm;" scope="col">Expense per Income Statement Amount</th>
          <th class="styDepTblCell" style="width:36mm;" scope="col">Temporary Difference Amount</th>
          <th class="styDepTblCell" style="width:36mm;" scope="col">Permanent Difference Amount</th>
          <th class="styDepTblCell" style="width:36mm;" scope="col">Other Permanent Differences for Allocations to Non-ECI and ECI</th>
          <th class="styDepTblCell"  style="width:36mm;" scope="col">Deductions per Tax Return Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/OthExpenseDedItemsWithDiff">
        <tr>
          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:75mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="ExpensePerIncomeStmtAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="OtherPermanentDifferenceAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="DeductionPerTaxReturnAmt"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="width:153mm">
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