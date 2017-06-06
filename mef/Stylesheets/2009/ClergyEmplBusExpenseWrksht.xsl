<?xml version="1.0" encoding="UTF-8"?>
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
						<span style="width:125mm;">TY 2009 Clergy Employee Business Expenses Worksheet
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
					<div  class="styLNDesc" style="width:187mm;height:6mm;font-size: 10pt;font-family: 'Arial';">Worksheet 3. 
							<b>Figuring the Allowable Deduction for Form 2106 or 2106-EZ Expenses</b>
					</div>
				<!-- Beginning of Step 1 Ministerial Tax Free Income Percent -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:1px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">1</div>
						<div class="styGenericDiv " style="width:178mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:1px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:1px;">
							<div  class="styLNDesc" style="width:101mm;height:2mm;">
										<b>Percentage of expenses that are nondeductible </b>(from Worksheet 1, line 6):</div>
			  <!--Dotted Line-->
							
							<div class="styUnderlineAmount"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncmPct"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of Step 1  Ministerial Tax Free Income Percent-->
      
  					<!-- Beginning of Step 2 Business Miles Count -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">2</div>
					<div class="styGenericDiv " style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
						
						<div class="styLNDesc" style="width:30mm;height:2mm;">Business use of car:</div>
          <!--Dotted Line-->
						
						<div class="styUnderlineAmount"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BusinessMilesCnt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;height:2mm;padding-left:2mm;">miles × 55¢ (.55)</div>	
					</div>
					<!-- End of Step 2 Business Miles Count -->
					
					<!-- Beginning of Step 2  James-->	
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">2</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
						</div>
					</div>
					<!-- End of Step 2 James -->
      
 					<!-- Beginning of Step 3  Figure Form2106 Deduction Meals And Entertainment Amount-->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">3</div>
					<div class="styGenericDiv " style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
						
						<div class="styLNDesc" style="width:36.5mm;height:2mm;">Meals and entertainment: $</div>
          <!--Dotted Line-->
						
						<div class="styUnderlineAmount"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedMealsAndEntrmtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:2mm;padding-left:2mm;">× 50% (.50)</div>	
					</div>
					<!-- End of Step 3 Figure Form2106 Deduction Meals And Entertainment Amount -->
					
					<!-- Beginning of Step 3 James -->	
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">3</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
						</div>
					</div>
					<!-- End of Step 3 James -->
      
 					<!-- Beginning of Step 4 Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">4</div>
						<div class="styLNDesc" style="width:178mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:1px;">Other expenses (list item and amount)
          <!--Dotted Line-->
						</div>
					</div>
					<!-- End of Step 4 Other Expenses Group--> 
      
 			<xsl:for-each select="$DependencyData/OtherExpensesGrp">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 5)=1">
									<!--<div class="styIRS2106TableContainer" id="Spcctn">-->
										<xsl:call-template name="SetInitialState"/>
										
 					<!-- Beginning of Step 4a Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:4mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">a</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4a</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4a Other Expenses Group--> 
										
 					<!-- Beginning of Step 4b Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:4mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">b</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 1]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4b</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 1]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4b Other Expenses Group--> 
										
  					<!-- Beginning of Step 4c Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:4mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">c</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 2]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4c</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 2]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4c Other Expenses Group--> 
 					<!-- Beginning of Step 4d Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:4mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">d</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 3]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4d</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 3]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4d Other Expenses Group--> 
 					<!-- Beginning of Step 4e Other Expenses Group -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:8mm;text-align:center;padding-top:4mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">e</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 4]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4e</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 4]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4e Other Expenses Group--> 
				</xsl:if>	   
            </xsl:for-each>
					<!-- Beginning of Step 4f  Figure Form2106 Deduction Total Other Expense Amount -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">f</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total other expenses (add lines 4a through 4e)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4f</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotOthExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 4f Figure Form2106 Deduction Total Other Expense Amount-->  
					  
					<!-- Beginning of Step 5 Figure ScheduleC Deduction Total Expenses Amount -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">5</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total Form 2106 or 2106-EZ expenses (add lines 2, 3, and 4f)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">5</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotalExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 5 Figure ScheduleC Deduction Total Expenses Amount-->
					
					<!-- Beginning of Step 6  Other Reimbursment Not Reported On W2 Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:2mm;text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">6</div>
						<div class="styLNDesc" style="width:108mm;height:2mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Reimbursement not included in box 1 of Form W-2
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:2mm;padding-top:.5mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">6</div>
						<div class="styShadingCell" style="height:4.5mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:2mm;padding-top:.5mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherReimbNotRptOnW2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 6 Other Reimbursment Not Reported On W2 Amount-->
					
					<!-- Beginning of Step 7 Figure Form2106 Deduction Total Unreimbursed Expense Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:1.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">7</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total unreimbursed Form 2106 or 2106-EZ expenses (subtract line 6 from <br/>line 5)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:1.3mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">7</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotUnreimExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 7 Figure Form2106 Deduction Total Unreimbursed Expense Amount-->
					
					<!-- Beginning of Step 8 Figure Form2106 Deduction Nondeduction Expense Amount-->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:8mm;text-align:center;padding-top:1.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">8</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Nondeductible part of Form 2106 or 2106-EZ expenses (multiply line 7 by the <br/>percent in line 1)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:1.3mm;width:6mm;text-align:center;
						border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">8</div>
						<div class="styShadingCell" style="height:8mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedNondedExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 8 Figure Form2106 Deduction Nondeduction Expense Amount-->
					
					<!-- Beginning of Step 9 Unreimbursed Employee Business Expense Amount-->					
				<div class="styBB" style="width:186mm;">
					<div style="width:186mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:10.5mm;text-align:center;padding-top:4mm;border-top-width:0px;border-bottom-width:0px;border-left-width:1px;border-right-width:1px;">9</div>
						<div class="styLNDesc" style="width:108mm;height:10mm;padding-left:2mm;"><b>Ministerial employee business expense deduction allowed.* </b>Subtract line 8<br/>
																																			from line 7. Enter the result here and on Form 2106, line 10, or Form 2106-EZ,<br/>
																																			line 6.
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;padding-top:4mm;width:6mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;">9</div>
						<div class="styShading" style="height:10.5mm;"/>
						<div class="styLNAmountBox" style="height:10.5mm;padding-top:7mm;border-bottom-width:0px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnreimEmployeeBusExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 9 Unreimbursed Employee Business Expense Amount-->
 </div>
  					<!-- End signature part -->
					<div style="width:187mm;padding-top:1mm;padding-bottom:4mm;">
						* None of the other deductions claimed in this return are allocable to tax-free income.</div>
									<!-- END of Page 1 -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







