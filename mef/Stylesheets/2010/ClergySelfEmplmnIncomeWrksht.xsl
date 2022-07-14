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
						<span style="width:115mm;">TY 2009 Clergy Self-Employment Income Worksheet
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
					<div  class="styLNDesc" style="width:187mm;height:6mm;font-size: 10pt;font-family: 'Arial';">Worksheet 4. 
							<b>Figuring Net Self-Employment Income for Schedule SE (Form 1040)</b>
					</div>
					
					<!-- Beginning of Step 1 Wages Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:1px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">1</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:1px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">W-2 salary as a minister (from box 1 of Form W-2)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:1px;border-bottom-width:1px;border-color:black;">1</div>
						<div class="styShadingCell" style="height:4.8mm;border-left-width:0px;border-bottom-width:1px;border-top-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/WagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 1 Wages Amount-->
					
					<!-- Beginning of Step 2  Net Profit Or Loss Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">2</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Net profit from Schedule C, line 31, or Schedule C-EZ, line 3
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">2</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/NetProfitOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 2 Net Profit Or Loss Amount-->
					
 					<!-- Beginning of Step 3a  Minister SE Income Prsng Allowance Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">3a</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Parsonage allowance (from Worksheet 1, line 3a or 4a)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">3a</div>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmPrsngAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 3a Minister SE Income Prsng Allowance Amount--> 
 				  
 					<!-- Beginning of Step 3b Minister SE Income Utility Allowance Amount -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">b</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Utility allowance (from Worksheet 1, line 3b or 4b)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">3b</div>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmUtilityAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 3b Minister SE Income Utility Allowance Amount--> 
 				  
 					<!-- Beginning of Step 3c  Minister SE Income Total Allowance Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">c</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total allowance (add lines 3a and 3b)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">3c</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotAllwncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 3c Minister SE Income Total Allowance Amount--> 
 				  
					<!-- Beginning of Step 4 Minister SE Income Total Income Allowance Amount -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">4</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Add lines 1, 2, and 3c
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotIncmAllwncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 4 Minister SE Income Total Income Allowance Amount-->
					
					<!-- Beginning of Step 5 Figure ScheduleC Deduction Nondeduction Expense Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:1.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">5</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Schedule C or C-EZ expenses allocable to tax-free income (from Worksheet 2, <br/>line 6)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:1.3mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">5</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrSchCDedNondedExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 5 Figure ScheduleC Deduction Nondeduction Expense Amount-->
					
					<!-- Beginning of Step 6 Figure Form2106 Deduction Total Unreimbursed Expense Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:1.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">6</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Unreimbursed ministerial employee business expenses (from Worksheet 3, <br/>line 7)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:1.3mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">6</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotUnreimExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 6 Figure Form2106 Deduction Total Unreimbursed Expense Amount-->
					
					<!-- Beginning of Step 7  Minister SE Income Total Business Not Deducted Amount-->					
				<div class="styBB" style="width:186mm;">
					<div style="width:186mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:7.5mm;text-align:center;padding-top:2mm;border-top-width:0px;border-bottom-width:0px;border-left-width:1px;border-right-width:1px;">7</div>
						<div class="styLNDesc" style="width:108mm;height:7mm;padding-left:2mm;">Total business expenses not deducted in lines 1 and 2 above (add lines 5<br/> and 6)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:2mm;width:6mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;">7</div>
						<div class="styShading" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MinisterSEIncmTotBusNotDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
					<!-- End of Step 7  Minister SE Income Total Business Not Deducted Amount-->

					<!-- Beginning of Step 8 Net NonFarm Profit Loss Amount -->					
				<div class="styBB" style="width:186mm;">
					<div style="width:186mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:7.5mm;text-align:center;padding-top:2mm;border-top-width:0px;border-bottom-width:0px;border-left-width:1px;border-right-width:1px;">8</div>
						<div class="styLNDesc" style="width:108mm;height:7mm;padding-left:2mm;"><b>Net self-employment income.</b> 
						Subtract line 7 from line 4. Enter here and on <br/>Schedule SE, Section A, line 2, or Section B, line 2.
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:2mm;width:6mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;">8</div>
						<div class="styShading" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/NetNonFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 8  Net NonFarm Profit Loss Amount-->
 </div>
 
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







