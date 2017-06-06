<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl" />
  <xsl:include href="AddHeader.xsl" />
  <xsl:include href="AddOnTable.xsl" />
  <xsl:include href="PopulateTemplate.xsl" />
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/MortgEtcPyblGT1Yr3rdPrtyLiabSc" />
  <!--HINTS - Display name is Mortgages etc. Payable Greater Than 1 Year Third-Party Liabilities Schedule- 1120F -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="MortgEtcPyblGT1Yr3rdPrtyLiabScTemp">
  <table id="GeneralDependencyTbl" class="styDepTblLandscape">
    <tr class="styDepTblHdr">
          <th class="styDepTblCell" style="width:85mm;text-align:center;" scope="col">Corporation Name</th>
      <xsl:choose>
        <xsl:when test="$DependencyData/MortgEtcPyblGT1Yr3rdPrtyInfo/CorporationEIN">
          <th class="styDepTblCell" style="width:25mm;text-align:center;" scope="col">Corporation EIN</th>
        </xsl:when>
        <xsl:otherwise>
          <th class="styDepTblCell" style="width:25mm;text-align:center;" scope="col">Missing EIN Reason</th>
        </xsl:otherwise>
      </xsl:choose>
          <th class="styDepTblCell" style="width:86mm;text-align:center;" scope="col">Mortgages etc. Payable Greater Than 1 Year Third-Party Liabilities Description</th>
          <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Beginning Amount</th>
          <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Ending Amount</th>
    </tr>
    <tfoot/>
    <tbody>
    <xsl:for-each select="$DependencyData/MortgEtcPyblGT1Yr3rdPrtyInfo">
      <tr>
        <!--Set row alternate background color -->
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <!--Set row alternate background color -->
         <!--Column 1 - Corporation Name -->
          <td class="styDepTblCell" style="width:85mm;text-align:left;vertical-align:middle;font-size:7pt">
            <!--Allow row to expand by column -->
            <xsl:attribute name="rowspan">
              <xsl:value-of select="count(MortgEtcPyblGT1Yr3rdPrtyLnItem)"></xsl:value-of>
            </xsl:attribute>
            <!--Allow row to expand by column -->
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
            </xsl:call-template>
            <span class="styTablecellpad"/>
          </td>
          <!--Column 1 - Corporation Name -->
          <!--Column 2 - Corporation EIN or Missing EIN Reason -->
          <xsl:choose>
            <xsl:when test="CorporationEIN">
              <!--Corporation EIN -->
              <td class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;font-size:7pt">
                <!--Allow row to expand by column -->
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="count(MortgEtcPyblGT1Yr3rdPrtyLnItem)"></xsl:value-of>
                </xsl:attribute>
                <!--Allow row to expand by column -->
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="CorporationEIN" />
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Corporation EIN -->
            </xsl:when>
            <xsl:otherwise>
              <!--Missing EIN Reason -->
              <td class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;font-size:7pt">
                <!--Allow row to expand by column -->
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="count(MortgEtcPyblGT1Yr3rdPrtyLnItem)"></xsl:value-of>
                </xsl:attribute>
                <!--Allow row to expand by column -->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason" />
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Missing EIN Reason -->
            </xsl:otherwise>
          </xsl:choose>
          <!--Column 2 - Corporation EIN or Missing EIN Reason -->
          <!--Test 1 - for no data or only one instance of data - if, then fill the cell with the proper color -->
          <xsl:if test="count(MortgEtcPyblGT1Yr3rdPrtyLnItem)=0 or count (MortgEtcPyblGT1Yr3rdPrtyLnItem)=1">
            <!--Column 3 - Description -->
            <td class="styDepTblCell" style="width:86mm;text-align:left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/Description" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 3 - Description -->
            <!--Column 4 - Beginning Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/BeginingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 4 - Beginning Amount -->
            <!--Column 5 - Ending Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/EndingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 5 - Ending Amount -->
          </xsl:if>
          <!--Test 2 - if there is more than one set of data, then show the first set with Row 1 background color -->
          <xsl:if test="count(MortgEtcPyblGT1Yr3rdPrtyLnItem)&gt;1">
            <!--Column 3 - IDescription -->
            <td class="styDepTblCell" style="width:86mm;text-align:left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/Description" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 3 - IDescription -->
            <!--Column 4 - IBeginning Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/BeginingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 4 - Beginning Amount -->
            <!--Column 5 - Ending Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="MortgEtcPyblGT1Yr3rdPrtyLnItem/EndingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 5 - IEnding Amount -->
          </xsl:if>
      </tr>
      <xsl:for-each select="MortgEtcPyblGT1Yr3rdPrtyLnItem">
        <xsl:if test="position() &gt; 1">
          <tr>
            <!--Set row alternate background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!--Set row alternate background color -->
            <!--Column 3 - Description -->
            <td class="styDepTblCell" style="width:86mm;text-align:left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 3 - Description -->
            <!--Column 4 - Beginning Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="BeginingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 4 - Beginning Amount -->
            <!--Column 5 - Ending Amount -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="EndingAmount" />
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 5 - Ending Amount -->
          </tr>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
    </tbody>
  </table>
  </xsl:template>
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$depDocTitle" /></title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private" />
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="Author" content="Dependency Creator v1.0" />
        <meta name="Description" content="{$depDocTitle}" />
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS" />
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle" />
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape" />
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:190mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        <!--Add space after the header line
        <div class="styTopSectionLine">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>
        </div>-->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData" />
          <xsl:with-param name="NoGap" select="'true'" />
        </xsl:call-template>
        <xsl:call-template name="MortgEtcPyblGT1Yr3rdPrtyLiabScTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
