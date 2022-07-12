<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8962Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8962"/>
	<xsl:template name="ShrdPlcyAllGrpTemp">
		<xsl:param name="shrdCnt"/>
					<div class="styBB" style="width:187mm;float:none;clear:both;">		
						<div class="styPartDesc" style="width:187mm;padding-left:0mm;">Allocation <xsl:value-of select="$shrdCnt" /></div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:22.4mm"><xsl:value-of select="$shrdCnt+29"/></div>
						<div style="height:100%;float:left;">
						<div class="styPart4A"><b>a</b> Policy Number (Form 1095-A, line 2)<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PolicyNum"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4B" style="padding-left:1mm;"><b>b</b> SSN of taxpayer sharing allocation<br />	
						<span style="text-align:center;width:51mm">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
							</span>						
						</div>
						<div class="styPart4CD" style="border-right:1px solid black;"><b>c</b> Allocation start month<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StartMonthNumberCd"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4CD"><b>d</b> Allocation stop month<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EndMonthNumberCd"/>
							</xsl:call-template>						
						</div>
						</div>						
						<div class="styPart4AllocTxt">Allocation percentage<br />applied to monthly<br />amounts</div>
						<div class="styPart4EFG1" style="padding-top:2mm;"><b>e.</b> Premium Percentage</div>
						<div class="styPart4EFG1" style="padding-top:2mm;"><b>f.</b> SLCSP Percentage</div>
						<div class="styPart4EFG1" style="padding-top:.5mm;"><b>g.</b> Advance Payment of the PTC<br />Percentage</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumPct"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPPct"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCPct"/>
							</xsl:call-template>						
						</div>
					</div>
					<xsl:if test="$shrdCnt &lt; 4">
					<xsl:call-template name="ShrdPlcyAllGrpTemp">
					<xsl:with-param name="shrdCnt" select="$shrdCnt + 1"/>
					</xsl:call-template>
					</xsl:if>
	</xsl:template>
	
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8962"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
						<xsl:call-template name="IRS8962Style"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="margin-bottom:10px">
				<form name="Form8962">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">						
						<div class="styFNBox" style="width:31mm;height:19mm;border-right:none;vertical-align:bottom;">
							Form <span class="styFormNumber">8962</span>
							<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
							<div style="padding-top:0mm;">
								<br/>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:19mm;">
							<div class="styMainTitle">	
								Premium Tax Credit (PTC)
							</div>
							<div class="styFBT" style="height:4mm;margin-top:0mm;">
								<br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
								Attach to Form 1040, 1040A, or 1040NR.<br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
								Information about Form 8962 and its separate instructions is at <i>www.irs.gov/form8962</i>.
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;border-left:none;">
							<div class="styOMB" style="">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="line-height:30px;">20<span class="styTYColor" style="display:inline;">16</span></div>
							<div style="margin-left:3mm; text-align:left;">
								Attachment<br/>Sequence No. <span class="styBoldText">73</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					
					<!-- Begin Name and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:125mm;height:8mm;font-size:6pt;">
							Name shown on your return<br/>
							<div style="font-family:verdana;font-size:7pt;padding-top:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:62mm;height:8mm;padding-left:2mm;font-size:6pt;font-weight:normal;">
							Your social security number<br/>
							<span style="text-align:center;width:57mm;font-size:7pt;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="187mm;">
						<div class="styNameBox" style="width:187mm;height:8mm;font-size:6pt;border-right:0px solid black;padding-left:1mm;padding-top:2mm;">
							You cannot claim the PTC if your filing status is married filing separately unless you qualify for an exception
							<span style="float:right;">						
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MarriedFilingSeparatelyExcInd"/>								
										<xsl:with-param name="BackupName">IRS8962MarriedFilingSeparatelyExcInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MarriedFilingSeparatelyExcInd"/>
										<xsl:with-param name="BackupName">IRS8962MarriedFilingSeparatelyExcInd</xsl:with-param>
									</xsl:call-template>							
								</label>
							</span>	
								(see instructions).  If you qualify, check the box.					
						</div>
					</div>			
					<div class="styBB" style="width:187mm;">		
						<div class="styPartName" style="width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:175mm;padding-left:2mm;">Annual and Monthly Contribution Amount</div>											
					</div>
					<!-- BEGIN LINE 1 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:142mm;font-size:6.5pt;">
							Tax family size.  Enter the number of exemptions from Form 1040 or Form 1040A, line 6d, or Form 1040NR, line 7d
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 1 -->
					<!-- BEGIN LINE 2 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">2a</div>
						<div class="styLNDesc" style="width:46.5mm;padding-top:1mm;">
							Modified AGI. Enter your modified<br />
							<span style="float:left;font-size:7pt;">AGI (see instructions)</span>
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.														
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2a</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:8mm;width:29mm;padding-top:4mm;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="padding-left:1.5mm;width:5mm;padding-top:1.5mm;">b</div>
						<div class="styLNDesc" style="width:53.5mm;padding-top:1.5mm;">
							Enter the total of your dependents'<br/>
							<span style="float:left;font-size:7pt;">modified AGI (see instructions)</span>
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2b</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:8mm;width:29mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDependentsModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 2 -->
					<!-- BEGIN LINE 3 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:142mm;">
							<span style="float:left;font-size:7pt;">Household income. Add the amounts on lines 2a and 2b</span>
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.							
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">3</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HouseholdIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 3 -->
					<!-- BEGIN LINE 4 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:142mm;font-size:6.5pt;">
							Federal poverty line. Enter the federal poverty line amount from Table 1-1, 1-2, or 1-3 (see instructions).
							 Check the appropriate box for the federal poverty table used.
							<span style="width:5px;" /><b>a</b><span style="width:5px;" /><input type="checkbox" class="styCkbox">
							<xsl:if test="$FormData/FederalPovertyTableLocCd = 'A'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>				
							<xsl:call-template name="PopulateEnumeratedCheckbox">								
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>	
								<xsl:with-param name="DisplayedCheckboxValue" select="'A'"/>							
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[A]</xsl:with-param>
							</xsl:call-template>							
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="'A'"/>
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[A]</xsl:with-param>
							</xsl:call-template>							
						</label><span style="width:5px;" />Alaska<span style="width:5px;" />
						<b>b</b><span style="width:5px;" /><input type="checkbox" class="styCkbox">
						<xsl:if test="$FormData/FederalPovertyTableLocCd = 'B'">
						<xsl:attribute name="checked">checked</xsl:attribute>
						</xsl:if>
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="'B'"/>								
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[B]</xsl:with-param>
							</xsl:call-template>							
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="'B'"/>
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[B]</xsl:with-param>
							</xsl:call-template>							
						</label><span style="width:5px;" />Hawaii<span style="width:5px;" />
						<b>c</b><span style="width:5px;" /><input type="checkbox" class="styCkbox">
						<xsl:if test="$FormData/FederalPovertyTableLocCd = 'C'">
						<xsl:attribute name="checked">checked</xsl:attribute>	
						</xsl:if>
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="'C'"/>								
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[C]</xsl:with-param>
							</xsl:call-template>							
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyTableLocCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="'C'"/>
								<xsl:with-param name="BackupName">IRS8962FederalPovertyTableLocCd[C]</xsl:with-param>
							</xsl:call-template>							
						</label><span style="width:5px;" />Other 48 states and DC
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:8mm;width:29mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PovertyLevelAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">5</div>
						<div class="styLNDesc" style="width:142mm;padding-top:1mm;">
							Household income as a percentage of federal poverty line (see instructions)
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">5</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:5mm;width:29mm;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyLevelPct"/>
							</xsl:call-template> %
						</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:142mm;">
							Did you enter 401% on line 5? (See instructions if you entered less than 100%.)<br />
							<input type="checkbox" class="styCkbox" style="margin-left:0px;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyLevelPct401Ind"/>								
									<xsl:with-param name="BackupName">IR8962FederalPovertyLevelPct401Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyLevelPct401Ind"/>
									<xsl:with-param name="BackupName">IRS8962FederalPovertyLevelPct401Ind</xsl:with-param>
								</xsl:call-template>							
							</label><span style="padding-left:1mm;"><b>No.</b> Continue to line 7.</span><br />
							<input type="checkbox" class="styCkbox" style="margin-left:0px;vertical-align:top;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyLevelPct401Ind"/>								
									<xsl:with-param name="BackupName">IRS8962FederalPovertyLevelPct401Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/FederalPovertyLevelPct401Ind"/>
									<xsl:with-param name="BackupName">IRS8962FederalPovertyLevelPct401Ind</xsl:with-param>
								</xsl:call-template>							
							</label><span style="padding-top:4px;padding-left:1mm;"><b>Yes. </b>You are not eligible to take the PTC. If advance payment of the PTC was made, see the instructions for</span><br />
							 how to report your excess advance PTC repayment amount.
						</div>
						<div class="styLNRightNumBox" style="height:17.2mm;padding-top:4mm;background-color:lightgray;"><span style="width:1px;" /></div>
						<div class="styLNAmountBox" style="font-size:6pt;height:17.2mm;width:29mm;padding-top:4mm;background-color:lightgray;">
							<span style="width:1px;" />
						</div>
					</div>
					<!-- END LINE 6 -->
					<!-- BEGIN LINE 7 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:142mm;">
							Applicable Figure. Using your line 5 percentage, locate your “applicable figure” on the table in the instructions
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ApplicableFigureRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 7 -->
					<!-- BEGIN LINE 8 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="styLNDesc" style="width:46.5mm;">
							Annual contribution amount.<br />
							<span style="float:left;font-size:7pt;">Multiply line 3 by line 7</span>
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.														
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.8mm;border-bottom:0px solid black;">8a</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:7mm;width:29mm;padding-top:3.8mm;border-right:1px solid black;border-bottom:0px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="padding-left:2.5mm;width:6mm;">b</div>
						<div class="styLNDesc" style="width:52.5mm;font-family:Arial;">
							Monthly contribution amount. Divide line 8a by 12. Round to nearest whole dollar amount						
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.8mm;border-bottom:0px solid black;">8b</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:7mm;width:29mm;padding-top:3.8mm;border-bottom:0px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyContriHealthCareCvrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 8 -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:13mm;">Part II</div>
						<div class="styPartDesc" style="width:174mm;padding-left:2mm;">Premium Tax Credit Claim and Reconciliation of Advance Payment of Premium Tax Credit</div>
					</div>
					<!-- BEGIN LINE 9 -->
					<div class="styBB" style="width:187mm;height:14mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:179mm;height:5.5mm;">
							Are you allocating policy amounts with another taxpayer or do you want to use the alternative calculation for year of marriage (see instructions)?												
						</div>
						<div class="styLNLeftNumBoxSD"><span style="width:1px;" /></div>
						<div class="styLNDesc" style="width:120mm;">
							<input type="checkbox" class="styCkbox" style="margin-left:0px;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SharePolicyMarriedAltCalcInd"/>								
									<xsl:with-param name="BackupName">IRS8962SharePolicyMarriedAltCalcInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/SharePolicyMarriedAltCalcInd"/>
									<xsl:with-param name="BackupName">IRS8962SharePolicyMarriedAltCalcInd</xsl:with-param>
								</xsl:call-template>
							<span style="width:5px;" /><b>Yes. </b></label><span style="font-family:Arial;display:inline;">Skip to Part IV, Allocation of Policy Amounts, or Part V,
							 Alternative Calculation for Year of Marriage.</span></div>
						<div class="styLNDesc" style="width:58mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SharePolicyMarriedAltCalcInd"/>								
									<xsl:with-param name="BackupName">IRS8962SharePolicyMarriedAltCalcInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/SharePolicyMarriedAltCalcInd"/>
									<xsl:with-param name="BackupName">IRS8962SharePolicyMarriedAltCalcInd</xsl:with-param>
								</xsl:call-template>
							<span style="width:5px;" /><b>No.</b> Continue to line 10.</label>
						</div>					
					</div>
					<!-- END LINE 9 -->
					<!-- BEGIN LINE 10 -->
					<div class="styBB" style="width:187mm;height:16mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:179mm;">
							See the instructions to determine if you can use line 11 or must complete lines 12 through 23.												
						</div>
						<div class="styLNLeftNumBoxSD"><span style="width:1px;" /></div>
						<div class="styLNDesc" style="width:120mm;">
						<input type="checkbox" class="styCkbox" style="margin-left:0px;">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FullYrCoverage1095AInd"/>								
								<xsl:with-param name="BackupName">IRS8962FullYrCoverage1095AInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$FormData/FullYrCoverage1095AInd"/>
								<xsl:with-param name="BackupName">IRS8962FullYrCoverage1095AInd</xsl:with-param>
							</xsl:call-template>
						<span style="width:5px;" /><b>Yes.</b> Continue to line 11.</label> Compute your annual PTC, then skip lines 12–23<br />and continue to line 24.</div>
						<div class="styLNDesc" style="width:59mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FullYrCoverage1095AInd"/>								
								<xsl:with-param name="BackupName">IRS8962FullYrCoverage1095AInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$FormData/FullYrCoverage1095AInd"/>
								<xsl:with-param name="BackupName">IRS8962FullYrCoverage1095AInd</xsl:with-param>
							</xsl:call-template>
						<span style="width:5px;" /><b>No.</b> Continue to lines 12–23.</label> Compute your monthly PTC and continue to line 24.</div>					
					</div>
					<!-- END LINE 10 -->
					<!-- BEGIN ANNUAL CALCULATION -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblTitlesA1" style="padding-top:3.5mm;">Annual<br />Calculation</div>
						<div class="styAnnMonTblTitlesB1"><b>(a)</b> Annual enrollment<br />premiums
							 <span style="font-size:6pt;">(Form(s)<br />1095-A, line 33a)</span></div>
						<div class="styAnnMonTblTitlesC1"><b>(b)</b> Annual applicable<br />SLCSP premium<br />
							<span style="font-size:6pt;">(Form(s) 1095-A,<br />line 33b)</span></div>
						<div class="styAnnMonTblTitlesC1" style="padding-top:1mm;"><b>(c)</b> Annual contribution amount
							 <span style="font-size:6pt;">(Line 8a)</span></div>
						<div class="styAnnMonTblTitlesC1"><b>(d)</b> Annual maximum premium assistance 
							<span style="font-size:6pt;">(subtract (c) from (b), if zero	or less, enter -0-)</span></div>
						<div class="styAnnMonTblTitlesC1" style="padding-top:1mm;"><b>(e)</b> Annual premium tax credit allowed
							 <span style="font-size:6pt;">(smaller of (a) or (d))</span></div>
						<div class="styAnnMonTblTitlesC1"><b>(f)</b> Annual advance payment of PTC
							 <span style="font-size:6pt;">(Form(s) 1095-A, line 33c)</span></div>
					</div>
					<!-- BEGIN LINE 11 -->					
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox" style="width:5.8mm;">11</div>
						<div class="styLNDesc" style="width:20.2mm;">Annual Totals</div>
						</div>
						<div class="styAnnMonTblCellsB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualPremiumAmt"/>
							</xsl:call-template>
						</div>
						<div class="styAnnMonTblCellsC">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualPremiumSLCSPAmt"/>
							</xsl:call-template>
						</div>
						<div class="styAnnMonTblCellsC">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styAnnMonTblCellsC">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styAnnMonTblCellsC">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</div>
						<div class="styAnnMonTblCellsC">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualPTCCalculationGrp/AnnualAdvancedPTCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 11 -->
					<!-- END ANNUAL CALCULATION -->
					<!-- BEGIN MONTHLY CALCULATION -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblTitlesA2" style="padding-top:7mm;">Monthly<br />Calculation</div>
						<div class="styAnnMonTblTitlesB2" style="padding-top:3mm;"><b>(a)</b> Monthly enrollment premiums 
						<span style="font-size:6pt;">(Form(s) 1095-A, lines 21–32, column a)</span></div>
						<div class="styAnnMonTblTitlesC2" style="padding-top:3mm;"><b>(b)</b> Monthly applicable SLCSP premium
							 <span style="font-size:6pt;">(Form(s) 1095-A, lines 21–32, column b)</span></div>
						<div class="styAnnMonTblTitlesC2"><b>(c)</b> Monthly contribution amount
							 <span style="font-size:6pt;">(amount from line 8b or alternative marriage monthly calculation)</span></div>
						<div class="styAnnMonTblTitlesC2" style="padding-top:5mm;"><b>(d)</b> Monthly maximum premium assistance
							 <span style="font-size:6pt;">(subtract (c) from (b).  If zero or less, enter -0-.)</span></div>
						<div class="styAnnMonTblTitlesC2" style="padding-top:5mm;"><b>(e)</b> Monthly premium tax credit allowed
							 <span style="font-size:6pt;">(smaller of (a) or (d))</span></div>
						<div class="styAnnMonTblTitlesC2" style="padding-top:3mm;"><b>(f)</b> Monthly advance payment of PTC
							 <span style="font-size:6pt;">(Form(s) 1095-A, lines 21–32, column c)</span></div>
					</div>
					<!-- BEGIN LINE 12 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:14mm;">January</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JANUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 12 -->
					<!-- BEGIN LINE 13 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:14mm;">February</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'FEBRUARY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 13 -->
					<!-- BEGIN LINE 14 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:14mm;">March</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MARCH']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 14 -->
					<!-- BEGIN LINE 15 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:14mm;">April</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'APRIL']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 15 -->
					<!-- BEGIN LINE 16 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:14mm;">May</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'MAY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 16 -->
					<!-- BEGIN LINE 17 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:14mm;">June</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JUNE']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 17 -->
					<!-- BEGIN LINE 18 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:14mm;">July</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'JULY']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 18 -->
					<!-- BEGIN LINE 19 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:14mm;">August</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'AUGUST']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 19 -->
					<!-- BEGIN LINE 20 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:14mm;">September</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'SEPTEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 20 -->
					<!-- BEGIN LINE 21 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:14mm;">October</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'OCTOBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 21 -->
					<!-- BEGIN LINE 22 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:14mm;">November</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'NOVEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 22 -->
					<!-- BEGIN LINE 23 -->
					<div class="styBB" style="width:187mm;">
						<div class="styAnnMonTblCellsA">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:14mm;">December</div>
						</div>
						<div class="styAnnMonTblCellsB">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyContributionAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyMaxPremiumAssistanceAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumTaxCreditAllwAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
						<div class="styAnnMonTblCellsC">
						<xsl:for-each select="$FormData/MonthlyPTCCalculationGrp[MonthCd = 'DECEMBER']">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCAmt"/>
							</xsl:call-template>
						</xsl:for-each>
						</div>
					</div>
					<!-- END LINE 23 -->
					<!-- END ANNUAL CALCULATION -->
					<!-- BEGIN LINE 24 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:142mm;font-size:6.5pt;">
							Total premium tax credit. Enter the amount from line 11(e) or add lines 12(e) through 23(e) and enter the total here
						</div>
						<div class="styLNRightNumBox">24</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPremiumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 24 -->
					
					<div class="pageEnd"/>
					
					<!-- BEGIN LINE 25 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:142mm;font-size:6.5pt;">
							Advance payment of PTC. Enter the amount from line 11(f) or add lines 12(f) through 23(f) and enter the total here
						</div>
						<div class="styLNRightNumBox">25</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdvancedPTCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 25 -->
					<!-- BEGIN LINE 26 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="width:142mm;font-family:Arial;">
						Net premium tax credit. If line 24 is greater than line 25, subtract line 25 from line 24. Enter the difference here and on Form 1040, line 69; Form 1040A, line 45; or Form 1040NR, line 65. 
						If line 24 equals line 25, enter zero. Stop here. If line 25 is greater than line 24, leave this line blank and continue to line 27
						</div>
						<div class="styLNRightNumBox" style="height:10mm;border-bottom:0px solid black;padding-top:6mm;">26</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:10mm;width:29mm;border-bottom:0px solid black;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 26 -->
					<div class="styBB" style="width:187mm;">		
						<div class="styPartName" style="width:14mm;">Part III</div>
						<div class="styPartDesc" style="width:173mm;padding-left:2mm;">Repayment of Excess Advance Payment of the Premium Tax Credit</div>											
					</div>
					<!-- BEGIN LINE 27 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="width:142mm;font-family:Arial;">
							Excess advance payment of PTC. If line 25 is greater than line 24, subtract line 24 from line 25. Enter the difference here
						</div>
						<div class="styLNRightNumBox">27</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessAdvncPaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 27 -->
					<!-- BEGIN LINE 28 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="width:142mm;">
							Repayment limitation (see instructions)
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.							
							<span style="width:11px;"/>.								
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">28</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxLimitationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 28 -->
					<!-- BEGIN LINE 29 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="width:142mm;">
							Excess advance premium tax credit repayment. Enter the smaller of line 27 or line 28 here and on Form <br/>
							<span style="float:left;font-size:7pt;">1040, line 46; Form 1040A, line 29; or Form 1040NR, line 44</span>
							<span style="float:right;font-weight:bold;padding-right:3mm;">
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.
							<span style="width:11px;"/>.														
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-bottom:0px solid black;padding-top:4mm;">29</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:8mm;width:29mm;border-bottom:0px solid black;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 29 -->
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:1px solid black; padding-top:0.5mm;text-align:right;">
						<div style="float:left;width:115mm;font-weight:bold;text-align:left;">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
						<div style="float:left;">Cat. No. 37784Z</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8962</span> (2016)
						</div>						
					</div>
					<p style="page-break-before: always"/>
					<div class="styBB" style="width:187mm;">
						<span style="float:left;clear:none;">Form 8962 (2016)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					</div>
					<div class="styBB" style="width:187mm;">		
						<div class="styPartName" style="width:13mm;">Part IV</div>
						<div class="styPartDesc" style="width:174mm;padding-left:2mm;">Allocation of Policy Amounts</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:both;">		
						<div class="styDesc" style="width:187mm;padding-left:0mm;">Complete the following information for up to four shared policy allocations. See instructions for allocation details.</div>
					</div>
					
					<!-- BEGIN LINES 30 - 33 -->
					<xsl:for-each select="$FormData/SharedPolicyAllocationGrp">
					<div class="styBB" style="width:187mm;float:none;clear:both;">		
						<div class="styPartDesc" style="width:187mm;padding-left:0mm;">Allocation <xsl:value-of select="position()" /></div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:22.4mm"><xsl:value-of select="position()+29"/></div>
						<div style="height:100%;float:left;">
						<div class="styPart4A"><b>(a)</b> Policy Number (Form 1095-A, line 2)<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PolicyNum"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4B" style="padding-left:1mm;"><b>(b)</b> SSN of other taxpayer<br />	
						<span style="text-align:center;width:51mm">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
							</span>						
						</div>
						<div class="styPart4CD" style="border-right:1px solid black;"><b>(c)</b> Allocation start month<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StartMonthNumberCd"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4CD"><b>(d)</b> Allocation stop month<br />						
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EndMonthNumberCd"/>
							</xsl:call-template>						
						</div>
						</div>						
						<div class="styPart4AllocTxt">Allocation percentage<br />applied to monthly<br />amounts</div>
						<div class="styPart4EFG1" style="padding-top:2mm;"><b>(e)</b> Premium Percentage</div>
						<div class="styPart4EFG1" style="padding-top:2mm;"><b>(f)</b> SLCSP Percentage</div>
						<div class="styPart4EFG1" style="padding-top:2mm;"><b>(g)</b> Advance Payment of the PTC<br />Percentage</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumPct"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyPremiumSLCSPPct"/>
							</xsl:call-template>						
						</div>
						<div class="styPart4EFG2">						
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MonthlyAdvancedPTCPct"/>
							</xsl:call-template>						
						</div>
					</div>
					</xsl:for-each>
					<!-- END LINES 30 - 33 -->
					<!-- Lines 30 - 33 Blank -->					
					<xsl:if test="count($FormData/SharedPolicyAllocationGrp) &lt; 4">
					<xsl:call-template name="ShrdPlcyAllGrpTemp">
					<xsl:with-param name="shrdCnt" select="count($FormData/SharedPolicyAllocationGrp) + 1"/>
					</xsl:call-template>
					</xsl:if>
					
					
									
				
					<!-- BEGIN LINE 34 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc" style="width:179mm;">
							Have you completed all policy amount allocations?
						</div>
						<div class="styLNLeftNumBox"><span style="width:1px;" /></div>
						<div class="styLNDesc" style="width:179mm;height:auto;padding-top:0px;">
							<input type="checkbox" class="styCkbox" style="margin-left:0px;margin-top:0px;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SharedPolicyAllocationInfoInd"/>								
									<xsl:with-param name="BackupName">IRS8962SharedPolicyAllocationInfoInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/SharedPolicyAllocationInfoInd"/>
									<xsl:with-param name="BackupName">IRS8962SharedPolicyAllocationInfoInd</xsl:with-param>
								</xsl:call-template>							
							<span style="width:5px;" /><b>Yes. </b></label> Multiply the amounts on Form 1095-A by the allocation percentages entered by policy. Add all allocated policy amounts and non-allocated policy amounts from Forms 1095-A, if any, to compute a combined total for each month. Enter the combined total for each month on lines 12–23, columns (a), (b), and (f). Compute the amounts for lines 12–23, columns (c)–(e), and continue to line 24.
						</div>
						<div class="styLNDesc" style="width:187mm;"></div>
						<div class="styLNLeftNumBox"><span style="width:1px;" /></div>						
						<div class="styLNDesc" style="width:179mm;height:5.4mm;">
						<input type="checkbox" class="styCkbox" style="margin-left:0px;">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SharedPolicyAllocationInfoInd"/>								
								<xsl:with-param name="BackupName">IRS8962SharedPolicyAllocationInfoInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$FormData/SharedPolicyAllocationInfoInd"/>
								<xsl:with-param name="BackupName">IRS8962SharedPolicyAllocationInfoInd</xsl:with-param>
							</xsl:call-template>							
						<span style="width:5px;" /><b>No. </b></label> See the instructions to report additional amount policy allocations.</div>					
					</div>
					<!-- END LINE 34 -->
					<div class="styBB" style="width:187mm;">		
						<div class="styPartName" style="width:12mm;">Part V</div>
						<div class="styPartDesc" style="width:175mm;padding-left:2mm;">Alternative Calculation for Year of Marriage</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:both;">		
						<div class="styDesc" style="width:187mm;padding-left:0mm;">Complete line(s) 35 and/or 36 to elect the alternative calculation for year of marriage. For eligibility to make the election, see the instructions for line 9.
