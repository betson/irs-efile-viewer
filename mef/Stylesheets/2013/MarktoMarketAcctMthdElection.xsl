<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="DependencyData" select="$RtnDoc/MarktoMarketAcctMthdElection"/>
<!-- 1120 Common -Mark-to-Market Accounting Method Election -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <xsl:template name="MarktoMarketAcctMthdElectionTemp">
    <table id="MarktoMarketAcctMthdElectionTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:38mm;">Corporation Name</th>
           <th class="styDepTblCell" scope="col" style="width:34mm;" >Corporation EIN</th>
           <th class="styDepTblCell" scope="col" style="width:38mm;" >Description of the Election</th>
           <th class="styDepTblCell" scope="col" style="width:38mm;">Effective Date of the Election</th>
           <th class="styDepTblCell" scope="col" style="width:39mm;">Trade or Business for Which the Election Was Made</th>           
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/MarkToMarketAcctMthdElectInfo">
        <tr>
          <xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
          <td class="styDepTblCell" style="width:38mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
            </xsl:call-template>
          </td>
					<td class="styDepTblCell" style="width:34mm;text-align:center;">
						<xsl:choose>
							<xsl:when test="CorporationEIN">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                </xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="width:38mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Desc"/>
            </xsl:call-template>          
          </td>                    
          <td class="styDepTblCell" style="width:38mm;text-align:center;" nowrap="nowrap">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ElectionEffectiveDt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:39mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="TradeOrBusinessDesc"/>
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
        <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com"/>
        <meta name="ShortExplanationTxt" content="{$depDocTitle}"/>
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
            <span style="width:120mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <xsl:call-template name="MarktoMarketAcctMthdElectionTemp"/>    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>