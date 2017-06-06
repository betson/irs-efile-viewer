<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/PartialIntContributionStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Template to display dependency schedule -->
  <xsl:template name="PartialIntContributionStmtTemp">
    <table id="PartialIntContributionStmtTbl" class="styDepTblLandscape" style="font-size:7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="text-align:center">Property ID Letter</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:30mm">Total Deduction Amount Claimed This Tax Year</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:30mm">Total Deduction Amount Claimed Prior Tax Years</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">Donee Name</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">Donee Address</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">Tangible Property Location</th>
          <th class="styDepTblCell" scope="col" style="text-align:center">Name of Possessor</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/PartialIntContribution">
          <!-- set row background -->
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <!-- Property ID Letter -->
            <td class="styDepTblCell" style="text-align:center;width:8mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyIdentifier"/>
              </xsl:call-template>
            </td>
            <!-- Total Deduction Amount Claimed This Tax Year -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotDedAmtClaimedThisTaxYear"/>
              </xsl:call-template>
            </td>
            <!-- Total Deduction Amount Claimed This Tax Year -->
            <td class="styDepTblCell" style="text-align:right;width:30mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotDedAmtClaimedPriorTaxYears"/>
              </xsl:call-template>
            </td>
            <!-- Donee Name -->
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="DoneeName/BusinessNameLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <!-- Donee Address -->
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DoneeAddress/AddressLine1"/>
              </xsl:call-template>
              <xsl:if test="DoneeAddress/AddressLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneeAddress/AddressLine2"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="DoneeAddress/City != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneeAddress/City"/>
                </xsl:call-template>,                
              </xsl:if>
              <xsl:if test="DoneeAddress/State != ''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneeAddress/State"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="DoneeAddress/ZIPCode != ''">
                &nbsp;
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneeAddress/ZIPCode"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <!-- Tangible Property Location -->
            <td class="styDepTblCell" style="text-align:left;width:35mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TangiblePropertyLocation"/>
              </xsl:call-template>
            </td>
            <!-- Name of Possessor -->
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfPossessor/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="NameOfPossessor/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfPossessor/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
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
            <span style="width:108mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="PartialIntContributionStmtTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
