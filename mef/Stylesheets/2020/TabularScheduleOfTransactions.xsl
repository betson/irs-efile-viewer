<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/TabularScheduleOfTransactions"/>
	<xsl:param name="depDocTitle">
	<xsl:call-template name="PopulateDisplayName">
	<xsl:with-param name="TargetNode" select="$DependencyData"/>
	</xsl:call-template>
	</xsl:param>
	<xsl:template name="TabularScheduleOfTransactionsTemp">
	<!--<xsl:call-template name="DocumentHeaderDependencyLandscape"/>-->
	<!-- Updated 6/23/11 (RLW) -->
	<!-- Updated 8/30/11 (RLW) -->
		<div class="styDepTitleLineLandscape">
			<table id="TabularScheduleOfTransactionsTemp" class="styDepTblLandscape" style="font-size: 7pt">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col">Business Name </th>
						<th class="styDepTblCell" scope="col">EIN</th>
						<th class="styDepTblCell" scope="col">US Amount</th>
						<th class="styDepTblCell" scope="col">Ratio</th>
					</tr>
				</thead>
				<tbody>
				<!-- Begin For Loop-->
					<xsl:for-each select="$DependencyData/TabularSchOfTransactionsGrp">
				<!-- set row background -->
						<tr>
							<xsl:attribute name="class">
							<xsl:choose>
							  <xsl:when test="position() mod 2 = 1">
							  styDepTblRow1
							  </xsl:when>
						 	     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
							 </xsl:choose>
							</xsl:attribute>
				<!--Return Person Name -->
							<td class="styDepTblCell" style="width:30%;text-align:left;">
								<xsl:if test="PersonNm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PersonNm"/>
								</xsl:call-template>
								</xsl:if>
				<!--Return Business Name -->			
								<xsl:if test="BusinessName">									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								<br/>
								 <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
								 </xsl:call-template>
								</xsl:if>
							</td>
				<!-- Return EIN/SSN -->
							<td class="styDepTblCell" style="width:5%;">
							<xsl:if test="SSN">   
						   <xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>    
						   </xsl:if>   
						 <xsl:if test="EIN">   
					   <xsl:call-template name="PopulateEIN">
	            <xsl:with-param name="TargetNode" select="EIN"/>
	            </xsl:call-template>    
             </xsl:if>   
             <!-- Return MissingEINReason -->
                <xsl:if test="MissingEINReason">   
	            <xsl:call-template name="PopulateText">
	            <xsl:with-param name="TargetNode" select="MissingEINReason"/>
	            </xsl:call-template>    
               </xsl:if>             
			  </td>
			 <!-- US Amount -->
			<td class="styDepTblCell" style="width:7%;text-align:right;">
				<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="Amt"/>
				</xsl:call-template>
				</td>
				<!-- Ratio -->
				<td class="styDepTblCell" style="width:7%;text-align:right;">
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="Rt"/>
				</xsl:call-template>%
             </td>
			</tr>
		   </xsl:for-each>
		 </tbody>
		</table>
	  </div>
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
						<span style="width:100mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="TabularScheduleOfTransactionsTemp"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>