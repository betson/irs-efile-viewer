<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="DependencyData" select="$RtnDoc/ClergyTaxFreeIncomeWorksheet" />

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
      			<div style="width:187mm;font-size:7pt;">
					<div  class="styLNDesc" style="width:187mm;height:auto;font-size: 10pt;font-family: 'Arial';padding-bottom:0mm;">Worksheet 1. <span style="width:8px;"/>
							<b>Figuring the Percentage of Tax-Free Income</b>
					</div>
					<div  class="styLNDesc" style="width:150mm;height:auto;padding-top:0mm;"><span style="width:24mm;"/>
					<b>Note.</b> For each line, enter the appropriate amount in <b>all</b> boxes that are not shaded.
					</div>
				</div><br/>
				<table class="styTable" style="width:187mm;clear:both;font-size:7pt;border-collapse:collapse;">
					<thead style="border-left:1px solid black;">
						<tr style="border-top:1px solid black;">
							<th class="styTableCell" scope="col" style="width:6mm;font-weight:bold;text-align:center;"></th>
							<th class="styTableCell" scope="col" colspan="3" style="width:109mm;font-weight:bold;text-align:center;">Source of Income</th>
							<th class="styTableCell" scope="col" style="width:24mm;font-weight:bold;text-align:center;">(a)<br />Taxable</th>
							<th class="styTableCell" scope="col" style="width:24mm;font-weight:bold;text-align:center;">(b)<br />Tax-free</th>
							<th class="styTableCell" scope="col" style="width:24mm;font-weight:bold;text-align:center;">(c)<br />Total</th>
						</tr>
					</thead>
					<tbody style="border-left:1px solid black;">
						<!-- Line 1 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">W-2 salary as a minister (from box 1 of Form W-2)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">1</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 2 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Gross income from weddings, baptisms, writing, lecturing, etc. (from line 1 of Schedule C or C-EZ)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">2</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/GrossReceiptsOrSalesAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/GrossReceiptsOrSalesAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Instruction -->
						<tr>
							<td class="styTableCell" colspan="7" style="text-align:left;">
								<b>Note. </b> Complete <b>either</b> lines 3a-3e or 4a-4i.<br />
								&#8226; If your church provides you with a parsonage, complete lines 3a-3e.<br />
								&#8226; If, instead of providing a parsonage, your church provides you with a rental or parsonage allowance, complete lines 4a-4i.
							</td>
						</tr>
						<!-- Line 3a -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">3a</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">FRV* of parsonage provided by church</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3a</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvByChurchFRVAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvByChurchFRVAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 3b -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;b</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Utility allowance, if any</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3b</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvUtilityAllowanceAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3c -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;c</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Actual expenses for utilities</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3c</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvActlUtilityExpenseAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3d -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;d</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Enter the smaller of line 3b or 3c</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3d</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerUtilityExpnsOrAllwncAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerUtilityExpnsOrAllwncAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 3e -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;e</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Excess utility allowance (subtract line 3d from line 3b)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">3e</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessUtilityAllowanceAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessUtilityAllowanceAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 4a -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">4a</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Parsonage or rental allowance</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4a</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ParsonageOrRentalAllwanceAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 3b -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;b</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Utility allowance, if separate</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4b</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngUtilityAllowanceAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4c -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;c</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Total allowance (add lines 4a and 4b)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4c</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngTotRntlUtltsAllwncAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4d -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;d</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Actual expenses for parsonage</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4d</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngActlParsonageExpenseAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4e -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;e</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Actual expenses for utilities</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4e</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngActualUtilityExpenseAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4f -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;f</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Total actual expenses for parsonage and utilities (add lines 4d and 4e)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4f</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/TotalParsonageUtilityExpnssAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4g -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;g</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">FRV* of home, plus the cost of utilities</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4g</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngFRVOfHomePlusUtltsAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
						</tr>
						<!-- Line 4h -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;border-bottom-width:0px;">&#0160;&#0160;h</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Enter the smaller of line 4c, 4f, or 4g</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4h</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerOfAllwncActualOrFRVAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerOfAllwncActualOrFRVAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 4i -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">&#0160;&#0160;i</td>
							<td class="styTableCell" style="width:79mm;text-align:left;">Excess allowance (subtract line 4h from line 4c)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">4i</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessChurchAllowanceAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessChurchAllowanceAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 5 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:79mm;text-align:left;"><b>Ministerial income</b> (for columns (a), (b), and (c), add lines 1 through 4i)</td>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">5</td>
							<td class="styTableCell" style="width:24mm;background-color:lightgrey;"></td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotalTaxableMinisterialIncmAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotalTxFreeMinisterialIncmAmt" />
								</xsl:call-template>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/TotalMinisterialIncomeAmt" />
								</xsl:call-template>
							</td>
						</tr>
						<!-- Line 6 -->
						<tr>
							<td class="styTableCell" style="width:6mm;font-weight:bold;text-align:center;">6</td>
							<td class="styTableCell" colspan="5" style="width:181mm;text-align:left;">
								<div class="styGenericDiv"><b>Percentage of tax-free income:</b></div>
								<div class="styGenericDiv">
									<span style="width:85mm;border-bottom:1px solid black;">
										<span style="width:50mm;">Total tax-free income (line 5(b))</span>
										$	<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$DependencyData/TotalTxFreeMinisterialIncmAmt" />
											</xsl:call-template>
									</span>
									<br />
									<span style="width:50mm;">Total income (line 5(c))</span>
									$	<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$DependencyData/TotalMinisterialIncomeAmt" />
										</xsl:call-template>
								</div>
								<span style="padding-left:16mm;padding-top:1.5mm;font-size:9pt;">&#61;</span>
							</td>
							<td class="styTableCell" style="width:24mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncmPct" />
								</xsl:call-template>**
							</td>
						</tr>
					</tbody>
				</table>
				<br />
 					<div style="width:187mm;padding-top:1mm;padding-bottom:4mm;">
* <span style="width:1mm"/>FRV (Fair Rental Value): As determined objectively and between unrelated parties, what it would cost to rent a comparable home (including<br/>
<span style="width:4mm"/>furnishings) in a similar location.<br/>
**This percentage of your ministerial expenses will not be deductible. Use Worksheets 2 and 3 to figure your allowable deductions.

</div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







