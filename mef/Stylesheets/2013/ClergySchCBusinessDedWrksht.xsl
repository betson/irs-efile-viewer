<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/ClergySchCBusinessDedWrksht" />

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
							<xsl:with-param name="TargetNode" select="$DependencyData/SSNOfMinister" />
						</xsl:call-template>
					</div>
				</div>
				<br/>
					<div  class="styLNDesc" style="width:187mm;height:6mm;font-size: 10pt;font-family: 'Arial';">Worksheet 2. 
							<b>Figuring the Allowable Deduction for Schedule C or C-EZ Expenses</b>
					</div>
				<table class="styTable" style="width:187mm;clear:both;font-size:7pt;border-collapse:collapse;">
					<tbody style="border-left:1px solid black;">
						<!-- Line 1 -->
						<tr style="border-top:1px solid black;">
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:112mm;text-align:left;" colspan="4">
								<b>Percentage of expenses that are nondeductible</b> (from Worksheet 1, line 6): 
								<span style="border-bottom:1px solid black;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncmPct" /></xsl:call-template></span>
							</td>
						</tr>
						<!-- Line 2 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">
								Business use of car for entire year: 
								<span style="border-bottom:1px solid black;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$DependencyData/BusinessMilesCnt" /></xsl:call-template></span>
								miles x ??.? cents
							</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedTotalMileageAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 3 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">
								Meals and entertainment 
								$<span style="border-bottom:1px solid black;"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$DependencyData/MealsAndEntertainmentAmt" /></xsl:call-template></span>
								 x ??% (0.??)
							</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCTotMealsAndEntrmtAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 4 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Other expenses (list item and amount)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<xsl:for-each select="$DependencyData/OtherExpensesGrp">
							<tr>
								<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;(<xsl:number value="position()" format="a" />)</td>
								<td class="styTableCell" style="width:112mm;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Description" />
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4(<xsl:number value="position()" format="a" />)</td>
								<td class="styTableCell" style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amount" />
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							</tr>
						</xsl:for-each>
						<!-- Line 4f -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;f</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total other expenses (add lines 4a through 4e)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4f</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedTotOthExpnsAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 5 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total Schedule C or C-EZ expenses (add lines 2, 3, and 4f)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedTotalExpensesAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 6 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Nondeductible part of Schedule C or C-EZ expenses (multiply line 5 by the percent in line 1)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedNondedExpenseAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 7 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:112mm;text-align:left;"><b>Deduction allowed.* </b> Subtract line 6 from line 5. Enter the result here and on Schedule C, line 27a, or Schedule C-EZ, line 2.</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotalOtherExpensesAmt" />
								</xsl:call-template>
							</td>
						</tr>
					</tbody>
				</table>
						* None of the other deductions claimed in this return are allocable to tax-free income.
									<!-- END of Page 1 -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
