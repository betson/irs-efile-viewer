<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/AssigneeRailroadTrackMilesStmt"/>
		 <!--  - Form 8900 displays as - Assignee Railroad Track Miles Statement - -->
  <!-- The name of the dependency Assignee Railroad Track Miles Statement -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="AssignRRTrkMls">
    <table id="DeMinimisExceptionElectionTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="padding-top:10mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="padding-top:10mm;">EIN</th>
          <th class="styDepTblCell" scope="col" style="padding-top:10mm;">Mileage</th>
          <th class="styDepTblCell" scope="col">Total number of miles of the assignors eligible railroad track</th>
          <th class="styDepTblCell" scope="col">Total number of miles of eligible railroad track assigned by the assignor</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/AssigneeRailroadTrackMilesGrp">
        <tr>
          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
          <td class="styDepTblCell" style="width: 45mm;text-align:left;">
            <xsl:choose>
              <xsl:when test="AssigneeName/BusinessNameLine1 !=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AssigneeName/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="AssigneeName/BusinessNameLine2 !=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="AssigneeName/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AssigneeName"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="width:34mm;text-align:center;padding-top:6mm;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="EIN"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:45mm;text-align:right;padding-top:6mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalRlrdTrackMilesQty"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:45mm;text-align:right;padding-top:6mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalAssignorsEligRlrdTrackQty"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:45mm;text-align:right;padding-top:6mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotRlrdTrackAsgnByAssignorQty"/>
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
        <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com"/>
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
        <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="AssignRRTrkMls"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>