To complete line(s) 35 and/or 36 and compute the amounts for lines 12-23, see the instructions for this Part V.</div>
					</div>
					<!-- BEGIN LINE 35 -->
					<div class="styBB" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox">35</div>
						<div class="styPart5Line35A" style="height:10mm;">Alternative entries<br />for your SSN</div>
						<div class="styPart5Line35B" style="height:10mm;"><b>(a)</b> Alternative family size<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriagePrimaryGrp/FamilySizeCnt"/>
							</xsl:call-template>
						</div>
						<div class="styPart5Line35B" style="height:10mm;"><span style="float:left;"><b>(b)</b> Alternative monthly contribution amount</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriagePrimaryGrp/MonthlyContributionAmt"/>
							</xsl:call-template>
							</span>
						</div>
						<div class="styPart5Line35B" style="height:10mm;"><b>(c)</b> Alternative start month<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriagePrimaryGrp/StartMonthNumberCd"/>
							</xsl:call-template>
						</div>
						<div class="styPart5Line35B" style="height:10mm;"><b>(d)</b> Alternative stop month<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriagePrimaryGrp/EndMonthNumberCd"/>
							</xsl:call-template>
						</div>
					</div>					
					<!-- END LINE 35 -->
					<!-- BEGIN LINE 36 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">36</div>
						<div class="styPart5Line36A">Alternative entries<br />for your spouse's<br />SSN</div>
						<div class="styPart5Line36B"><b>(a)</b> Alternative family size<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriageSpouseGrp/FamilySizeCnt"/>
							</xsl:call-template>
						</div>
						<div class="styPart5Line36B"><span style="float:left;"><b>(b)</b> Alternative monthly contribution amount<br /></span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriageSpouseGrp/MonthlyContributionAmt"/>
							</xsl:call-template>
							</span>
						</div>
						<div class="styPart5Line36B"><b>(c)</b> Alternative start month<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriageSpouseGrp/StartMonthNumberCd"/>
							</xsl:call-template>
						</div>
						<div class="styPart5Line36B"><b>(d)</b> Alternative stop month<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AltCalcForMarriageSpouseGrp/EndMonthNumberCd"/>
							</xsl:call-template>
						</div>
					</div>				
					<!-- END LINE 36 -->
				
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;padding-top:0.5mm;text-align:right;">
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8962</span> (2016)
						</div>						
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="-1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					
					
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>




