<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/ClergySelfEmplmnIncomeWrksht" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
  

  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>        
      <xsl:call-template name="GlobalStylesForm"/>
</head>
    
      <body class="styBodyClass">
      
				 <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
 				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
      			<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left;">SSN Of Minister:</div>
					<div class="styExplanationLine">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSSN" />
						</xsl:call-template>
					</div>
				</div>
				<br/>
					<div  class="styLNDesc" style="width:187mm;height:6mm;font-size: 10pt;font-family: 'Arial';">Worksheet 4. 
							<b>Figuring Net Self-Employment Income for Schedule SE (Form 1040)</b>
					</div>
					
				<table class="styTable" style="width:187mm;clear:both;font-size:7pt;border-collapse:collapse;">
					<tbody style="border-left:1px solid black;">
						<!-- Line 1 -->
						<tr style="border-top:1px solid black;">
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">W-2 salary as a minister (from box 1 of Form W-2)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 2 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Net profit from Schedule C, line 31, or Schedule C-EZ, line 3</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/NetProfitOrLossAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 3 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3a</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Parsonage or rental allowance (from Worksheet 1, line 3a or 4a)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3a</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmPrsngAllwncAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3b -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;b</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Utility allowance (from Worksheet 1, line 3b or 4b)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3b</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmUtilityAllwncAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3c -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;c</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total allowance (add lines 3a and 3b)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3c</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotAllwncAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 4 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Add lines 1, 2, and 3c</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotIncmAllwncAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 5 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Schedule C or C-EZ expenses allocable to tax-free income (from Worksheet 2, line 6)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedNondedExpenseAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 6 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total unreimbursed employee business expenses after the 50% reduction for meals and entertainment (from Worksheet 3, line 9)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotUnreimExpnsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 7-->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total business expenses not deducted in lines 1 and 2 above (add lines 5 and 6)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotBusNotDedAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 8 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">8</td>
							<td class="styTableCell" style="width:112mm;text-align:left;"><b>Net self-employment income. </b> Subtract line 7 from line 4. Enter here and on Schedule&#0160;SE, Section A, line 2, or Section B, line 2.</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">8</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/NetNonFarmProfitLossAmt" />
								</xsl:call-template>
							</td>
						</tr>
					</tbody>
				</table>
				<br />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







