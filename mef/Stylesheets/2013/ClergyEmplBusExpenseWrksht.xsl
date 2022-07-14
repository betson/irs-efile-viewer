<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 11/17/2010 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/ClergyEmplBusExpenseWrksht" />

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
					<div  class="styLNDesc" style="width:187mm;height:6mm;font-size: 10pt;font-family: 'Arial';">Worksheet 3. 
							<b>Figuring the Allowable Deduction for Form 2106 or 2106-EZ Expenses</b>
					</div>
					
				<table class="styTable" style="width:187mm;clear:both;font-size:7pt;border-collapse:collapse;">
					<tbody style="border-left:1px solid black;">
						<!-- Line 1 -->
						<tr style="border-top:1px solid black;">
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:112mm;text-align:left;" colspan="2">
								<b>Percentage of expenses that are nondeductible</b> (from Worksheet 1, line 6): 
								<span style="border-bottom:1px solid black;"><xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncmPct" /></xsl:call-template></span>
							</td>
							<td class="styTableCell" style="width:32mm;text-align:center;font-weight:bold;">Column A</td>
							<td class="styTableCell" style="width:32mm;text-align:center;font-weight:bold;">Column B</td>
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
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/DeductibleClergyMileageAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">
								Meals and entertainment 
							</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedMealsAndEntrmtAmt" />
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
								<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;<xsl:number value="position()" format="a" /></td>
								<td class="styTableCell" style="width:112mm;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Description" />
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4<xsl:number value="position()" format="a" /></td>
								<td class="styTableCell" style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amount" />
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							</tr>
						</xsl:for-each>
						<!-- Line 5 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total expenses. In Column A, add lines 2 and 4a through 4e and enter the result. In column B, enter the amount from line 3.</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotOthExpnsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedMealsAndEntrmtAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 6 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Enter reimbursements received for other expenses (Column A) and meals and entertainment (Column B) that were <b>not</b> included in box 1 of Form W-2</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ClergyOtherReimbNotOnW2Amt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ClergyMealsAndEntrmtNotOnW2Amt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 7 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Total Form 2106 or 2106-EZ unreimbursed expenses (subtract line 6 from line 5)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">7</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyOtherUnreimExpnsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyMealsUnreimExpnsAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 8 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">8</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">In Column A, enter the amount from line 7. In Column B, multiply line 7 by 50% (.50)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">8</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyOtherUnreimExpnsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotalClergyMealsTimesPctAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 9 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">9</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Add the amounts on line 8 of both columns and enter the total here</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">9</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/SumTotalClergyExpensesAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 10 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">10</td>
							<td class="styTableCell" style="width:112mm;text-align:left;">Nondeductible part of Form 2106 or 2106-EZ expenses (multiply line 9 by the percent in line 1)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">10</td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedNondedExpnsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 7 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">11</td>
							<td class="styTableCell" style="width:112mm;text-align:left;"><b>Ministerial employee business expense deduction allowed.* </b> Subtract line 10 from line 9. Enter the result here and on Form 2016, line 10, or Form 2106-EZ, line 6.</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">11</td>
							<td class="styTableCell" style="width:32mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/UnreimEmployeeBusExpnsAmt" />
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







