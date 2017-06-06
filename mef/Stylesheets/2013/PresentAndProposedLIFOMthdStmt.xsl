<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="PresentAndProposedLIFOMthdData" select="$RtnDoc/PresentAndProposedLIFOMthdStmt"/>
  <!-- - 3115 Form displays as - Present and Proposed LIFO Methods Statement - -->
  <xsl:template name="ShowPresentAndProposedLIFOMthd">
    <table id="PresentAndProposedLIFOMthdTbl" class="styDepTblLandscape" style="font-family: Verdana;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Present Valuing Inventory Method</th>
          <th class="styDepTblCell" scope="col">Proposed Valuing Inventory Method</th>
          <th class="styDepTblCell" scope="col">Present Pooling Method</th>
          <th class="styDepTblCell" scope="col">Proposed Pooling Method</th>
          <th class="styDepTblCell" scope="col">Present Price-Dollar-Value Pools Method</th>
          <th class="styDepTblCell" scope="col">Proposed Price-Dollar-Value Pools Method</th>
          <th class="styDepTblCell" scope="col">Present Determining the Current Year Costs of Goods in the Ending Inventory</th>
          <th class="styDepTblCell" scope="col">Proposed Determining the Current Year Costs of Goods in the Ending Inventory</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$PresentAndProposedLIFOMthdData/PresentAndProposedLIFOMthdInfo">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PresentValuingInvntryMthdDesc"/>
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ProposedValuingInvntryMthdDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PresentPoolingMethodDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ProposedPoolingMethodDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PresentPriceDolVlPoolMthdDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ProposedPriceDolVlPoolMthdDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PresDetermCostEndInvntryDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PrpsdDetermCostEndInvntryDesc"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each> 
      </tbody>
    </table>
  </xsl:template>
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$PresentAndProposedLIFOMthdData"/>
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
          <meta name="Author" content="Chris Sinderson"/>
          <meta name="Description" content="{$depDocTitle}"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
          <xsl:call-template name="InitJS"/>
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="AddOnStyle"/>    
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesDep"/>
        </head>
        <body class="styBodyClass" style="width:187mm;">
          <xsl:call-template name="DocumentHeaderDependencyLandscape"/>  
          <div class="styDepTitleLineLandscape">
            <span class="styDepTitle">
              <span style="padding-right:2mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>    
            </span>
          </div>
          <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
            <xsl:with-param name="TargetNode" select="$PresentAndProposedLIFOMthdData"/>
          </xsl:call-template>
          <span style="height:5px;"/>
          <xsl:call-template name="ShowPresentAndProposedLIFOMthd"/>
          <br/>
        </body>
      </html>
    </xsl:template>
 </xsl:stylesheet>