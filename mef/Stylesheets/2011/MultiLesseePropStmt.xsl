<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="CCSData" select="$RtnDoc/MultiLesseePropStmt"/>
  <!-- HINTS: Multiple Lessee Property Statement for form 3468-->
  <xsl:template name="ShowData">
    <table id="QRCTbl" class="styDepTblLandscape" style="text-align:center;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:69mm;">Name of Lessor </th>
          <th class="styDepTblCell" scope="col" style="width:76mm;">Address of Lessor </th>
          <th class="styDepTblCell" scope="col" style="width:76mm;">Description of Property </th>
          <th class="styDepTblCell" scope="col" style="width:35mm;">Amount Treated as Acquired Property</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$CCSData/MultipleLesseeProperty">
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <td class="styDepTblCell" style="text-align:left;padding-top:8mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfLessor"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
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
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;padding-top:8mm;" >
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="AmountTreatedAsAcquiredProp"/>
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
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:106mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$CCSData"/>
        </xsl:call-template>
        <xsl:call-template name="ShowData"/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
