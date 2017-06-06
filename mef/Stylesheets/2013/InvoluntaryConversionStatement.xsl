<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 08/28/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:param name="DependencyData" select="$RtnDoc/InvoluntaryConversionStatement"/>
    <!-- Partnership Income (IRS1065ScheduleK1) Dependency -  Involuntary Conversion Statement -->
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
			    <span class="styDepTitle">
					<span class="styDepTitle" style="width:100mm;">
						<span style="padding-right:1.5mm;">TY</span>
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						<span style="padding-left:1.5mm;">Involuntary Conversion Statement</span>
					</span>    
			    </span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
		  <!--table begin -->      
			<table id="ILSTbl" class="styDepTbl" style="text-align:center;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">          
					   <th class="styDepTblCell" scope="col" style="width:150mm;">Net Gain (Loss) From Involuntary Conversion Due to Casualty or Theft</th>        
					   <th class="styDepTblCell" scope="col" style="width:38mm;">Amount of Involuntary Conversion</th>        
					</tr>
				</thead>
				<xsl:for-each select="$DependencyData/IInvoluntaryConversionGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							 </xsl:choose>
						</xsl:attribute>
						<!-- Type of Involuntary Conversion - Column 1-->
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">          
							 <xsl:with-param name="TargetNode" select="InvoluntaryConversionDesc"/>
						</xsl:call-template>
						</td>
						<!-- Amount of Involuntary Conversion - Column 2 -->      
						<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">          
									<xsl:with-param name="TargetNode" select="Amt"/>
								</xsl:call-template>
						</td>          
					</tr>
				</xsl:for-each>
			</table>
			<br/>
		  </body>
		</html>
    </xsl:template>
</xsl:stylesheet>