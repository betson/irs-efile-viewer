<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/MortgEtcPyblGT1Yr3rdPrtyLiabSc"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="MortgEtcPyblGT1Yr3rdPrtyLiabSc">
    <table id="GeneralDependencyTbl" class="styDepTblLandscape">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:75mm;text-align:center;" scope="col">Corporation Name</th>
        <th class="styDepTblCell" style="width:20mm;text-align:center;" scope="col">Corporation EIN</th>
        <th class="styDepTblCell" style="width:40mm;text-align:center;" scope="col">Explanation</th>
        <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Begining Amount</th>
        <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Ending Amount</th>
      </tr>
      <xsl:for-each select="$DependencyData/MortgEtcPyblGT1Yr3rdPrtyInfo">
        <!-- set row background  -->
        <tr>
          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
						    	</xsl:when><xsl:otherwise>styDepTblRow2
							</xsl:otherwise></xsl:choose></xsl:attribute>
          <!-- Corporation Name -->
          <td class="styDepTblCell" style="text-align:left;width:70mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
            </xsl:call-template>
            <xsl:if test="CorporationName/BusinessNameLine2 != ''">
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
              </xsl:call-template>
            </xsl:if>
          </td>
          <!-- Corporation EIN -->
          <td class="styDepTblCell" style="width:25mm;text-align:center">
            <xsl:choose>
              <xsl:when test="normalize-space(CorporationEIN)">
                <span style="text-align:center">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                </xsl:call-template>
                <span style="width: 2px"/>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <!-- Description -->
          <td class="stydepTblCell" style="width:40mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/Description"/>
            </xsl:call-template>
          </td>
          <!-- Beginning Amount -->
          <td class="styDepTblCell" style="text-align:left; text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/BeginingAmount"/>
            </xsl:call-template>
          </td>
          <!-- Ending Amount -->
          <td class="styDepTblCell" style="text-align:left; text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/EndingAmount"/>
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
        <meta name="Author" content="Dependency Creator v1.0"/>
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
        <div class="styTopSectionLine">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
          <xsl:with-param name="NoGap" select="'true'"/>
        </xsl:call-template>
        <xsl:call-template name="MortgEtcPyblGT1Yr3rdPrtyLiabSc"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
