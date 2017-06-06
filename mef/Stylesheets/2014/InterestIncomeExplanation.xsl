<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 10/03/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:param name="DependencyData" select="$RtnDoc/InterestIncomeExplanation"/>
    <!-- Partnership Income (IRS1065ScheduleK1) Dependency -  Interest Income Explanation Statement -->
    <!-- Main template begin -->
    <xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
				<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>  
    </xsl:param>
    <!-- Main template end-->
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
			<div class="styDepTitleLine">
			    <span class="styDepTitle" style="width:110mm;">
					<xsl:value-of select="$depDocTitle"/>
			    </span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
		  <div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Short Explanation:</div>
          <div style="float:left;clear:none;width:118mm;">
				<xsl:for-each select="$DependencyData/ShortExplanationTxt">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="text()"/>
					</xsl:call-template><br/><br/>
				</xsl:for-each>
		   </div>
		</div>
		  </body>
		</html>
    </xsl:template>
</xsl:stylesheet>