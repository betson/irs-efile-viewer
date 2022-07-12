<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/OtherAdjRqrReconcileAmtSch"/>
  <!-- 1120S Schedule M3 -Other Adjustments Required to Reconcile to Amount Schedule -->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template> 
  </xsl:param>
  <xsl:template name="OtherAdjustmentsToReconcileSchTable2">
    <table id="OtherAdjustmentsToReconcileSchTable2" class="styDepTblLandscape" style="font-size:8pt;width:256mm;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:38mm;text-align:center;">Net Adjustment Type </th>
          <th class="styDepTblCell" scope="col" style="width:214mm;text-align:center;">Explanation </th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
       <xsl:for-each select="$DependencyData/OthAdjRequiredReconcileAmtGrp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
          </xsl:attribute>
					<!-- Name -->
					<!-- Changed text alignment for Net adjustment and Explanation fields-->
          <td class="styDepTblCell" style="width:38mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NetAdjustmentAmt"/>
            </xsl:call-template>            
          </td>
          <td class="stydepTblCell" style="width:214mm;text-align:left;font-size:7pt;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
            </xsl:call-template>
          </td> 
        </tr>
      </xsl:for-each>
      </tbody>
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
        <meta name="Author" content="Trin Xue"/>
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
						<span style="width:158mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>               
				<xsl:call-template name="OtherAdjustmentsToReconcileSchTable2"/>  
			</body>
    </html>
  </xsl:template>
</xsl:stylesheet>