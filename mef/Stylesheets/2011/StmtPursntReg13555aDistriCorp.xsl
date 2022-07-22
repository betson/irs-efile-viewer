<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/StmtPursntReg13555aDistriCorp"/>
  <!-- 1120 Common Dependency - Statement Pursuant To Reg 1.355-5(a) By a Distributing Corporation Statement -->
  <!-- Main template begin -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Main template end-->
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
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css"/>
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
            <span style="width:200mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <!-- Name Of Controlled Corporation -->
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Name Of Controlled Corporation:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NameOfControlledCorporation/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NameOfControlledCorporation/BusinessNameLine2"/>
            </xsl:call-template>
          </div>
        </div>
        <!--EIN of Controlled Corporation -->
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">EIN of Controlled Corporation:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:choose>
              <xsl:when test="$DependencyData/EINOfControlledCorporation">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/EINOfControlledCorporation"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReason"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <!-- Statement Required if Reg. 1.355-5(a)(2) Applies -->
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Statement Required if Reg. 1.355-5(a)(2) Applies:</span>
          </div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/StmtRqrIfReg13555a2Applies"/>
            </xsl:call-template>
          </div>
        </div>
        <!--TABLE BEGIN -->
        <table id="StmtPursntReg13555aTbl" class="styDepTblLandscape">
          <thead class="styTableThead">
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col" style="width:54mm;">Business Name or Person Name of Every Significant Distributee</th>
              <th class="styDepTblCell" scope="col" style="width:28mm;">TIN of Every Significant Distributee</th>
              <th class="styDepTblCell" scope="col" style="width:24mm;">Date of Distribution of The Stock or Securities</th>
              <th class="styDepTblCell" scope="col" style="width:34mm;">Aggregate Fair Market Value Determined Immediately Before the Distribution</th>
              <th class="styDepTblCell" scope="col" style="width:34mm;">Aggregate Basis Determined Immediately Before the Distribution</th>
              <th class="styDepTblCell" scope="col" style="width:54mm;">Control Number of The Private Letter Ruling(s) Issued by The IRS in Connection With The Transaction</th>
              <th class="styDepTblCell" scope="col" style="width:24mm;">Date of The Private Letter Ruling(s) Issued by The IRS in Connection With The Transaction</th>
            </tr>
          </thead>
          <xsl:for-each select="$DependencyData/StmtPursntReg13555a">
            <tr>
              <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
              <!--Business Name or Person Name of Every Significant Distributee -->
              <td class="styDepTblCell" style="width:54mm;text-align:left;">
                <xsl:choose>
                  <xsl:when test="BusNameSignificantDistributee">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="BusNameSignificantDistributee/BusinessNameLine1"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space(BusNameSignificantDistributee/BusinessNameLine2)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusNameSignificantDistributee/BusinessNameLine2"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="PrsnNameSignificantDistributee"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <!-- EIN, Missing EIN Reason, or SSN of Every Significant Distributee -->
              <td class="styDepTblCell" style="width:28mm;text-align:center;">
                <xsl:choose>
                  <xsl:when test="TINOfAllSignificantDistributee/SSNOfAllSignificantDistributee">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="TINOfAllSignificantDistributee/SSNOfAllSignificantDistributee"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="TINOfAllSignificantDistributee/EINOfAllSignificantDistributee">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="TINOfAllSignificantDistributee/EINOfAllSignificantDistributee"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="TINOfAllSignificantDistributee/MissingEINReason  "/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <!-- Date of Distribution of The Stock or Securities -->
              <td class="styDepTblCell" style="width:26mm;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="DateOfDistribution"/>
                </xsl:call-template>
              </td>
              <!-- Aggregate Fair Market Value Determined Immediately Before the Distribution -->
              <td class="styDepTblCell" style="width:34mm;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AggregateFairMarketValue"/>
                </xsl:call-template>
              </td>
              <!-- Aggregate Basis Determined Immediately Before the Distribution -->
              <td class="styDepTblCell" style="width:34mm;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AggregateBasis"/>
                </xsl:call-template>
              </td>
              <!-- Control Number of The Private Letter Ruling(s) Issued by The IRS in Connection With The Transaction -->
              <td class="styDepTblCell" style="width:54mm;text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ControlNumOfPLRIssuedByIRS"/>
                </xsl:call-template>
              </td>
              <!-- Date of The Private Letter Ruling(s) Issued by The IRS in Connection With The Transaction -->
              <td class="styDepTblCell" style="width:26mm;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="DateOfPLRIssuedByIRS"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
