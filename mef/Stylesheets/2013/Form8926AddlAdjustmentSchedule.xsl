<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/Form8926AddlAdjustmentSchedule"/>
	<xsl:param name="depDocTitle">
	<xsl:call-template name="PopulateDisplayName">
	<xsl:with-param name="TargetNode" select="$DependencyData"/>
	</xsl:call-template>
	</xsl:param>
	<xsl:template name="Form8926AddlAdjustmentScheduleTemp">
	<!-- Updated 6/23/11 (RLW) -->
	<!-- Updated 9/1/11 (RLW) -->
		<div class="styDepTitleLine">
			<table id="TabularScheduleOfTransactionsTemp" class="styDepTbl" style="font-size: 7pt">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:153mm;text-align:center">Description of Adjustment Item</th>
            <th class="styDepTblCell" scope="col" style="width:34mm;text-align:center;">Adjustment Amount</th>         
					</tr>
				</thead>
				<tbody>
				<!-- Begin For Loop-->
					 <xsl:for-each select="$DependencyData/Form8926AddlAdjustmentDetail">
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
							<td class="stydepTblCell" style="width:153mm;text-align:left;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AdjustmentItemDesc"/>
                </xsl:call-template>
          </td> 
				 <td class="stydepTblCell" style="width:34mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AdjustmentAmt"/>
                </xsl:call-template>
          </td>			
			</tr>
		   </xsl:for-each>
      <tr>
		<td class="stydepTblCell" style="width:153mm;text-align:left;">
		  Total Adjustments
		</td>
		<td class="stydepTblCell" style="width:34mm;text-align:right;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$DependencyData/TotalAdjustmentsAmt"/>
      </xsl:call-template>
    </td> 
	</tr>		   		   
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
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:100mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="Form8926AddlAdjustmentScheduleTemp"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>