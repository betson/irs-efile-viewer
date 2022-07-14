<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>   
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedNOLDeductionsSchedule"/>
  <!-- - Common Forms displayed as - Itemized Net Operating Loss deductions schedule -  -->  
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="ItemizedNOLDTemp"> 
		<xsl:for-each select="$DependencyData/ItemizedNOLDeduction">
			<table id="ItemizedNOLDeductionsScheduleTbl" class="styDepTblLandscape" style="border-spacing:0px;border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;width:256mm;">		
				<!-- Non-repeating Row 1: Corporation Name -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;width:36mm;">
						Corporation Name            
					</th>
					<td class="styDepTblCell" style="text-align:left;width:162mm;" colspan="7">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</td>
				</tr>
				
				<!-- Non-repeating Row 2: Corporation EIN -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;width:36mm;">
						Corporation EIN
					  </th>
						<td class="styDepTblCell" style="text-align:left;width:162mm;" colspan="7">
						<div>
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
						  </div>
					</td>
				</tr>

				<!-- Non-repeating Row 3: Total NOL Deduction Amount -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;width:36mm;">
						Total NOL Deduction Amount
					  </th>
					<td class="styDepTblCell" style="text-align:left;width:162mm;" colspan="7">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalNOLDeductionAmt"/>
								</xsl:call-template>									
            		</td>
				</tr>

				<!-- Repeating rows start here -->
				<tr class="styDepTblRow1">
				<table class="styDepTblLandscape" style="font-size: 7pt;border:0px;border-collapse:collapse; border-spacing:0px">
					<tbody>
					<tr class="styDepTblHdr">           
					   <th class="styDepTblCell" scope="col" style="width:15mm;">Original <br/> NOL Year</th>        
					   <th class="styDepTblCell" scope="col" style="width:8mm;">Original NOL Amount</th>  
					   <th class="styDepTblCell" scope="col" style="width:103mm;"> <br/>Type of Net Operating Loss Being Claimed</th>  
					   <th class="styDepTblCell" scope="col" style="width:20mm;">Remaining NOL Available</th>  
					   <th class="styDepTblCell" scope="col" style="width:21mm;border-bottom-width: 0;">NOL  <br/> Carryback  <br/> Date</th>  
					   <th class="styDepTblCell" scope="col" style="width:30mm;border-bottom-width: 0;">NOL <br/> Carryback <br/> Amount</th>  
					   <th class="styDepTblCell" scope="col" style="width:22mm;border-bottom-width: 0;font-size:6.5pt">NOL <br/> Carryforward <br/> Date</th>  
					   <th class="styDepTblCell" scope="col" style="width:30mm;border-bottom-width: 0;">NOL <br/> Carryforward <br/> Amount</th>         
					</tr>
					<xsl:for-each select="NetOperatingLossYearDetail">
						<tr>
							<!--Set row alternate background color -->
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
	<!--Column 1 - Original NOL Year -->
						<td class="styDepTblCell" style="width:15mm;text-align:center;font-size:7pt;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OriginalDt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 2 - Original NOL Amount -->
						<td class="styDepTblCell" style="width:8mm;text-align:right;font-size:6.5pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OriginalAmt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 3 - Type of Net Operating Loss being claimed -->
						<td class="styDepTblCell" style="width:103mm;text-align:left;font-size:7pt;text-wrap: true">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 4 - Remaining NOL Available for the current year -->
						<td class="styDepTblCell" style="width:20mm;text-align:right;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CYNOLAvailableAmt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 5,6 -->
						<td colspan="2" style="width:52mm;font-size:7pt;padding:0px;border-right: 1px solid black; vertical-align:top; border-bottom-color: black; border-bottom-width: 0.5px; border-bottom-style: solid;">
							<xsl:call-template name="DisplayRepeatingRows">
								<xsl:with-param name="detailNote" select="NOLCarrybackYrAndAmtDetail"/>
							</xsl:call-template>
						</td>
						<!--Column 7,8 -->
						<td colspan="2" style="width:52mm;font-size:7pt;padding:0px;border-right: 1px solid black; vertical-align:top; border-bottom-color: black; border-bottom-width: 0.5px; border-bottom-style: solid;">
							<xsl:call-template name="DisplayRepeatingRows">
								<xsl:with-param name="detailNote" select="NOLCarryforwardYrAndAmtDetail"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--Begin the repeating rows-->
				</xsl:for-each>					
					</tbody>
				</table>
				</tr>
			</table>
			<br/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="DisplayRepeatingRows">
	<xsl:param name="detailNote"/>
	<table>
		<xsl:for-each select="$detailNote">
				<tr style="border-bottom: 0.5px solid black;border-top: 0.5px solid black;">
					<!--Set row alternate background color -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<!--Column 5 - Carry Over Date, Column 7 - Carry Forward Date -->
					<td style="vertical-align:top;width:26mm;text-align:center;border-right: 1px solid black;font-size:7pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CarryoverDt"/>
						</xsl:call-template>
					</td>
					<!--Column 6 - Carry Over Amount, Column 8 - Carry Forward Amount -->
					<td style="width:30mm;text-align:center;font-size:6.5pt;vertical-align:top;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="CarryoverAmt"/>
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
						<span style="width:135mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ItemizedNOLDTemp"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>