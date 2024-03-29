<?xml version="1.0" encoding="UTF-8"?>
<!-- This form by Doug Peterson 6-14-2006 --><!-- Last Modified by Eugenia McDonald on 09/26/2013 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/OtherIncomeLossStatement"/>
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
			<meta http-equiv="Content-Desc" content="text/html; charset=ISO-8859-1"/>         
			<meta name="ShortExplanationTxt" content="{$depDocTitle}"/>
			<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
			<xsl:call-template name="InitJS"/>
        
			<style type="text/css"></style>
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
				<span class="styDepTitle" style="width:92mm;">
					<span><xsl:value-of select="$depDocTitle"/></span>
				</span>
			</div>
            
			<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>

			<!--Other Income Loss Data -->
			<table class="styDepTbl">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" style="width:127mm">Type</th>       
						<th class="styDepTblCell" style="width:60mm">Amt</th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<xsl:for-each select="$DependencyData/OtherIncomeLossStatementGrp">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="width:127mm;text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Type"/>
								</xsl:call-template>                  
							</td>
							<td class="styDepTblCell" style="width:60mm;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		    <br/>      
		 </body>
    </html>
  </xsl:template>
</xsl:stylesheet>