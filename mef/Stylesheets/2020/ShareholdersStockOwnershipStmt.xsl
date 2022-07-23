<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/16/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <!--Display Dependency Root Name from Schema -->
  <xsl:param name="CCSData" select="$RtnDoc/ShareholdersStockOwnershipStmt"/>
  <!-- HINTS Dependency Title - Shareholder's Stock Ownership Statement - 8621-->
  <xsl:template name="StockOwnershipInfoTemp">
    <table id="StockOwnershipInfoTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:82mm;">Class of Stock Owned by the Shareholder at the Beginning of its Tax Year </th>
          <th class="styDepTblCell" scope="col" style="width:34mm;text-align:centered;">Number of Shares Owned by the Shareholder at the Beginning of its Tax Year</th>
          <th class="styDepTblCell" scope="col" style="width:81mm;">Change to the Number of Shares Owned </th>
          <th class="styDepTblCell" scope="col" style="width:25mm;">Date of Changes</th>
          <th class="styDepTblCell" scope="col" style="width:34mm;text-align:centered;">Number of Shares at End of Year</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$CCSData/StockOwnershipInfo">
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <!--Column 1-->
            <td class="styDepTblCell" style="width:82mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="StockClassDesc"/>
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="width:34mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BeginTaxYearSharesCnt"/>
              </xsl:call-template>
            </td>
            <!--Column 3 -->
            <td class="styDepTblCell" style="width:81mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ChangeToNumberOfSharesOwnedTxt"/>
              </xsl:call-template>
            </td>
            <!-- Column 4 -->
            <td class="styDepTblCell" style="width:25mm;text-align:center;">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="ChangeDt"/>
              </xsl:call-template>
            </td>
            <!-- Column 5 -->
            <td class="styDepTblCell" style="width:34mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="EndTaxYearSharesCnt"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$CCSData"/>
    </xsl:call-template>
  </xsl:param>
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
        <meta name="Author" content="Ravi Venigalla"/>
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
        <div class="styDepTitleLineLandscape " style="width:256mm">
          <span class="styDepTitle" style="width:256mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$CCSData"/>
        </xsl:call-template>
        <xsl:call-template name="StockOwnershipInfoTemp"/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>