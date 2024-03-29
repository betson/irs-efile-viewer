<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="DependencyData" select="$RtnDoc/AdjForUSTaxPrinInFuncCurSch"/>
<xsl:param name="depDocTitle">
<xsl:call-template name="PopulateDisplayName">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
</xsl:param>
<xsl:template name="AdjForUSTaxPrinInFuncCurSchTemp">
<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
          <span class="styTopSectionLineLbl">Total amount of
adjustments:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/Total"/>
            </xsl:call-template>
          </div>
        </div>



<table id="GeneralDependencyTbl" class="styDepTbl">
<tr class="styDepTblHdr">
<th class="styDepTblCell" style="width:93.5mm;text-align:center;" scope="col">Item Description</th>
<th class="styDepTblCell" style="width:93.5mm;text-align:center;" scope="col">Amount</th>
<th class="styDepTblCell" style="width:93.5mm;text-align:center;" scope="col">Expense Description</th>
<th class="styDepTblCell" style="width:93.5mm;text-align:center;" scope="col">Temporary Difference Amount</th>
<th class="styDepTblCell" style="width:93.5mm;text-align:center;" scope="col">Permanent Difference Amount</th>
</tr>
<xsl:for-each select="$DependencyData/AdjForUSTaxPrinInFuncCur">
<tr>
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styDepTblCell" style="text-align:left;font-size:7pt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="ItemDescription"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="text-align:right;font-size:7pt">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="Amount"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="text-align:left;font-size:7pt">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="ExpenseDescription"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="text-align:right;font-size:7pt">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="text-align:right;font-size:7pt">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="PermanentDifferenceAmount"/>
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
<xsl:call-template name="DocumentHeaderDependency"/>
<div class="styDepTitleLine">
<span class="styDepTitle">
<span style="width:130mmpx;">
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
<xsl:call-template name="AdjForUSTaxPrinInFuncCurSchTemp"/>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
