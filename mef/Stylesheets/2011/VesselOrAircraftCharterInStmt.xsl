<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/VesselOrAircraftCharterInStmt"/>
  <!-- 1120F Sch-V to display Vessel Or Aircraft Chartered In Statement 5columns table -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="MAGATbl" class="styDepTblLandscape">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:30mm">Name of Vessel or aircraft</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:70mm">Name of Lessor</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:70mm">Address of Lessor</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Terms <br/>Bareboat Lease </th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Method of<br/> Calculation</th>
      </tr>
      <xsl:for-each select="$DependencyData/VesselOrAircraftCharterInInfo">
        <tr>
          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="VesselOrAircraftName"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessNameOfLessor/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessNameOfLessor/BusinessNameLine2"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:choose>
              <xsl:when test="USAddressOfLessor">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddressOfLessor"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddressOfLessor"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="width: 40mm; text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="TermOfBareboatLease"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width: 40mm; text-align:center">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MthdForCalcRntlPrtnOfPymt"/>
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
        <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <div class="styDepTitle" style="width: 120mm">
            <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <br/>
        <xsl:call-template name="DependencyTemplate"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
