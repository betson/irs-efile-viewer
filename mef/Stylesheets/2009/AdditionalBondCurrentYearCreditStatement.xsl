<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/AddnlBondCYCreditStatmnt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
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
				<xsl:call-template name="GlobalStylesForm"/>
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
						<span style="width:70mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<!--Repeating Part l-->
				<xsl:for-each select="$DependencyData/AddnlBondCYCreditStmtGrp">
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;border-top-width: 1px;">
						<div class="styGenericDiv" style="width:150mm;float:left;">
							<div class="styPartName" style="border-top-width: 1px;">Part I</div>
							<div class="styPartDesc" style="width:5mm;padding-bottom:0;border-top-width: 1px;"/>
							<div style="font-size:8pt;font-weight:bold;border-top-width:1px;">Current Year Credit</div>
						</div>
					</div>
					<!-- Part I Line1-->
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm; float:none;clear:both; ">
							<div class="styLNLeftNumBox" style="height:4.5mm;">
								<span style="width:5px;"/>1</div>
							<div class="styLNDesc" style="width:69mm;height:4.5mm;">
                           Bond issuer's name, city or town, and state       
                           <!--Dotted Line-->								
								<br/>
								<xsl:if test="NameOfBondIssuer/BusinessNameLine2 != ''">
								<span style="letter-spacing:3.8mm;font-weight:bold;">...............</span>
								<br/>
								</xsl:if>
								<span style="letter-spacing:3.8mm;font-weight:bold;">...............</span>
								<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								
							</div>
							<div class="styLNAmountBox" style="text-align: left;border-left-width:0px;height:8mm;padding-bottom:none;width:110mm;font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine1"/>
								</xsl:call-template>
								<xsl:if test="NameOfBondIssuer/BusinessNameLine2 != ''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="City"/>
								</xsl:call-template>,
								
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="State"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I Line 2-->
						<div class="styGenericDiv" style="width:187mm; float:none;clear:both; ">
							<div class="styLNLeftNumBox" style="height:4.5mm;">
								<span style="width:5px;"/>2</div>
							<div class="styLNDesc" style="width:143mm;height:4.5mm;">  Date bond issued   
                          <!--Dotted Line-->
								<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
								<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
							</div>
							<div class="styLNAmountBox" style="text-align: left;border-left-width:0px;height:3mm;padding-bottom:none;width:35mm;font-size:7pt;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$DependencyData/AddnlBondCYCreditStmtGrp/DateBondIssued"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  Part I Line 3-->
						<div class="styGenericDiv" style="width:187mm; float:none;clear:both; ">
							<div class="styLNLeftNumBox" style="height:4.5mm;">
								<span style="width:5px;"/>3</div>
							<div class="styLNDesc" style="width:143mm;height:4.5mm;">
                         Date bond disposed of (if applicable)     
                            <!--Dotted Line-->
								<span style="letter-spacing:2.5mm;font-weight:bold;">.............................</span>
								<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
							</div>
							<div class="styLNAmountBox" style="text-align: left;border-left-width:0px;height:3mm;padding-bottom:none;width:35mm;font-size:7pt;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$DependencyData/AddnlBondCYCreditStmtGrp/DateBondDisposedOf"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Repeating table PrincipalBondAndCreditsGrp-->
						<xsl:call-template name="AddtnlBondCYCreditStmtGrpTemp"/>
						<!-- Part I Line 5-->
						<div class="styGenericDiv" style="width:187mm; ">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">
								<span style="width:5px;"/>5</div>
							<div class="styLNDesc" style="width:139.60mm;height:6mm;float:left;padding-top:3mm;">
								<b>Sum of Credits.</b> Add the amounts on line 4, column (f). 
      
			<span style="letter-spacing:3.5mm;font-weight:bold;">................</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;height:6mm;padding-top:3mm;">
							5</div>
							<div class="styLNAmountBox" style="height:6mm;width:32mm;font-size:7pt;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="CreditSumAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I Line 6-->
						<div class="styGenericDiv" style="width:187mm; ">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">
								<span style="width:5px;"/>6</div>
							<div class="styLNDesc" style="width:139.60mm;height:6mm;float:left;padding-top:3mm;">
								For a <b>new</b> clean renewable energy bond or a qualified energy conservation bond, multiply the amount on line 5 by 70% (.70).  For a clean renewable energy bond, Gulf tax credit bond, Midwestern tax credit bond, qualified forestry conservation bond, or qualified zone academy bond, enter the amount from line 5.      
			<span style="letter-spacing:3.5mm;font-weight:bold;">..</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;height:13mm;padding-top:9mm;border-bottom-width: 0px; ">
							6</div>
							<div class="styLNAmountBox" style="height:13mm;width:32mm;font-size:7pt;padding-top:9mm;border-bottom-width: 0px; ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="CrComputationOrCrSumAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;height:1mm;"/>
					</div>
					<br class="pageend"/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddtnlBondCYCreditStmtGrpTemp">
		<table class="styDepTbl" id="PrincipalBondAndCreditsGrp ">
			<thead class="styTableThead">
							
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
		<th scope="col" class="styDepTblCell" style="width:50mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top;" colspan="2">(a)<br/>Principal payment dates</th>
		<th scope="col" class="styDepTblCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b)<br/>Outstanding<br/> bond principal</th>
		<th scope="col" class="styDepTblCell" style="width:23mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(c)<br/>Credit <br/>rate</th>
		<th scope="col" class="styDepTblCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(d)<br/>Multiply<br/> (b) x (c)</th>
			<th scope="col" class="styDepTblCell" style="width:15mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(e)<br/>% </th>
		<th scope="col" class="styDepTblCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(f)<br/>Multiply <br/>(d) x (e)</th>
								</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="PrincipalBondAndCreditsGrp">
					<!-- set row background -->
					<tr>
						<xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="width:5mm;font-size:6pt;text-align:center;border-right-width:0px;font-weight:bold;vertical-align:top;">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="4"/>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1px;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<!--  Principal Payments -->
						<td class="styDepTblCell" style="width:50mm;text-align:center;border-left-width:0px;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="PrinPaymentDates"/>
							</xsl:call-template>
						</td>
						<!-- OutStanding Bond Payments -->
						<td class="styDepTblCell" style="width:33mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OutstndingBondPrin"/>
							</xsl:call-template>
						</td>
						<!-- Credit Rate -->
						<td class="stydepTblCell" style="width:23mm;text-align:center;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="CreditRate"/>
							</xsl:call-template>
						</td>
						<!-- Outstanding Bond Principle -->
						<td class="styDepTblCell" style="width:33mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OutstndgBondPrinCrdtRteAmt"/>
							</xsl:call-template>
						</td>
						<!-- Percent -->
						<td class="stydepTblCell" style="width:15mm;text-align:center;">
							<span style="width:21mm;text-align:center;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="Percent"/>
								</xsl:call-template>
							</span>
						</td>
						<!-- Credit Amount -->
						<td class="stydepTblCell" style="width:33mm;text-align:right;">
							<span style="width:33mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="CreditAmt"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
