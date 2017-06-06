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
						<span style="width:125mm;">TY 2010 Clergy Employee Business Expenses Worksheet
							<!--<xsl:value-of select="$depDocTitle"/>-->
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				
				
      			<div style="width:187mm;">
      			<b>
      			<!-- SSN of Minister -->
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
					
					<div style="width:187mm;font-size: 8pt;">
						<div class="styGenericDiv " style="height:8.5mm;width:122mm;border-style:solid;border-color:black;border-width:1px 1px 0px 1px;"/>
						<div  class="styLNDesc" style="height:8.5mm;width:32.3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;"><b>Column<br/>A</b></div>
						<div  class="styLNDesc" style="height:8.5mm;width:31.7mm;padding-top:2mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;"><b>Column B</b></div>
					</div>
					
				<!-- Beginning of Step 1 Ministerial Tax Free Income Percent -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-top-width:1px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">1</div>
						<div class="styGenericDiv " style="width:178mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:1px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:1px;">
							<div  class="styLNDesc" style="width:105mm;">
										<b>Percentage of expenses that are nondeductible (from Worksheet 1, line 6):</b></div>
			  <!--Dotted Line-->
						<!-- Ministerial Tax Free Income Percent -->	
							<div class="styUnderlineAmount"  style="width:16mm;text-align:center;padding-top:0mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$DependencyData/MinisterialTaxFreeIncmPct"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of Step 1  Ministerial Tax Free Income Percent-->
      
  					<!-- Beginning of Step 2 Business Miles Count -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">2</div>
					<div class="styGenericDiv " style="width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
						
						<div class="styLNDesc" style="width:43mm;">Use of car for church business:</div>
          <!--Dotted Line-->
					<!-- Business Miles Count -->	
						<div class="styUnderlineAmount"  style="padding-top:0mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BusinessMilesCnt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;">miles × 55¢ (.55)</div>	
					</div>
					<!-- End of Step 2 Business Miles Count -->
					
					<!-- Beginning of Step 2 Deductible Clergy Mileage Amount --> 
					<div class="styLNRightNumBox" style="padding-top:.5mm;width:6mm;text-align:center;">2</div>
				<!-- Deductible Clergy Mileage Amount -->	
					<div class="styLNAmountBox" style="padding-right:1mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/DeductibleClergyMileageAmt"/>
							</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 2 Deductible Clergy Mileage Amount -->
      
 					<!-- Beginning of Step 3  Figure Form2106 Deduction Meals And Entertainment Amount-->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">3</div>
						<div class="styLNDesc" style="width:108mm;padding-left:2mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">Meals and entertaiment
					</div>
					<!-- Figure Form2106 Deduction Meals And Entertainment Amount -->
						<div class="styLNRightNumBox" style="width:6mm;text-align:center;">3</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;border-left-width:1px;border-bottom-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="padding-right:1mm;border-bottom-width:1px;border-right-width:1px;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedMealsAndEntrmtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 3 Figure Form2106 Deduction Meals And Entertainment Amount -->
      
 					<!-- Beginning of Step 4 Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;padding-top:.5mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">4</div>
						<div class="styLNDesc" style="width:178mm;padding-left:2mm;border-style:solid; border-color:black;
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
						<div class="styLNLeftLtrBoxBB" style="height:7.8mm;padding-top:1.5mm;text-align:center;;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">a</div>
						<div class="styLNDesc" style="height:7.8mm;width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:1.5mm;width:6mm;text-align:center;border-right-width:1px;">4a</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4a Other Expenses Group--> 
										
 					<!-- Beginning of Step 4b Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:7.8mm;padding-top:1.5mm;text-align:center;border-top-width:0px;
						border-left-width:1px;border-right-width:1px;">b</div>
						<div class="styLNDesc" style="height:7.8mm;width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 1]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:1.5mm;width:6mm;text-align:center;border-right-width:1px;">4b</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 1]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4b Other Expenses Group--> 
										
  					<!-- Beginning of Step 4c Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:7.8mm;padding-top:1.5mm;text-align:center;border-top-width:0px;
						border-left-width:1px;border-right-width:1px;">c</div>
						<div class="styLNDesc" style="height:7.8mm;width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 2]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:1.5mm;width:6mm;text-align:center;border-right-width:1px;">4c</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 2]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4c Other Expenses Group--> 
 					<!-- Beginning of Step 4d Other Expenses Group -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:7.8mm;padding-top:1.5mm;text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">d</div>
						<div class="styLNDesc" style="height:7.8mm;width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 3]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:1.5mm;width:6mm;text-align:center;border-right-width:1px;">4d</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 3]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4d Other Expenses Group--> 
 					<!-- Beginning of Step 4e Other Expenses Group -->		
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftLtrBoxBB" style="height:7.8mm;padding-top:1.5mm;text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">e</div>
						<div class="styLNDesc" style="height:7.8mm;width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 4]/Description"/>
								</xsl:call-template>
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:1.5mm;width:6mm;text-align:center;border-right-width:1px;">4e</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherExpensesGrp[$pos + 4]/Amount"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:1.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 4e Other Expenses Group--> 
				</xsl:if>	   
            </xsl:for-each>
					  
					<!-- Beginning of Step 5 -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:6.5mm;text-align:center;padding-top:1mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">5</div>
						<div class="styLNDesc" style="width:108mm;height:6.5mm;font-size:6pt;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total expenses. In column A, add lines 2 and 4a through 4e and enter the result. In<br/>
																											column B, enter the amount from line 3.
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;padding-top:1mm;width:6mm;text-align:center;border-right-width:1px;">5</div>
					<!-- Figure Form2106 Deduction Total Other Expense Amount -->	
						<div class="styLNAmountBox" style="height:6.5mm;width:31.8mm;padding-top:1mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedTotOthExpnsAmt"/>
							</xsl:call-template>
						</div>
					<!-- Line 5B - Figure Form 2106 Deduction Meals And Entertainment Amount   Copy of line 3B -->	
						<div class="styLNAmountBox" style="height:6.5mm;width:32.2mm;padding-top:1mm;padding-right:1mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedMealsAndEntrmtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 5 -->
					
					<!-- Beginning of Step 6  -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:6.5mm;text-align:center;padding-top:1mm;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">6</div>
						<div class="styLNDesc" style="width:108mm;height:6.5mm;font-size:6pt;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Enter reimbursements received for other expenses (Column A) and meals and entertainment<br/>
																											(Column B) that were <b>not</b> included in box 1 of Form W-2
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;padding-top:1mm;width:6mm;text-align:center;border-right-width:1px;">6</div>
					<!-- Clergy Other Reimbursed Not on W2 Amount -->	
						<div class="styLNAmountBox" style="height:6.5mm;width:31.8mm;padding-top:1mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ClergyOtherReimbNotOnW2Amt"/>
							</xsl:call-template>
						</div>
					<!-- Clergy Meals and Entertainment Not On W2 Amount -->	
						<div class="styLNAmountBox" style="height:6.5mm;width:32.2mm;padding-top:1mm;padding-right:1mm;padding-right:1mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ClergyMealsAndEntrmtNotOnW2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 6 -->
					
					<!-- Beginning of Step 7  -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">7</div>
						<div class="styLNDesc" style="width:108mm;font-size:6pt;padding-top:1mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Total Form 2106 or 2106-EZ unreimbursed expenses (subtract line 6 from line 5)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="width:6mm;text-align:center;border-right-width:1px;">7</div>
					<!-- Total Clergy Other Unreimbursed Expense Amount -->
						<div class="styLNAmountBox" style="width:31.8mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyOtherUnreimExpnsAmt"/>
							</xsl:call-template>
						</div>
					<!-- Total Clergy Meals Unreimbursed Expense Amount -->
						<div class="styLNAmountBox" style="width:32.2mm;padding-right:1mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyMealsUnreimExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 7 -->
					
					<!-- Beginning of Step 8  -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">8</div>
						<div class="styLNDesc" style="width:108mm;font-size:6pt;padding-top:1mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">In Column A, enter the amount from line 7. In Column B, multiply line 7 by 50% (.50)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="width:6mm;text-align:center;border-right-width:1px;">8</div>
					<!-- Line 8A - Total Clergy Other Unreimbursed Expense Amount   Copy of line 7A -->
						<div class="styLNAmountBox" style="width:31.8mm;padding-right:1mm;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotClergyOtherUnreimExpnsAmt"/>
							</xsl:call-template>
						</div>
					<!-- Total Clergy Meals Times Percent Amount -->
						<div class="styLNAmountBox" style="width:32.2mm;padding-right:1mm;border-bottom-width:1px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalClergyMealsTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 8 -->
					
					<!-- Beginning of Step 9  -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">9</div>
						<div class="styLNDesc" style="width:108mm;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Add the amounts on line 8 of both columns and enter the total here
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="width:6mm;text-align:center;border-right-width:1px;">9</div>
					<!-- Sum Total Clergy Expenses Amount -->
						<div class="styLNAmountBox" style="padding-right:1mm;border-right-width:1px;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/SumTotalClergyExpensesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 9 -->
					
					<!-- Beginning of Step 10  -->					
					<div style="width:187mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:6.5mm;padding-top:1mm;text-align:center;border-top-width:0px;
						border-bottom-width:1px;border-left-width:1px;border-right-width:1px;">10</div>
						<div class="styLNDesc" style="height:6.5mm;width:108mm;font-size:6pt;padding-left:2mm;border-style:solid; border-color:black;
																		border-top-width:0px;border-bottom-width:1px;border-left-width:0px; 
																		border-right-width:0px;">Nondeductible part of Form 2106 or 2106-EZ expenses (multiply line 9 by the percent in<br/>
																											line 1)
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;width:6mm;padding-top:1mm;text-align:center;border-right-width:1px;">10</div>
					<!-- Figure Form2106 Deduction Nondeduction Expense Amount -->
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:1mm;padding-right:1mm;border-right-width:1px;border-left-width:0px;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/FgrFrm2106DedNondedExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:6.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:1px;border-right-width:1px;"/>
					</div>
					<!-- End of Step 10 -->
					
					<!-- Beginning of Step 11 Unreimbursed Employee Business Expense Amount-->					
				<div class="styBB" style="width:186mm;">
					<div style="width:186mm;font-size:7pt;">
						<div class="styLNLeftNumBoxBB" style="height:6.5mm;padding-top:1mm;text-align:center;border-top-width:0px;border-bottom-width:0px;border-left-width:1px;border-right-width:1px;">11</div>
						<div class="styLNDesc" style="height:6.5mm;width:108mm;font-size:6pt;padding-left:2mm;"><b>Ministerial employee business expense deduction allowed.* </b>Subtract line 10 from line 9.<br/>
																																			Enter the result here and on Form 2106, line 10, or Form 2106-EZ, line 6.
          <!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;width:6mm;padding-top:1mm;text-align:center;border-style:solid;
		border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;">11</div>
						<div class="styLNAmountBox" style="height:6.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:0px;border-right-width:1px;"/>
					<!-- Unreimbursed Employee Business Expense Amount -->	
						<div class="styLNAmountBox" style="height:6.5mm;padding-right:1mm;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnreimEmployeeBusExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Step 11 -->
 </div>
  					<!-- End signature part -->
					<div style="width:187mm;padding-top:1mm;padding-bottom:4mm;">
						* None of the other deductions claimed in this return are allocable to tax-free income.</div>
									<!-- END of Page 1 -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







