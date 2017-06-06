<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="ABCSSData" select="$RtnDoc/AltBasisCompensationSourceStmt"/>
  <!-- Template to display Alternative Basis Compensation Source Statement -->
  <xsl:template name="ShowABCSS">
    <table id="ABCSSTbl" class="styDepTbl" style="font-size:6pt;width:187mm;table-layout:fixed;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:32mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:20mm;">SSN</th>
          <th class="styDepTblCell" scope="col" style="width:33mm;">Specific Income<br/>Or Fringe Benefit</th>
          <th class="styDepTblCell" scope="col" style="width:33mm;">Alt Allocation<br/>Basis Description</th>
          <th class="styDepTblCell" scope="col" style="width:33mm;">Alt Allocation<br/>Computation Description</th>
          <th class="styDepTblCell" scope="col" style="width:33mm;">Alt Allocation<br/>Geog Comparison</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$ABCSSData/AltBasisCompSourceStmt">
          <tr>
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <td class="styDepTblCell" style="text-align:left;width:32mm;padding:0px 0px 0px 0px;">
              <div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:32mm;height:auto;word-wrap:break-word;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PersonNm"/>
                </xsl:call-template>
              </div>
            </td>
            <td class="styDepTblCell" style="text-align:center;width:20mm;">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="SSN"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:33mm;padding:0px 0px 0px 0px;text-align:left;">
              <div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:33mm;height:auto;word-wrap:break-word;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="SpecificIncmOrFringeBnftDesc"/>
                </xsl:call-template>
              </div>
            </td>
            <td class="styDepTblCell" style="width:33mm;padding:0px 0px 0px 0px;text-align:left;">
              <div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:33mm;height:auto;word-wrap:break-word;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AltAllocationBasisDesc"/>
                </xsl:call-template>
              </div>
            </td>
            <td class="styDepTblCell" style="width:33mm;padding:0px 0px 0px 0px;text-align:left;">
              <div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:33mm;height:auto;word-wrap:break-word;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AltAllocationComputationDesc"/>
                </xsl:call-template>
              </div>
            </td>
            <td class="styDepTblCell" style="width:33mm;padding:0px 0px 0px 0px;text-align:left;">
              <div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:33mm;height:auto;word-wrap:break-word;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AltAllocationGeogCmprsnDesc"/>
                </xsl:call-template>
              </div>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$ABCSSData"/>
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
          <span class="styDepTitle" style="width:92mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$ABCSSData"/>
        </xsl:call-template>
        <div class="NBB" style="width:187mm">
          <xsl:call-template name="ShowABCSS"/>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>