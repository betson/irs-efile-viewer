<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/16/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/SeparateUnitsSchedule"/>
  <!-- 8865- Separate Units Schedule -->
  <xsl:template name="DependencyTemplate">
       <table id="SUSCTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:150mm">Type</th>
           <th class="styDepTblCell" scope="col" style="width:37mm">Country</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/SeparateUnitGrp">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:150mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ShortDesc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width;37mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CountryCd"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
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
         <meta http-equiv="Content-ShortDesc" content="text/html; charset=ISO-8859-1"/>       
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>        
        <style type="text/css">
        </style>
        <style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>    
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine" style="width:187mm;">
          <span class="styDepTitle" style="width:187mm;">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate"/>        
        <br/>      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>