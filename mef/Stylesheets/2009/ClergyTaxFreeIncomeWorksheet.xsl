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
						<span style="width:115mm;">TY 2009 Clergy Tax-Free Income Worksheet
							<!--<xsl:value-of select="$depDocTitle"/>-->
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				
				
				
      			<div style="width:187mm;">
      			<b>
					<div  class="styLNDesc" style="width:187mm;">SSN of Taxpayer With Employee Business Expense:
								<xsl:call-template name="PopulateSSN">
								   <xsl:with-param name="TargetNode" select="$DependencyData/SSNOfMinister" />
								</xsl:call-template>
					</div>			
				</b>
				</div>
				<br/>  
      			<div style="width:187mm;font-size:7pt;">
					<div  class="styLNDesc" style="width:187mm;height:2mm;font-size: 10pt;font-family: 'Arial';padding-bottom:0mm;">Worksheet 1. <span style="width:8px;"/>
							<b>Figuring the Percentage of Tax-Free Income</b>
					</div>
					<div  class="styLNDesc" style="width:150mm;height:2mm;padding-top:0mm;"><span style="width:24mm;"/>
					<b>Note.</b> For each line, enter the appropriate amount in <b>all</b> boxes that are not shaded.
					</div>
				</div><br/>
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;width:7.8mm;padding-top:.5mm;border-style:solid; border-color: black; border-width: 1px 0px 0px 1px;"></div>
						<div class="styLNDesc" style="width:106.5mm;height:8mm;padding-top:4mm;text-align:center;border-style:solid; border-color: black; border-width: 1px 1px 0px 1px;">Source of Income</div>
						<div class="styLNDesc" style="width:24mm;height:8mm;text-align:center;border-style:solid; border-color: black; border-width: 1px 1px 0px 0px;">(a)<br/>Taxable</div>
						<div class="styLNDesc" style="width:24mm;height:8mm;text-align:center;border-style:solid; border-color: black; border-width: 1px 1px 0px 0px;">(b)<br/>Tax-free</div>
						<div class="styLNDesc" style="width:24mm;height:8mm;text-align:center;border-style:solid; border-color: black; border-width: 1px 1px 0px 0px;">(c)<br/>Total</div>
					</div>
					
					<!-- Beginning of Step 1 Wages Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-width: 1px 1px 0px 1px;">1</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 1px 0px 0px 0px;
																		">W-2 salary as a minister (from box 1 of Form W-2)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 1px 1px 0px 1px;">1</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 1px 0px 0px 0px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 1px 1px 0px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.7mm;border-width: 1px 0px 0px 0px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 1px 1px 0px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 1 Wages Amount-->
					
					<!-- Beginning of Step 2 Gross Receipts Or Sales Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:2mm;border-width: 1px 1px 1px 1px;">2</div>
						<div class="styLNDesc" style="width:76mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 1px 0px 1px 0px;">
						Gross income from weddings, baptisms, writing,<br/>
																		lecturing, etc. (from line 1 of Schedule C or C-EZ)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:2mm;width:6mm;text-align:center;
						border-style:solid;border-color:black;border-width: 1px 1px 1px 1px;">2</div>
						<div class="styShadingCell" style="height:8mm;width:24mm;border-width: 1px 0px 1px 0px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:24.3mm;padding-top:4mm;font-size:6pt;border-width: 1px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/GrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:23.7mm;border-width: 1px 0px 1px 0px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:24.3mm;padding-top:4mm;font-size:6pt;border-width: 1px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/GrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 2 Gross Receipts Or Sales Amount-->
					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNDesc" style="width:186.5mm;height:8mm;padding-left:2mm;border-style:solid; border-color: black; border-width: 0px 1px 1px 1px;">
						<b>Note.</b> Complete <b>either</b> lines 3a–3e or lines 4a–4i.<br/>
						<b>· </b> If your church provides you with a parsonage, complete lines 3a–3e.<br/>
						<b>· </b> If, instead of providing a parsonage, your church provides you with a rental or<br/><span style="width:1.5mm;"/>
						parsonage allowance, complete lines 4a–4i.<br/>
						</div>
					</div>
					
					<!-- Beginning of Step 3a Parsonage Provided By Church FRV Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">3a</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">FRV* of parsonage provided by church
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 0px 1px 1px 1px;">3a</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:23.7mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvByChurchFRVAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvByChurchFRVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 3a Parsonage Provided By Church FRV Amount-->
					
					<!-- Beginning of Step 3b Parsonage Provided Utility Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">b</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Utility allowance, if any
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">3b</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvUtilityAllowanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 3b Parsonage Provided Utility Allowance Amount-->
					
					<!-- Beginning of Step 3c Parsonage Provided Actual Utility Expense Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">c</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Actual expenses for utilities
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">3c</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/PrsngProvActlUtilityExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 3c Parsonage Provided Actual Utility Expense Amount-->
					
					<!-- Beginning of Step 3d Smaller Utility Expense Or Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">d</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Enter the smaller of line 3b or 3c
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 0px 1px 1px 1px;">3d</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:23.7mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerUtilityExpnsOrAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerUtilityExpnsOrAllwncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 3d Smaller Utility Expense Or Allowance Amount-->
					
					<!-- Beginning of Step 3e Excess Utility Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 1px 1px;">e</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Excess utility allowance (subtract line 3d from line 3b)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 0px 1px 1px 1px;">3e</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styLNAmountBox" style="width:23.7mm;padding-top:1mm;font-size:6pt;border-width: 0px 0px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessUtilityAllowanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:24.3mm;border-width: 0px 1px 1px 1px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessUtilityAllowanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 3e Excess Utility Allowance Amount-->
					
					<!-- Beginning of Step 4a Parsonage Or Rental Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">4a</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Parsonage or rental allowance
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4a</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ParsonageOrRentalAllwanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4a Parsonage Or Rental Allowance Amount-->
					
					<!-- Beginning of Step 4b No Parsonage Utility Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">b</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Utility allowance, if separate
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4b</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngUtilityAllowanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4b No Parsonage Utility Allowance Amount-->
					
					<!-- Beginning of Step 4c No Parsonage Total Rental Utilities Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">c</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Total allowance (add lines 4a and 4b)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4c</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngTotRntlUtltsAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4c No Parsonage Total Rental Utilities Allowance Amount-->
					
					<!-- Beginning of Step 4d No Parsonage Actual Parsonage Expense Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">d</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Actual expenses for parsonage
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4d</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngActlParsonageExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4d No Parsonage Actual Parsonage Expense Amount-->
					
					<!-- Beginning of Step 4e No Parsonage Actual Utility Expense Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">e</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Actual expenses for utilities
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4e</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngActualUtilityExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4e No Parsonage Actual Utility Expense Amount-->
					
					<!-- Beginning of Step 4f Total Parsonage Utility Expenses Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:2mm;border-width: 0px 1px 0px 1px;">f</div>
						<div class="styLNDesc" style="height:8mm;width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Total actual expenses for parsonage and utilities (add<br/>
						 lines 4d and 4e)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:2mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4f</div>
						<div class="styLNAmountBox" style="height:8mm;width:24.5mm;padding-top:4.5mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/TotalParsonageUtilityExpnssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:8mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:8mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4f Total Parsonage Utility Expenses Amount-->
					
					<!-- Beginning of Step 4g No Parsonage FRV Of Home Plus Utilities Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">g</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">FRV* of home, plus the cost of utilities
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:5.7mm;text-align:center;
						border-style:solid;border-width: 0px 0px 1px 1px;">4g</div>
						<div class="styLNAmountBox" style="width:24.5mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/NoPrsngFRVOfHomePlusUtltsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:23.5mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:24.5mm;border-width: 0px 1px 1px 1px;"/>
					</div>
					<!-- End of Step 4g No Parsonage FRV Of Home Plus Utilities Amount-->
					
					<!-- Beginning of Step 4h Smaller Of Allowance Actual Or FRV Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 0px 1px;">h</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Enter the smaller of line 4c, 4f, or 4g
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 0px 1px 1px 1px;">4h</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styShadingCell" style="height:4.5mm;width:23.7mm;border-width: 0px 0px 1px 1px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerOfAllwncActualOrFRVAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/SmallerOfAllwncActualOrFRVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 4h Smaller Of Allowance Actual Or FRV Amount-->
					
					<!-- Beginning of Step 4i Excess Church Allowance Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxBB" style="text-align:center;padding-top:.5mm;border-width: 0px 1px 1px 1px;">i</div>
						<div class="styLNDesc" style="width:76mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">Excess allowance (Subtract line 4h from line 4c)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-width: 0px 1px 1px 1px;">4i</div>
						<div class="styShadingCell" style="height:4.5mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styLNAmountBox" style="width:23.7mm;padding-top:1mm;font-size:6pt;border-width: 0px 0px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessChurchAllowanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;width:24.3mm;border-width: 0px 1px 1px 1px;"/>
						<div class="styLNAmountBox" style="width:24.3mm;padding-top:1mm;font-size:6pt;border-width: 0px 1px 1px 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ParsonageProvidedByChurchGrp/ExcessChurchAllowanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 4i Excess Church Allowance Amount-->
					
					<!-- Beginning of Step 5 Total Taxable Ministerial Income Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:2mm;border-width: 0px 1px 1px 1px;">5</div>
						<div class="styLNDesc" style="width:76mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">
						<b>Ministerial income</b> (for columns (a), (b), and (c), add<br/>
						lines 1 through 4i)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:2mm;width:6mm;text-align:center;
						border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">5</div>
						<div class="styShadingCell" style="height:8mm;width:24mm;border-width: 0px 0px 1px 0px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:23.7mm;padding-top:4.5mm;font-size:6pt;border-width: 0px 0px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalTaxableMinisterialIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:24mm;padding-top:4.5mm;font-size:6pt;border-width: 0px 0px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalTxFreeMinisterialIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:24.7mm;padding-top:4.5mm;font-size:6pt;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalMinisterialIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 5 Total Taxable Ministerial Income Amount-->
					
					<!-- Beginning of Step 6 Total Taxable Ministerial Income Amount-->					
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxBB" style="height:12mm;text-align:center;padding-top:2mm;border-width: 0px 1px 1px 1px;">6</div>
						<div class="styLNDesc" style="width:76mm;height:12mm;padding-top:2mm;padding-left:2mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">
						<b>Percentage of tax-free income:</b>
          <!--Dotted Line-->
						</div>
						<div class="styLNDesc" style="width:55mm;height:12mm;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">
								<div class="styLNDesc" style="width:55mm;padding-top:2mm;padding-bottom:0mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">Total tax-free income <span style="width:2mm"/>$
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$DependencyData/TotalTxFreeMinisterialIncmAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="width:55mm;padding-top:0mm;padding-bottom:0mm;padding-left:3.5mm;">Total income<span style="width:10.5mm"/>$
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$DependencyData/TotalMinisterialIncomeAmt"/>
										</xsl:call-template>
									</span>
								</div>
						</div>
						<div class="styLNDesc" style="width:13mm;height:12mm;padding-top:4mm;text-align:right;border-style:solid; border-color:black;border-width: 0px 0px 1px 0px;">=</div>
						<div class="styLNDesc" style="width:34.7mm;height:12mm;padding-top:4mm;padding-right:1mm;text-align:right;border-style:solid; border-color:black;border-width: 0px 1px 1px 0px;">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncomePct"/>
										</xsl:call-template>**
						</div>
					</div>
 					<div style="width:187mm;padding-top:1mm;padding-bottom:4mm;">
* <span style="width:1mm"/>FRV (Fair Rental Value): As determined objectively and between unrelated parties, what it would cost to rent a comparable home (including<br/>
<span style="width:4mm"/>furnishings) in a similar location.<br/>
**This percentage of your ministerial expenses will not be deductible. Use Worksheets 2 and 3 to figure your allowable deductions.

</div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







