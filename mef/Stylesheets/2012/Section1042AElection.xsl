<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/Section1042AElection"/>
  <!--1040 sch-D - Section 1042A Election -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="Section1042AElectionTemp">
  <xsl:for-each select="$DependencyData/Section1042AElectionInfo">
    <table id="GeneralDependencyTbl" class="styDepTblLandscape">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:60mm;vertical-align:middle;" scope="col">Decription of Security</th>
        <th class="styDepTblCell" style="width:20mm;vertical-align:middle;" scope="col">Date Of Sale</th>
        <th class="styDepTblCell" style="width:25mm;vertical-align:middle;" scope="col">Amount Realized On Sale</th>
        <th class="styDepTblCell" style="width:25mm;vertical-align:middle;" scope="col">Adjusted Basis Of Securities</th>
        <th class="styDepTblCell" style="width:35mm;vertical-align:middle;" scope="col">Name Of ESOP Or Cooperative</th>
        <th class="styDepTblCell" style="width:35mm;vertical-align:middle;" scope="col">Name Of Other Taxpayers</th>
        <th class="styDepTblCell" style="width:19mm;vertical-align:middle;" scope="col">Taxpayer Identification Number</th>
        <th class="styDepTblCell" style="width:29mm;vertical-align:middle;" scope="col">Number Of Shares Sold</th>
      </tr>
      <tfoot/>
      <tbody>    
          <tr>
            <!--Set row alternate background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!--Set row alternate background color -->
            <!--Column 1 - Decription of Security -->
            <td class="styDepTblCell" style="width:40mm;text-align:left;vertical-align:top;font-size:6.5pt">
              <!--Allow row to expand by column -->
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(OtherTaxpayerInfo)"/>
              </xsl:attribute>
              <!--Allow row to expand by column -->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DescriptionOfSecuritiesSold"/>
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 1 - Decription of Security -->
            <!--Column 2 - Date Of Sale -->
            <td class="styDepTblCell" style="width:25mm;vertical-align:top;font-size:6.5pt">
              <!--Allow row to expand by column -->
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(OtherTaxpayerInfo)"/>
              </xsl:attribute>
              <!--Allow row to expand by column -->
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="DateOfSale"/>
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 2 - Date Of Sale -->
            <!--Column 3 - Amount Realized On Sale -->
            <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:6.5pt;vertical-align:top;">
              <!--Allow row to expand by column -->
              <xsl:attribute name="rowspan"><xsl:value-of select="count(OtherTaxpayerInfo)"/></xsl:attribute>
              <!--Allow row to expand by column -->
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="AmountRealizedOnSale"/>
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
           <!--Column 3 - Amount Realized On Sale -->
           <!--Column 4 - Adjusted Basis Of Securities -->
            <td class="styDepTblCell" style="width:25mm;text-align:left;vertical-align:top;font-size:6.5pt">
              <!--Allow row to expand by column -->
              <xsl:attribute name="rowspan"><xsl:value-of select="count(OtherTaxpayerInfo)"/></xsl:attribute>
              <!--Allow row to expand by column -->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AdjustedBasisOfSecurities"/>
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 4 - Adjusted Basis Of Securities -->
            <!--Column 5 - Name Of ESOP Or Cooperative -->
            <td class="styDepTblCell" style="width:35mm;text-align:left;vertical-align:top;font-size:6.5pt">
              <!--Allow row to expand by column -->
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(OtherTaxpayerInfo)"/>
              </xsl:attribute>
              <!--Allow row to expand by column -->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfESOPOrCooperative/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfESOPOrCooperative/BusinessNameLine2"/>
              </xsl:call-template>
              <span class="styTablecellpad"/>
            </td>
            <!--Column 5 - Name Of ESOP Or Cooperative -->
            <!--Test 1 - for no data or only one instance of data - if, then fill the cell with the proper color -->
            <xsl:if test="count(OtherTaxpayerInfo)=0 or count (OtherTaxpayerInfo)=1">
              <!--Column 6 - Name Of Other Taxpayers -->
              <td class="styDepTblCell" style="width:25mm;font-size:6.5pt;vertical-align:top;text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/NameOfOtherTaxpayers"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 6 -Name Of Other Taxpayers -->
              <!--Column 7 - Taxpayer Identification Number -->
              <td class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:top;font-size:6.5pt">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/TaxpayerIdentificationNumber"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 7 - Taxpayer Identification Number -->
              <!--Column 8 - Number Of Shares Sold -->
              <td class="styDepTblCell" style="width:30mm;text-align:right;vertical-align:top;font-size:6.5pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/NumberOfSharesSold"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 8 - Number Of Shares Sold -->
            </xsl:if>
            <!--Test 2 - if there is more than one set of data, then show the first set with Row 1 background color -->
            <xsl:if test="count(OtherTaxpayerInfo)&gt;1">
              <!--Column 6 - Name Of Other Taxpayers -->
              <td class="styDepTblCell" style="width:35mm;text-align:left;font-size:6.5pt;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/NameOfOtherTaxpayers"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 6 - Name Of Other Taxpayers -->
              <!--Column 7 - Taxpayer Identification Number -->
              <td class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:top;font-size:6.5pt">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/TaxpayerIdentificationNumber"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 7 - Taxpayer Identification Number -->
              <!--Column 8 - Number Of Shares Sold -->
              <td class="styDepTblCell" style="width:30mm;text-align:right;vertical-align:top;font-size:6.5pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="OtherTaxpayerInfo/NumberOfSharesSold"/>
                </xsl:call-template>
                <span class="styTablecellpad"/>
              </td>
              <!--Column 8 - Number Of Shares Sold -->
            </xsl:if>
          </tr>
          <xsl:for-each select="OtherTaxpayerInfo">
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
                <!--Column 6 - Name Of Other Taxpayers -->
                <td class="styDepTblCell" style="width:35mm;text-align:left;font-size:6.5pt;vertical-align:top;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfOtherTaxpayers"/>
                  </xsl:call-template>
                  <span class="styTablecellpad"/>
                </td>
                <!--Column 6 - Name Of Other Taxpayers -->
                <!--Column 7 - Taxpayer Identification Number -->
                <td class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:top;font-size:6.5pt">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="TaxpayerIdentificationNumber"/>
                  </xsl:call-template>
                  <span class="styTablecellpad"/>
                </td>
                <!--Column 7 - Taxpayer Identification Number -->
                <!--Column 8 - Number Of Shares Sold -->
                <td class="styDepTblCell" style="width:30mm;text-align:right;vertical-align:top;font-size:6.5pt">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NumberOfSharesSold"/>
                  </xsl:call-template>
                  <span class="styTablecellpad"/>
                </td>
                <!--Column 8 - Number Of Shares Sold -->
              </tr>
            </xsl:if>
          </xsl:for-each>
        
      </tbody>
    </table>
    </xsl:for-each>
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
            <span style="width:258mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <!--Add space after the header line-->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
          <xsl:with-param name="NoGap" select="'true'"/>
        </xsl:call-template>
        <xsl:call-template name="Section1042AElectionTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
