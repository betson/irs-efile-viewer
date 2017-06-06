<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/OtherFixedGainsSchedule"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>

  <xsl:template name="OtherFixedGainsScheduleTemp">

    <div class="styTopSectionLine" style="width:187mm;">
      <div class="styTopSectionLineLbl" style="float:left;clear:none;">Total amount of tax liability:</div>
      <div style="float:left;clear:none;width:118mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$DependencyData/TotalTaxLiabilityAmt"/>
        </xsl:call-template>
      </div>
    </div>
    <div class="styTopSectionLine" style="width:187mm;">
      <div class="styTopSectionLineLbl" style="float:left;clear:none;">Total amount of US income tax paid or withheld at the source:</div>
      <div style="float:left;clear:none;width:118mm;">
      <br/>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$DependencyData/TotalTaxesPaidAmt"/>
        </xsl:call-template>
      </div>
    </div>
    
    <table id="GeneralDependencyTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:57mm;text-align:center;" scope="col">Class of income</th>
        <th class="styDepTblCell" style="width:32mm;text-align:center;" scope="col">Gross amount</th>
        <th class="styDepTblCell" style="width:27mm;text-align:center;" scope="col">Rate of Tax</th>
        <th class="styDepTblCell" style="width:32mm;text-align:center;" scope="col">Amount of tax liability</th>
        <th class="styDepTblCell" style="width:37mm;text-align:center;" scope="col">Amount of US income tax paid or withheld at the source</th>
      </tr>
      <xsl:for-each select="$DependencyData/OtherFixedGainsInformationGrp">
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:57mm;text-align:left;font-size:7pt">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="IncomeTypeDesc"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:32mm;text-align:right;font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:27mm;text-align:center;font-size:7pt">
            <xsl:call-template name="PopulatePercent">
              <xsl:with-param name="TargetNode" select="TaxRt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:32mm;text-align:right;font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TaxAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:37mm;text-align:right;font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalTaxesPaidAmt"/>
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
        <title><xsl:value-of select="$depDocTitle"/></title>
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
        <xsl:call-template name="DocumentHeaderDependency"/>
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:308px;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <div class="styTopSectionLine">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
          <xsl:with-param name="NoGap" select="'true'"/>
        </xsl:call-template>
        <xsl:call-template name="OtherFixedGainsScheduleTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>