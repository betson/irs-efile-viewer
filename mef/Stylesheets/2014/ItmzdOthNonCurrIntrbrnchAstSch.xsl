<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ItmzdOthNonCurrIntrbrnchAstSch"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>

  <xsl:template name="ItmzdOthNonCurrIntrbrnchAstSchTemp">

  <table id="GeneralDependencyTbl" class="styDepTbl">
    <tr class="styDepTblHdr">
          <th class="styDepTblCell" style="width:55mm;text-align:center;" scope="col">Corporation Name</th>
      <xsl:choose>
        <xsl:when test="$DependencyData/ItmzdOthNonCurrIntrbrnchAst/CorporationEIN">
          <th class="styDepTblCell" style="width:25mm;text-align:center;" scope="col">Corporation EIN</th>
        </xsl:when>
        <xsl:otherwise>
          <th class="styDepTblCell" style="width:25mm;text-align:center;" scope="col">Missing EIN reason</th>
        </xsl:otherwise>
      </xsl:choose>
          <th class="styDepTblCell" style="width:47mm;text-align:center;" scope="col">Other Non-Current Interbranch Assets Description</th>
          <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Beginning Amount</th>
          <th class="styDepTblCell" style="width:30mm;text-align:center;" scope="col">Ending Amount</th>
    </tr>
    <xsl:for-each select="$DependencyData/ItmzdOthNonCurrIntrbrnchAst">
      <tr>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td class="styDepTblCell" style="width:55mm;text-align:left;font-size:7pt">
        <xsl:attribute name="rowspan">
						<xsl:value-of select="count(ItmzdOthNonCurrIntrbrAstLnItem)"/>
         </xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
          </xsl:call-template>
        </td>
      <xsl:choose>
        <xsl:when test="CorporationEIN">
        <td class="styDepTblCell" style="width:25mm;text-align:center;font-size:7pt">
        <xsl:attribute name="rowspan">
						<xsl:value-of select="count(ItmzdOthNonCurrIntrbrAstLnItem)"/>
         </xsl:attribute>
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="CorporationEIN"/>
          </xsl:call-template>
        </td>
        </xsl:when>
        <xsl:otherwise>
        <td class="styDepTblCell" style="width:25mm;text-align:center;font-size:7pt">
        <xsl:attribute name="rowspan">
						<xsl:value-of select="count(ItmzdOthNonCurrIntrbrAstLnItem)"/>
         </xsl:attribute>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
          </xsl:call-template>
        </td>
        </xsl:otherwise>
      </xsl:choose>
        <xsl:for-each select="ItmzdOthNonCurrIntrbrAstLnItem">
					<xsl:if test="position() = 1">
        <td class="styDepTblCell" style="width:47mm;text-align:left;font-size:7pt">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Desc"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="BeginningAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="EndingAmt"/>
          </xsl:call-template>
        </td>
        </xsl:if>
				</xsl:for-each>
      </tr>
      
      <xsl:for-each select="ItmzdOthNonCurrIntrbrAstLnItem">
				<xsl:if test="position() &gt; 1">
				<tr>
					<!-- Set row background color -->
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">styDepTblRow1</xsl:when>
							<xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:47mm;text-align:left;font-size:7pt">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="Desc"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="BeginningAmt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width:30mm;text-align:right;font-size:7pt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="EndingAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				</xsl:if>	
      </xsl:for-each>  
    </xsl:for-each>
  </table>
  </xsl:template>

  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
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
        <meta name="Desc" content="{$depDocTitle}"/>
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
            <span style="width:146mm;">
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
        <xsl:call-template name="ItmzdOthNonCurrIntrbrnchAstSchTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>