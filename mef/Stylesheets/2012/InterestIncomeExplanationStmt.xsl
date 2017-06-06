<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by Eugenia McDonald on 10/03/2012 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:strip-space elements="*" />
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:param name="DependencyData" select="$RtnDoc/InterestIncomeExplanationStmt" />
    <!-- Partnership Income (IRS1065ScheduleK1) Dependency -  Interest Income Explanation Statement -->
    <!-- Main template begin -->
    <xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
				<xsl:with-param name="TargetNode" select="$DependencyData" />
		</xsl:call-template>  
    </xsl:param>
    <!-- Main template end-->
    <xsl:template match="/" >
		<html>
			<head>
				<title><xsl:value-of select="$depDocTitle" /></title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />        
				<meta name="Description" content="{$depDocTitle}" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>
				<style type="text/css">
				</style>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"></xsl:call-template>    
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>    
			<body class="styBodyClass">
			<xsl:call-template name="DocumentHeaderDependency" />  
			<div class="styDepTitleLine">
			    <span class="styDepTitle" >
					<span class="styDepTitle"  style="width:110mm;">
						<span  style="padding-right:1.5mm;">TY</span>
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						<span  style="padding-left:1.5mm;">Interest Income Explanation Statement</span>
					</span>    
			    </span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
		  <!--table begin -->      
			<table id="ILSTbl" class="styDepTbl" style="text-align:center;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">          
					   <th class="styDepTblCell" scope="col" style="width:150mm;">Type of Credit</th>        
					   <th class="styDepTblCell" scope="col" style="width:38mm;">Interest Income from Credits</th>        
					</tr>
				</thead>
				<xsl:for-each select="$DependencyData/InterestIncomeStatementGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							 </xsl:choose>
						</xsl:attribute>
						<!-- Type of Credit - Column 1-->
						<td class="styDepTblCell" style="text-align:left;" >
							<xsl:call-template name="PopulateText">          
							 <xsl:with-param name="TargetNode" select="TypeOfCredit" />
						</xsl:call-template>
						</td>
						<!-- Partner's Distributive Share of Interest Income from Credits - Column 2 -->      
						<td class="styDepTblCell" style="text-align:right;" >
								<xsl:call-template name="PopulateAmount">          
									<xsl:with-param name="TargetNode" select="PrtnrDistriShareOfInterestIncm" />
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







