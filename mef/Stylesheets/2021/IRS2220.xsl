<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2220Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2220Data" select="$RtnDoc/IRS2220"/>
	<xsl:param name="Form2220ScheduleA" select="$RtnDoc/IRS2220/IRS2220ScheduleAGrp"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2220Data)"/>
					</xsl:call-template>
				</title>
				<!--No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 2220"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--HINTS: Part IV exists in both inline and separated print Unique Feature: Part IV (inline and empty are in Div format) and (separated is in table format) -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2220Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2220">
					<div class="styGenericDiv" style=" width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styTBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:29mm;height:20mm;border-right-width:2px;">
							<div style="padding-top:1mm;">
								Form <span class="styFormNumber"> 2220 <br/> </span>
							</div>
							<div style="padding-top:3.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:16mm;padding-top:1mm;">
							<div style="height:8mm;" class="styMainTitle">Underpayment of Estimated Tax by Corporations</div>
							<div class="styFBT" style="height:5mm;padding-top:2mm;">
								<img src="{$ImagePath}/2220_Bullet.gif" alt="Bullet"/>
Attach to the corporation's tax return.
<br/>
								<img src="{$ImagePath}/2220_Bullet.gif" alt="Bullet"/>
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/FORM2220" title="Link to irs.gov/FORM2220">
									<i>www.irs.gov/FORM2220</i></a> for instructions and the latest information.
</div>
						</div>
						<div class="styTYBox" style="border-left-width:2px;width:29mm;height:20mm;padding-top:1mm;">
							<div class="styOMB">OMB No. 1545-0123</div>
							<div class="styTaxYear" style="padding-top:3mm;">
20<span class="styTYColor">21
</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styNameBox" style="width:137mm;font-size:7pt;font-weight:normal;">
Name
<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!--EIN Line -->
						<div class="styEINBox" style="width:48mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
Employer identification number
<br/>
							<br/>
							<span style="width: 40mm; text-align: left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Note Line -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styBB" style="width:187mm;">
							<b>Note: </b> <i> Generally, the corporation isn't required to file Form 2220 (see Part II below for
exceptions) because the IRS will figure any penalty owed and bill the corporation.
However, the corporation may still use Form 2220 to figure the penalty. If so, enter
the amount from page 2, line 38 on the estimated tax penalty line of the corporation's
income tax return, but <b> do not </b> attach Form 2220. </i>
						</div>
						<!-- BEGIN PART I TITLE -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:3.5mm;">Part I</div>
							<div class="styPartDesc">Required Annual Payment</div>
						</div>
						<!-- END PART I TITLE -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc"/>
							<div class="styLNRightNumBox" style="border-bottom:0px;"/>
							<div class="styLNAmountBox" style="border-bottom:0px;"/>
						</div>
						<!--Line 1 -->
<div style="width:187mm;">
	<div class="styLNLeftNumBoxSD">1</div>
	<div class="styLNDesc" style="padding-top:0mm;padding-bottom:0mm;">
		    <!--<span style="float:left;">-->
		    Total tax (see instructions)
		    <span style="width:2px;"/>                                                                                            
		    <xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Line 1 - Section 338 Gain Indicator</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainCd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Line 1 - Section 338 Gain Amount</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainAmt"/>                                                                                                                                                                                                    </xsl:call-template>
		    <span class="styDotLn" style="float:right;">.......................</span>
	</div>
	<div class="styLNRightNumBox">1</div>
	<div class="styLNAmountBox">
		    <xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt"/>
		    </xsl:call-template>
	</div>
</div> 




<!--						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="padding-top:0mm;padding-bottom:0mm;">
								--><!--<span style="float:left;">--><!--
Total tax (see instructions)
<span style="width:2px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">
Line 1 - Section 338 Gain Indicator
</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">
Line 1 - Section 338 Gain Amount
</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainAmt"/>
										<xsl:with-param name="Style">
padding-left:3mm;
</xsl:with-param>
									</xsl:call-template>
								--><!--</span>--><!--
								--><!--Dotted Lines --><!--
								<span class="styDotLn" style="float:right;">.......................</span>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
	-->					<!--Line 2a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:0.6mm;">2a</div>
							<div class="styLNDesc" style="width:98mm;height:5mm;padding-top:1mm;">
Personal holding company tax (Schedule PH (Form 1120), line 26)
<span style="float:left;">
 included on line 1
							</span>
								<!-- Dotted Lines -->
								<span class="styDotLn" style="float:right;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/PersonalHoldingCompanyTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;padding-top:1mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:1mm;"/>
						</div>
						<!--Line 2b -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:98mm;">
Look-back interest included on line 1 under section
460(b)(2) for completed long-term contracts or section 167(g) for depreciation under the income
<span style="float:left;">
 forecast method</span>
								<!-- Dotted Lines -->
								<span class="styDotLn" style="float:right;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">2b</div>
							<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/LookbackInterestIncludedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;padding-top:1.4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:11mm;padding-top:1.4mm;"/>
						</div>
						<!--Line 2c -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:5mm;padding-top:1mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:98mm;height:5mm;padding-top:1mm;">
								<span style="float:left;">Credit for federal tax paid on fuels (see instructions)</span>
								<!-- Dotted Lines -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">2c</div>
							<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalFuelTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:1mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;padding-top:1mm;"/>
						</div>
						<!--Line 2d -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
							<div class="styLNDesc">
								<span style="float:left;">
									<span class="styBoldText">Total.</span>
Add lines 2a through 2c
</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">........................</span>
							</div>
							<div class="styLNRightNumBox">2d</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalCreditAppliedToTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:7mm;">3</div>
							<div class="styLNDesc" style="height:7mm;">
Subtract line 2d from line 1. If the result is less than $500,
<span class="styBoldText">do not</span>
complete or file this form.
<span style="float:left;">The corporation doesn't owe the penalty</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxLessCreditSumAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc">
							Enter the tax shown on the corporation's 2020 income tax return.  See instructions.  <b>Caution: <i> 
							If the tax is zero or the tax year was for less than 12 months, skip this line and enter the amount from line 3 on line 5 </i></b>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">4</div>
							<div class="styLNAmountBox" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/PriorYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5 -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc">
								<span class="styBoldText">Required annual payment.</span>
Enter the
<span class="styBoldText">smaller</span>
of line 3 or line 4.
If the corporation is required to skip
<span style="float:left;">line 4, enter the amount from line 3</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">......................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:3.5mm;">5</div>
							<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredAnnualPaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;height:7mm;">
						<div class="styPartName" style="height:3.5mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:1mm;float:left;clear:none;font-weight:normal;">
							<b> Reasons for Filing &#8211;  </b>
 Check the boxes below that apply. If any boxes are checked, the corporation
<b> must </b> file Form 2220 even if it doesn't owe a penalty.  See instructions.
						</div>
					</div>
					<!-- END PART II TITLE -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!--Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">6</div>
							<div class="styLNDesc" style="width:178mm;">
								<input type="checkbox" class="styCkbox" alt="IRS2220 Using Adjusted Seasonal">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2220Data/AdjSeasonalInstalMethodInd"/>
										<xsl:with-param name="BackupName">
IRS2220UsingAdjustedSeasonal
</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form2220Data/AdjSeasonalInstalMethodInd"/>
										<xsl:with-param name="BackupName">
IRS2220UsingAdjustedSeasonal
</xsl:with-param>
									</xsl:call-template>
The corporation is using the adjusted seasonal installment method.
</label>
							</div>
						</div>
						<!--Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">7</div>
							<div class="styLNDesc" style="width:178mm;">
								<input type="checkbox" class="styCkbox" alt="IRS2220 Using Annualized Income">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2220Data/AnnualizedIncomeMethodInd"/>
										<xsl:with-param name="BackupName">
IRS2220UsingAnnualizedIncome
</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form2220Data/AnnualizedIncomeMethodInd"/>
										<xsl:with-param name="BackupName">
IRS2220UsingAnnualizedIncome
</xsl:with-param>
									</xsl:call-template>
The corporation is using the annualized income installment method.
</label>
							</div>
						</div>
						<!--Line 8 -->
						<div class="styBB" style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">8</div>
							<div class="styLNDesc" style="width:178mm;">
								<input type="checkbox" class="styCkbox" alt="IRS2220 Large Corporation 1st Installment">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2220Data/LargeCorporationInd"/>
										<xsl:with-param name="BackupName">
IRS2220LargeCorporation1stInstallment
</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form2220Data/LargeCorporationInd"/>
										<xsl:with-param name="BackupName">
IRS2220LargeCorporation1stInstallment
</xsl:with-param>
									</xsl:call-template>
The corporation is a "large corporation" figuring its first required installment based on the prior year's tax.
</label>
							</div>
						</div>
					</div>
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:3.5mm;">Part III</div>
						<div class="styPartDesc">Figuring the Underpayment</div>
					</div>
					<!-- END PART III TITLE -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styLNLeftNumBox"/>
						<div class="styIRS2220LNDescTbl"/>
						<div class="styLNRightNumBox" style="height:4.7mm;border-left-width:0px;"/>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(a)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(b)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(c)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(d)</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!--Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:14mm;">9</div>
							<div class="styIRS2220LNDescTbl" style="height:14mm;">
								<b>Installment due dates. </b> Enter in columns (a) through (d) the 15th day of the 4th
(<b>
									<i> Form 990-PF filers: </i>
								</b> Use 5th month), 6th, 9th, and 12th months of the corporation's tax year.  
<!--								<b> Filers  with  installments due on or after April 1, 2021,  and before July 15, 2021, see instructions. </b>-->
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.</span>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">9</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Installment1DueDt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Installment2DueDt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Installment3DueDt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Installment4DueDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:23mm;padding-left:.5mm">10</div>
							<div class="styIRS2220LNDescTbl" style="height:23mm;">
								<span class="styBoldText">Required installments.</span>
If the box on line 6 and/or line 7 above is checked, enter the amounts from Schedule A,
line 38. If the box on line 8 (but not 6 or 7) is checked, see instructions for the
amounts to enter.  If none of these boxes are checked, enter 25% (0.25) of line 5 above in each column
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:23mm;padding-top:19mm;">10</div>
							<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10mm;padding-left:.5mm">11</div>
							<div class="styIRS2220LNDescTbl" style="height:10mm;">
							Estimated tax paid or credited for each period. For column (a) only, enter the amount from line 11 on line 15.  See instructions.
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">11</div>
							<div class="styIRS2220Part2LNCell" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 12 Header-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;"/>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
								<span class="styBoldItalicText">Complete lines 12 through 18
of one column before going to the next column.
</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0;"/>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;"/>
						</div>
						<!--Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">12</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
							Enter amount, if any, from line 18 of the <span style="float:left;">preceding column</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">12</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styIRS2220LNDescTbl" style="height:4mm;">
								<span style="float:left;">Add lines 11 and 12</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">13</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:4mm;width:28mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid2AndOvpmt1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid3AndOvpmt2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid4AndOvpmt3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">14</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
Add amounts on lines 16 and 17 of the
<span style="float:left;">preceding column</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">14</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalUnderpayment2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/TotalUnderpayment3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">15</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
Subtract line 14 from line 13. If zero or
<span style="float:left;">less, enter -0-</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd2AndOvpmt1LessUndpymt1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd3AndOvpmt2LessUndpymt2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd4AndOvpmt3LessUndpymt3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">16</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
If the amount on line 15 is zero, subtract
<span style="float:left;">line 13 from line 14. Otherwise, enter -0-</span>
								<span class="styDotLn" style="float:right;">.</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">16</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UnderpaymentCarryover2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UnderpaymentCarryover3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
						</div>
						<!--Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:14mm;">17</div>
							<div class="styIRS2220LNDescTbl" style="height:14mm;">
								<span class="styBoldText">Underpayment.</span>
If line 15 is less than or equal to line 10, subtract line 15 from line 10.
Then go to line 12 of the next column.
<span style="float:left;">Otherwise, go to line 18</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">17</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 18 -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">18</div>
							<div class="styIRS2220LNDescTbl" style="height:11mm;">
								<span class="styBoldText">Overpayment.</span>
If line 10 is less than line 15, subtract line 10 from line 15. Then go
<span style="float:left;"> to line 12 of the next column</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;border-bottom:0px;">18</div>
							<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:11mm;width:28mm;"/>
						</div>
						<!-- Page 1 note -->
						<div class="styBoldItalicText" style="border-bottom-width: 2px; border-style:solid; border-color:black;border-left-width: 0px; border-right-width: 0px; border-top-width:0px; width: 187mm;">
Go to Part IV on page 2 to figure the penalty. Do not go to Part IV if there are no entries on line 17—no penalty is owed.
</div>
					</div>
					<!--Begin Page 1 Footer -->
					<p style="page-break-after: always">
						<div class="pageEnd" style="width:187mm;">
							<div class="stySmallText" style="width:110mm;">
								<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							</div>
							<div class="stySmallText" style="width:40mm;">Cat. No. 11746L</div>
							<div class="stySmallText" style="width:36mm;text-align:right;">Form<span class="styBoldText">2220</span>(2021)</div>
						</div>
						<!--End Page 1 Footer -->
					</p>
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
							<!-- Page 2 Header -->
							<div style="width:187mm;padding-top:.5mm;">
								<div style="float:left;">
Form 2220 (2021)
<span style="width:148mm;"/>
								</div>
								<div style="float:right;">
Page
<span style="font-weight:bold;font-size:8pt;">2</span>
								</div>
							</div>
							<!-- END Page Header -->
							<!-- BEGIN Part IV TITLE -->
							<div class="styBB" style="width:187mm;border-top-width:2px;border-bottom:0;">
								<div class="styPartName" style="height:3.5mm;">Part IV</div>
								<div class="styPartDesc">Figuring the Penalty</div>
							</div>
							<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<!-- Check if Separated Print is not selected and Part IV count is < 5 Inline format -->
							<xsl:if test="$Print != $Separated or count($Form2220Data/PaymentPenaltyComputationTxt) &lt; 5">
								<xsl:for-each select="$Form2220Data/PaymentPenaltyComputationTxt">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<xsl:if test="position() mod 4 = 1">
										<!--This check so no extra line display after the Part Title -->
										<xsl:if test="position()!=1">
											<div class="styBB" style="border:none;width:187mm;">
												<br/>
											</div>
										</xsl:if>
										<!--a, b , c, d table header Line -->
										<div class="styBB"  style="border-bottom:0;border-top-width:1px;width:186.5mm; float:none; clear:both;">
											<div class="styLNLeftNumBox"/>
											<div class="styIRS2220LNDescTbl"/>
											<div class="styLNRightNumBox" style="border-right-width:0px;height:5mm;"/>
											<div class="styIRS2220Part3LNCellHeader" style="border-left-width:0px;height:5mm;">
												<xsl:number value="position() " format=" (a) "/>
												<span class="styTableCellPad"/>
											</div>
											<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
												<xsl:number value="position() +1" format=" (a) "/>
												<span class="styTableCellPad"/>
											</div>
											<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
												<xsl:number value="position() +2" format=" (a) "/>
												<span class="styTableCellPad"/>
											</div>
											<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
												<xsl:number value="position() +3" format=" (a) "/>
												<span class="styTableCellPad"/>
											</div>
											<!--Line 19 in regular print -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:32mm;">19</div>
												<div class="styIRS2220LNDescTbl" style="height:32mm;">
												Enter the date of payment or the 15th day of the 4th month after the
close of the tax year, whichever is earlier. <b> Filers with  installments due on or after April 1, 2021,  and before July 15, 2021, see instructions.  (C Corporations with tax
years ending June 30 and S corporations: </b> Use 3rd month instead
of 4th month. <b> Form 990-PF and Form 990-T filers: </b> Use 5th month
instead of 4th month.) See instructions
											<!--Dotted Line -->
<!--													<span class="styDotLn" style="float:right;">........</span>
-->												</div>
												<div class="styLNRightNumBox" style="height:32mm;padding-top:28mm;">19</div>
												<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PaymentDt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/PaymentDt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/PaymentDt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/PaymentDt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 20 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">20</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days from due date of installment on line 9 to the date shown on line 19
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">..</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">20</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DaysFromDueDateToPaymentDtQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/DaysFromDueDateToPaymentDtQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/DaysFromDueDateToPaymentDtQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/DaysFromDueDateToPaymentDtQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 21 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">21</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 4/15/2021 and before 7/1/2021
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">21</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays1stDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays1stDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays1stDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays1stDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 22 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:11mm;">22</div>
												<div class="styIRS2220LNDescTbl" style="height:11mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 21
</span>
													<span style="width:2px"/>
x 3% (0.03)
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">22</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty1stDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty1stDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty1stDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty1stDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 23 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">23</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 6/30/2021 and before 10/1/2021 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">23</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays2ndDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays2ndDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays2ndDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays2ndDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 24 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">24</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 23</span>
													<span style="width:2px"/>
x *% (*)
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">24</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty2ndDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty2ndDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty2ndDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty2ndDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 25 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">25</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 9/30/2021 and before 1/1/2022 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">25</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays3rdDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays3rdDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays3rdDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays3rdDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 26 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">26</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 25</span>
													<span style="width:2px"/>
x *% (*)
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty3rdDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty3rdDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty3rdDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty3rdDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 27 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">27</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 12/31/2021 and before 4/1/2022 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">27</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays4thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays4thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays4thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays4thDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 28 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">28</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 27</span>
													<span style="width:2px"/>
x *% (*)
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">28</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty4thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty4thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty4thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty4thDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 29 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">29</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 3/31/2022 and before 7/1/2022 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays5thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays5thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays5thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays5thDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 30 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">30</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 29</span>
													<span style="width:2px"/>
x *%
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">30</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty5thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty5thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty5thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty5thDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 31 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">31</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 6/30/2022 and before 10/1/2022
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">31</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays6thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays6thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays6thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays6thDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 32 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">32</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 31</span>
													<span style="width:2px"/>
x *%
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">32</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty6thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty6thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty6thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty6thDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 33 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">33</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 9/30/2022 and before 1/1/2023 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">33</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays7thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays7thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays7thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays7thDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 34 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">34</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 33</span>
													<span style="width:2px"/>
x *%
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">34</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty7thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty7thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty7thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty7thDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 35 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:8mm;">35</div>
												<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 12/31/2022 and before 3/16/2023 
											<!--Dotted Line -->
													<span class="styDotLn" style="float:right;">.......</span>
												</div>
												<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">35</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LateDays8thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays8thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays8thDateRangeQty"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays8thDateRangeQty"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 36 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:10mm;">36</div>
												<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
													<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 35</span>
													<span style="width:2px"/>
x *%
<br/>
													<span style="width:60px"/>
365
</div>
												<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">36</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Penalty8thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty8thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty8thDateRangeAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:10mm;padding-top:6mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty8thDateRangeAmt"/>
													</xsl:call-template>
												</div>
											</div>
											<!--Line 37 -->
											<div style="width:187mm;">
												<div class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">37</div>
												<div class="styIRS2220LNDescTbl" style="height:7mm;padding-top:2mm;">
Add lines 22, 24, 26, 28, 30, 32, 34, and 36 
										</div>
												<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">37</div>
												<div class="styIRS2220Part3LNCell" style="height:7mm;padding-top:3mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPenaltyPaymentDateAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:7mm;padding-top:3mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/TotalPenaltyPaymentDateAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:7mm;padding-top:3mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/TotalPenaltyPaymentDateAmt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS2220Part3LNCell" style="height:7mm;padding-top:3mm;">
													<span style="float:left;padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/TotalPenaltyPaymentDateAmt"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							<!-- Check when separated print is selected and Part IV count is >4 populate the empty grid when there is no PaymentPenaltyComputation -->
							<!--<xsl:if test="not($Form2220Data/PaymentPenaltyComputation) or ((count($Form2220Data/PaymentPenaltyComputation) &gt; 4) and ($Print = $Separated))"> -->
							<xsl:if test="(count($Form2220Data/PaymentPenaltyComputationTxt) &lt; 1) or (($Print = $Separated) and (count($Form2220Data/PaymentPenaltyComputationTxt) &gt; 4))">
								<!--a, b , c, d table header Line -->
								<div class="styBB" style="border-top-width:1px;border-bottom:0;width:187mm;">
									<div class="styLNLeftNumBox"/>
									<div class="styIRS2220LNDescTbl"/>
									<div class="styLNRightNumBox" style="border-right-width:0px;height:5mm;"/>
									<div class="styIRS2220Part3LNCellHeader" style="border-left-width:0px;height:5mm;">
(a)
<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
(b)
<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
(c)
<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader" style="height:5mm;">
(d)
<span class="styTableCellPad"/>
									</div>
								</div>
								<!--Line 19 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:32mm;">19</div>
												<div class="styIRS2220LNDescTbl" style="height:32mm;">
												Enter the date of payment or the 15th day of the 4th month after the
close of the tax year, whichever is earlier. <b>  Filers with  installments due on or after April 1, 2021,  and before July 15, 2021, see instructions.  (C Corporations with tax
years ending June 30 and S corporations: </b> Use 3rd month instead
of 4th month. <b> Form 990-PF and Form 990-T filers: </b> Use 5th month
instead of 4th month.) See instructions
								<!--Dotted Line -->
<!--										<span class="styDotLn" style="float:right;">.....</span>
-->									</div>
									<div class="styLNRightNumBox" style="height:32mm;padding-top:28mm;">19</div>
									<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt"/>
											<xsl:with-param name="ShortMessage" select=" 'true' "/>
										</xsl:call-template>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center"/>
									<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center"/>
									<div class="styIRS2220Part3LNCell" style="height:32mm;padding-top:28mm;text-align:center"/>
								</div>
								<!--Line 20 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">20</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days from due date of installment on line 9 to the date shown on line 19
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">..</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">20</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 21 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">21</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 4/15/2021
<span style="float:left;">and before 7/1/2021</span>
										<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">21</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 22 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:11mm;">22</div>
									<div class="styIRS2220LNDescTbl" style="height:11mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 21
</span>
										<span style="width:2px"/>
x 5% (0.05)
<br/>
										<span style="width:60px"/>
366
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">22</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 23 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">23</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 6/30/2021 and before 10/1/2021 
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">23</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!-- line 24 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">24</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 23</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
366
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">24</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 25 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">25</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 9/30/2021 and before 1/1/2022 
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">25</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 26 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">26</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 25</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
366
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 27 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">27</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 12/31/2021 and before 4/1/2022
<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">27</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 28 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">28</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 27</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
365
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">28</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 29 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">29</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 3/31/2022 and before 7/1/2022 
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 30 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">30</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 29</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
365
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">30</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 31 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">31</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 6/30/2022 and before 10/1/2022 
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">31</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 32 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">32</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 31</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
365
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">32</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 33 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">33</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 9/30/2022 and before 1/1/2023 
								<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">33</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 34 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">34</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 33</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
365
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">34</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 35 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">35</div>
									<div class="styIRS2220LNDescTbl" style="height:8mm;">
Number of days on line 20 after 12/31/2022 and before 3/16/2023
<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">35</div>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
									<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;"/>
								</div>
								<!--Line 36 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:10mm;">36</div>
									<div class="styIRS2220LNDescTbl" style="height:10mm;">
Underpayment on line 17 x
<br/>
										<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 35</span>
										<span style="width:2px"/>
x *%
<br/>
										<span style="width:60px"/>
365
</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">36</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 37 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;">37</div>
									<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2mm;font-size: 7pt; ">
Add lines 22, 24, 26, 28, 30, 32, 34, and 36
					<!--Dotted Line -->
									</div>
									<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">37</div>
									<div class="styIRS2220Part3LNCell" style="height:6mm;padding-top:2mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:6mm;padding-top:2mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:6mm;padding-top:2mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
									<div class="styIRS2220Part3LNCell" style="height:6mm;padding-top:2mm;">
													<span style="float:left;padding-left:1mm;">$</span>
									</div>
								</div>
								<!--Line 38 -->
							</xsl:if>
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:6mm;">38</div>
									<div class="styLNDesc" style="height:6mm;">
										<span class="styBoldText">Penalty. </span>
Add columns (a) through (d) of line 37. Enter the total here and on Form 1120, line 34;
or the comparable line for other income tax returns
<!--Dotted Line -->
										<span class="styDotLn" style="float:right;">....................</span>
									</div>
									<div class="styLNRightBoxNBB" style="height:8mm;float:right;">
										<div class="styLNRightNumBoxNBB" style="height:8.1mm;padding-top:3mm;">38</div>
										<div class="styIRS2220Part3LNCell" style="width:29mm;Border-bottom:0;height:8mm;padding-top:5mm;">
													<span style="float:left;padding-left:1mm;">$</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/TotalPenaltyAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							<!--Page 2 note -->
							<div class="styTBB" style="width:187mm;">
*Use the penalty interest rate for each calendar quarter, which the IRS will determine during the first month in the preceding quarter. These rates are published quarterly in an IRS News Release and in a revenue ruling in the Internal Revenue Bulletin. To obtain this information on the
Internet, access the IRS website at
<span class="styBoldText">www.irs.gov.</span>
You can also call 1-800-829-4933 to get interest rate information.
</div>
						</div>
					<!--Begin Page 2 Footer -->
		<xsl:choose>
			<xsl:when test="$Print != $Separated and count($Form2220Data/PaymentPenaltyComputationTxt) &gt; 4">
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>Form <span class="styBoldText"> 2220</span> (2021)
						</div>
					</div>
			</xsl:when>
			<xsl:otherwise>
					<p class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>Form <span class="styBoldText"> 2220</span> (2021)
						</div>
					</p>
			</xsl:otherwise>
		</xsl:choose>
					<!--End Page 2 Footer -->
						<!-- Page 3 Header -->
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
					<p style="page-break-before: always"/>
							<div style="float:left;">Form 2220 (2021)<span style="width:148mm;"/>
						</div>
							<div style="float:right;"> Page <span style="font-weight:bold;font-size:8pt;"> 3 </span>
							</div>
						</div>
						<!-- END Page 3 Header -->
					<!-- BEGIN SCHEDULE A TITLE -->
						<div class="styBB" style="width:187mm;border-top-width:2px;">
							<div class="styPartDesc" style="padding-left: 0px;height:auto;">
Schedule A <span style="width:16px;"/> Adjusted Seasonal Installment Method and Annualized Income Installment Method
							<span class="styNormalText" style="padding-left: 24mm;">See instructions.</span>
							</div>
							<!--Line -->
							<div style="width:187mm;float:left;clear:none;font-size:8pt;">
								<b> Form 1120-S filers: </b>
								<i> For lines 1, 2, 3, and 21 "taxable income" refers to excess
net passive income or the amount on which tax is imposed under section 1374(a), whichever applies. </i>
							</div>
						</div>
						<!-- END SCHEDULE A TITLE -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:3.5mm;">Part I</div>
							<div class="styPartDesc" style="height:auto;padding-left:1mm;float:left;clear:none;font-weight:normal;">
								<b>Adjusted Seasonal Installment Method <br/>Caution: </b>
								Use this method only if the base period percentage for any 6 consecutive months is at least 70%. See instructions. 
							</div>
						</div>
						<!--a, b, c, d header Line -->
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;"/>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;"/>
							<div class="styLNRightNumBox" style="height:4.75mm;border-left-width:1px;width:6mm;border-bottom-width:0px;"/>
							<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-left-width:1px;border-bottom-width:1px;">(a)</div>
							<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(b)</div>
							<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(c)</div>
							<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(d)</div>
						</div>
						<!--Sch A Line 1 -->
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;width:6mm;border-top-width:1px;text-align:bottom;">1</div>
							<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm;border-top-width:1px;text-align:bottom;">
Enter taxable income for the following periods:</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;width:6mm;"/>
							<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 3 months</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 5 months</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 8 months</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 11 months</div>
						</div>
						<!--Line 1a -->
						<div class="styBB" style="width:187mm;border-bottom-width:0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4mm;width:6mm;">a</div>
							<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm;">
								<span style="float:left;">Tax year beginning in 2018</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px;">1a</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 1b -->
						<div class="styBB" style="width:187mm;border-bottom-width:0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4.5mm;width:6mm">b</div>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;border-top-width:0px;">
								<span style="float:left;">Tax year beginning in 2019</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px;">1b</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 1c -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4.5mm;width:6mm;">c</div>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;">
								<span style="float:left;">Tax year beginning in 2020</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px;">1c</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 2 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:10mm;width:6mm;">2</div>
							<div class="styIRS2220LNDescTbl" style="height:10mm;width:73mm;">
Enter taxable income for each period for the tax year beginning in 2021.  See instructions for the treatment of extraordinary items.
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;width:6mm;border-bottom-width: 1px;">2</div>
							<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 3 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;padding-top:1.5mm;">3</div>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;padding-top:1.5mm;">Enter taxable income for the following periods:</div>
							<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.5mm;border-bottom-width:0px;width:6mm"/>
							<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 1px;">First 4 months</div>
							<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 1px;">First 6 months</div>
							<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 1px;">First 9 months</div>
							<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 1px;">Entire year</div>
						</div>
						<!-- line 3a -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4.5mm;width:6mm;border-bottom-width: 0px;">a</div>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Tax year beginning in 2018</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px;">3a</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncmTY1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY1Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 3b -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4mm;width:6mm">b</div>
							<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm;border-bottom-width: 1px;">
								<span style="float:left;">Tax year beginning in 2019</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px">3b</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncmTY2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 3c -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:4.5mm;width:6mm;border-bottom-width: 0px;">c</div>
							<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;border-bottom-width: 1px;">
								<span style="float:left;">Tax year beginning in 2020</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 1px;">3c</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncmTY3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY3Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;width:6mm;border-bottom-width: 0px;">4</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Divide the amount in each column on line 1a by the
<span style="float:left;">amount in column (d) on line 3a</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm; width:6mm;border-bottom-width: 1px;">4</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome1TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome1TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome1TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeTY1Rt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;width:6mm;border-bottom-width: 0px;">5</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Divide the amount in each column on line 1b by the
<span style="float:left;">amount in column (d) on line 3b</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">5</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome1TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width:1px; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome1TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome1TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeTY2Rt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 6 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;width:6mm;border-bottom-width: 0px;">6</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Divide the amount in each column on line 1c by the
<span style="float:left;">amount in column (d) on line 3c</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">6</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome1TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome1TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome1TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeTY3Rt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="width:6mm;height:6mm;padding-top:2.5mm;border-bottom-width: 0px;">7</div>
							<div class="styIRS2220LNDescTbl" style="width:73mm;height:6mm;padding-top:2.5mm;border-bottom-width: 0px;">
								<span style="float:left;">Add lines 4 through 6</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="width:6mm;height:6mm;padding-top:2mm;border-bottom-width: 1px;">7</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;height:6mm;font-size:4.5pt;padding-top:2.5mm;border-bottom-width: 1px; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeTotal1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;height:6mm;font-size:4.5pt;padding-top:2.5mm;border-bottom-width: 1px; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeTotal1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;height:6mm;font-size:4.5pt;padding-top:2.5mm;border-bottom-width: 1px; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeTotal1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style=" width:25.3mm;height:6mm;font-size:4.5pt;padding-top:2.5mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeTotalRt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 8 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2.5mm;width:6mm;border-bottom-width: 0px;">8</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2.5mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Divide line 7 by 3.0</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">8</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeAverage1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeAverage1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeAverage1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeAverageRt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 9a -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2.5mm;width:6mm;border-bottom-width: 0px;">9a</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2.5mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Divide line 2 by line 8</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">9a</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeFactoredRt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeFactoredRt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeFactoredRt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeFactoredRt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 9b -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:6mm;padding-top:2.5mm;width:6mm;border-bottom-width: 0px;">b</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2.5mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Extraordinary items (see instructions)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">9b</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Frst4MnthIncmExtrordnryItemAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Frst6MnthIncmExtrordnryItemAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Frst9MnthIncmExtrordnryItemAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYrIncmExtrordnryItemAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 9c -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;height:6mm;padding-top:2.5mm;width:6mm;border-bottom-width: 0px;">c</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2.5mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Add lines 9a and 9b</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">9c</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTotalTxblIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTotalTxblIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTotalTxblIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTotalTaxableIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 10 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:12mm;width:6mm;border-bottom-width: 0px;">10</div>
							<div class="styIRS2220LNDescTbl" style="height:12mm;width:73mm;border-bottom-width: 0px;">
Figure the tax on the amount on line 9c using the instructions for Form 1120,
Schedule J, line 2 or comparable line of corporation's return. 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;width:6mm;border-bottom-width: 1px;">10</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxFigured1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxFigured1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxFigured1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxFiguredAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 11a -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;padding-left:.25mm;border-bottom-width: 0px;">11a</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;padding-right:1mm;">
Divide the amount in columns (a) through (c) on line 3a by the amount in column (d) on line 3a 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">11a</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome2TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome2TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome2TY1Rt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						</div>
						<!-- Sch-A Line 11b -->
						<div class="styBB" style="width:187mm;;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">b</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;padding-right:1mm;">
Divide the amount in columns (a) through (c) on line 3b by the amount in column (d) on line 3b 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">11b</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome2TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome2TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome2TY2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						</div>
						<!-- Sch-A Line 11c -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">c</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;padding-right:1mm;">
Divide the amount in columns (a) through (c) on line 3c by the amount in column (d) on line 3c 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">11c</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncome2TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncome2TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncome2TY3Rt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						</div>
						<!-- Sch-A Line 12 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">12</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Add lines 11a through 11c</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">12</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeTotal2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeTotal2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeTotal2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						</div>
						<!-- Sch-A Line 13 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">13</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm;border-bottom-width: 1px;">
								<span style="float:left;">Divide line 12 by 3.0</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">13</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeAverage2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeAverage2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeAverage2Rt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						</div>
						<!-- Sch-A Line 14 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:12mm;width:6mm;border-bottom-width: 0px;">14</div>
							<div class="styIRS2220LNDescTbl" style="height:12mm;;width:73mm;border-bottom-width: 0px;padding-right:1mm;">
Multiply the amount in columns (a) through (c) of line 10 by columns (a) through (c) of line 13. In column (d),
enter the amount from line 10, column (d) 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;width:6mm;border-bottom-width: 1px;">14</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxFigured2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxFigured2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxFigured2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxFiguredAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 15 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">15</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Enter any alternative minimum tax (trusts only) for each payment period.  See instructions.
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">15</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsAMTAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsAMTAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsAMTAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearAMTAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 16 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">16</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Enter any other taxes for each payment period.  See instructions.
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">16</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 17 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;width:6mm;border-bottom-width: 0px;">17</div>
							<div class="styIRS2220LNDescTbl" style="height:5mm;padding-top:1mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Add lines 14 through 16</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;width:6mm;border-bottom-width: 1px;">17</div>
							<div class="styIRS2220LNCell" style="height:5mm;padding-top:1mm;width:25.3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTotalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:5mm;padding-top:1mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTotalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:5mm;padding-top:1mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTotalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:5mm;padding-top:1mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 18 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">18</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
For each period, enter the same type of credits as allowed on Form 2220, lines 1 and 2c.  See instructions. 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;width:6mm;border-bottom-width: 1px;padding-top:4mm;">18</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 19 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 2px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">19</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Total tax after credits. Subtract line 18 from line 17. If zero or less, enter -0- 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;padding-bottom:0px;width:6mm;border-bottom-width: 0px;">
19
</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Page Footer -->
						<div class="pageEnd" style="width:187mm">
							<div style="float:right;">
								<span style="width:80px;"/>
Form
<span class="styBoldText">2220</span>
(2021)
</div>
						</div>

						<!-- Page 4 Header -->
					<p style="page-break-before: always">
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
							<div style="width:187mm;padding-top:.5mm;">
								<div style="float:left;">Form 2220 (2021)<span style="width:148mm;"/></div>
								<div style="float:right;"> Page <span style="font-weight:bold;font-size:8pt;"> 4 </span>
								</div>
							</div>
						</div>
					</p>
						<!-- END Page 4 Header -->
					<!-- Part II -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styBB" style="width:187mm;border-top-width:2px;">
							<div class="styPartName" style="height:3.5mm;">Part II</div>
							<div class="styPartDesc">Annualized Income Installment Method</div>
						</div>
						<!-- Line 20 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;width:6mm;border-top-width: 1px;"/>
							<div class="styIRS2220LNDescTbl" style="width:73mm;height:4mm;border-top-width: 1px;"/>
							<div class="styLNRightNumBox" style="height:4mm;border-left-width:1px;border-right-width:0px;width:6mm;border-bottom-width:0px;"/>
							<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(a)</div>
							<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(b)</div>
							<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(c)</div>
							<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(d)</div>
						</div>
						<!--Line 20, line 2 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="width:6mm;height:10mm;border-right-width:1px;padding-top:5mm;">20</div>
							<div class="styIRS2220LNDescTbl" style="padding-top:5mm;height:10mm;width:73mm;">
								<span style="float:left;">Annualization periods (see instructions)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="padding-top:6mm;height:10mm;width:6mm;border-top-width: 0px;border-bottom-width: 1px;">20</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;height:10mm;
padding-top:0px;padding-bottom:6px;border-bottom-width:1px;">
								<br/>
First
<span style="width:5mm;border-bottom: 1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="2"/>
										<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod1Num"/>
									</xsl:call-template>
								</span>
								<br/>
months
</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;height:10mm;
padding-top:0px;padding-bottom:6px;border-bottom-width:1px;">
								<br/>
First
<span style="width:5mm;border-bottom: 1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="2"/>
										<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod2Num"/>
									</xsl:call-template>
								</span>
								<br/>
months
</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;height:10mm;
padding-top:0px;padding-bottom:6px;border-bottom-width:1px;">
								<br/>
First
<span style="width:5mm;border-bottom: 1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="2"/>
										<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod3Num"/>
									</xsl:call-template>
								</span>
								<br/>
months
</div>
							<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;height:10mm;
padding-top:0px;padding-bottom:6px;border-bottom-width:1px;">
								<br/>
First
<span style="width:5mm;border-bottom: 1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="2"/>
										<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod4Num"/>
									</xsl:call-template>
								</span>
								<br/>
months
</div>
						</div>
						<!-- Sch-A Line 21 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm">21</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
Enter taxable income for each annualization period.  See instructions for the treatment of extraordinary items. 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">21</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 22 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">22</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Annualization amounts (see instructions)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">22</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount1Cd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount2Cd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount3Cd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount4Cd"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 23a -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6.5mm;padding-top:4mm;border-bottom-width: 0px;">23a</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:72.5mm;padding-top:4mm;border-bottom-width: 0px;">
							Annualized taxable income. Multiply line 21 by line 22
</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:5.97mm;border-bottom-width: 1px;padding-top:4mm;">23a</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.27mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 23b -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:6mm;width:6mm;padding-top:2mm;padding-left:4mm;border-bottom-width: 0px;">b</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;width:73mm;padding-top:2mm;border-bottom-width: 0px;">
								<span style="float:left;">Extraordinary items (see instructions)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">23b</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 23c -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:6mm;width:6mm;padding-top:2mm;padding-left:4mm;border-bottom-width: 0px;">c</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;width:73mm;padding-top:2mm;border-bottom-width: 0px;">
								<span style="float:left;">Add lines 23a and 23b</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">23c</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncm1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncm2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncm3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncm4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 24 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:12mm;width:6mm;padding-top:1mm;border-bottom-width: 0px;">24</div>
							<div class="styIRS2220LNDescTbl" style="height:12mm;width:73mm;padding-top:1mm;border-bottom-width: 0px;">
Figure the tax on the amount on line 23c using the instructions for Form 1120, Schedule J, line 2, or comparable line of corporation’s return.  
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;width:6mm;border-bottom-width: 1px;">24</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:12mm;padding-top:8.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 25 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">25</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Enter any alternative minimum tax (trusts only) for each payment period (see instructions) 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">25</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4 mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 26 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">26</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Enter any other taxes for each payment period.  See instructions.
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">26</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 27 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:6mm;width:6mm;padding-top:2.5mm;border-bottom-width: 0px;">27</div>
							<div class="styIRS2220LNDescTbl" style="height:6mm;width:73mm;padding-top:2.5mm;border-bottom-width: 0px;">
								<span style="float:left;">Total tax. Add lines 24 through 26</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">27</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:6mm;padding-top:2.5mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 28 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:11mm;width:6mm;border-bottom-width: 0px;">28</div>
							<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm;border-bottom-width: 0px;">
For each period, enter the same type of credits as allowed on Form 2220, lines 1 and 2c.  See instructions.
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;width:6mm;border-bottom-width: 1px;">28</div>
							<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 29 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">29</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Total tax after credits. Subtract line 28 from line 27.  If zero or less, enter -0- 
							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">29</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch-A Line 30 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">30</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Applicable percentage</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">30</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
25% </div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
50% </div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
75% </div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
100% </div>
						</div>
						<!-- Sch-A Line 31 -->
						<div class="styBB" style="width:187mm;border-bottom-width: 1px;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">31</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm;border-bottom-width: 0px;">
								<span style="float:left;">Multiply line 29 by line 30</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">31</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage3Amt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage4Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Begin Part III -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:3.5mm;">Part III</div>
							<div class="styPartDesc">Required Installments</div>
						</div>
						<!--Note Line -->
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm"/>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
							<b>Note:</b>
							<i> Complete lines 32 through 38 of one column before completing the next column. </i>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:2mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
1st
<br/>
installment
</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:2mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
2nd
<br/>
installment
</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:2mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
3rd
<br/>
installment
</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:2mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">
4th
<br/>
installment
</div>
					</div>
					<!-- Sch-A Line 32 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:14mm;width:6mm;border-bottom-width: 0px;">32</div>
						<div class="styIRS2220LNDescTbl" style="height:14mm;width:73mm;padding-right:1mm;border-bottom-width: 0px;">
If only Part I or Part II is completed, enter the amount in each column from line 19 or line 31. If both parts are completed, enter
the <b>smaller</b> of the amounts in each column from line 19 or line 31 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:9mm;width:6mm;border-bottom-width: 1px;">32</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSsnl1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSsnl2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSsnl3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSsnl4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 33 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">33</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Add the amounts in all preceding columns of line 38.  See instructions.
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">33</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 34 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm;border-bottom-width: 0px;">34</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm;border-bottom-width: 0px;">
							<b>Adjusted seasonal or annualized income installments.</b> Subtract line 33 from line 32. If zero or less, enter -0- 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">34</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsAdjSsnlOrAnnlzdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsAdjSsnlOrAnnlzdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsAdjSsnlOrAnnlzdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AdjustedSeasonalOrAnnlzdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 35 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm;border-bottom-width: 0px;">35</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;padding-bottom:0px;width:73mm;border-bottom-width: 0px;">
						Enter 25% (0.25) of line 5 on page 1 of Form 2220 in each column. <b>Note: </b>
							<i> "Large corporations," see the instructions for line 10 for the amounts to enter </i>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;width:6mm;border-bottom-width: 1px;">35</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionSmallerTax1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 1px;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionSmallerTax2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionSmallerTax3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionSmallerTax4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 36 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;border-bottom-width: 0px;">36</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
Subtract line 38 of the preceding column from line 37 of the preceding column 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 1px;">36</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 1px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 37 -->
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 0px;">37</div>
						<div class="styIRS2220LNDescTbl" style="height:6mm;padding-top:2mm;width:73mm;border-bottom-width: 0px;">
							<span style="float:left;">Add lines 35 and 36</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;width:6mm;border-bottom-width: 1px;">37</div>
						<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionSmallerTax1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6mm;padding-top:2mm;width:25.3mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 38 -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm">38</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm">
							<b>Required installments. </b> Enter the <b> smaller </b> 
							of line 34 or line 37 here and on page 1 of Form 2220, line 10.  See instructions. 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;width:6mm;border-bottom-width: 0px;">38</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment3Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer -->
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>
Form
<span class="styBoldText">2220</span>
(2021)
</div>
					</div>
					<!--</p>
-->
					<!--END Page Footer -->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<p style="page-break-before: always">
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<div class="styLeftOverTitle">
Additional Data        
</div>
							<div class="styLeftOverButtonContainer">
								<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
							</div>
						</div>
						<!-- Additional Data Table -->
						<table class="styLeftOverTbl">
							<xsl:call-template name="PopulateCommonLeftover">
								<xsl:with-param name="TargetNode" select="$Form2220Data"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">
Line 1 - Section 338 Gain Indicator
</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">
Line 1 - Section 338 Gain Amount
</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxAmt/@section338GainAmt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
						<br/>
					</div>
</p>
					<!-- END Left Over Table -->
					<!-- ********************************************************************************** -->
					<!-- Begin Separated repeating data for Part IV -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<xsl:if test="$Print = $Separated and count($Form2220Data/PaymentPenaltyComputationTxt) &gt;4">
							<!--Populate columns heading in incremented alpha -->
							<xsl:for-each select="$Form2220Data/PaymentPenaltyComputationTxt">
								<xsl:variable name="curPos">
									<xsl:value-of select="position()"/>
								</xsl:variable>
								<xsl:if test="position() mod 4 = 1">
									<!-- Part IV Table heading -->

									<div>
									<div class="styRepeatingDataTitle">Form 2220, Part IV - Figuring the Penalty</div>										<table class="styDepTbl" style="font-size:7pt;">
											<thead class="styTableThead">
												<!-- Label the Column Headers -->
												<tr class="styDepTblHdr">
													<th class="styDepTblCell" scope="col" style="width:6mm;border-right-width:0px;"/>
													<th class="styDepTblCell" scope="col" style="width:60mm;border-right-width:0px;border-left-width:0px;"/>
													<th class="styDepTblCell" scope="col" style="width:8mm;border-right-width:0px;"/>
													<th class="styDepTblCell" scope="col" style="width:28mm;border-left-width:0px;">
(<xsl:number value="position()" format="a"/>)
</th>
													<th class="styDepTblCell" scope="col" style="width:28mm;">
(<xsl:number value="position() + 1" format="a"/>)
</th>
													<th class="styDepTblCell" scope="col" style="width:28mm;">
(<xsl:number value="position() + 2" format="a"/>)
</th>
													<th class="styDepTblCell" scope="col" style="width:28mm;">
(<xsl:number value="position() + 3" format="a"/>)
</th>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<!-- Line 19 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">19</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
												Enter the date of payment or the 15th day of the 4th month after the
close of the tax year, whichever is earlier. <b> Filers with  installments due on or after April 1, 2021,  and before July 15, 2021, see instructions. (C Corporations with tax
years ending June 30 and S corporations: </b> Use 3rd month instead
of 4th month. <b> Form 990-PF and Form 990-T filers: </b> Use 5th month
instead of 4th month.) See instructions
<!--													<span class="styDotLn" style="float:right;">.....</span>
-->													</td>
													<td class="styDepTblCellRNBSRD">19</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="PaymentDt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/PaymentDt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/PaymentDt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/PaymentDt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 20 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">20</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days from due date of installment on line 9 to the date shown on line 19 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">..</span>
													</td>
													<td class="styDepTblCellRNBSRD">20</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DaysFromDueDateToPaymentDtQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/DaysFromDueDateToPaymentDtQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/DaysFromDueDateToPaymentDtQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/DaysFromDueDateToPaymentDtQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 21 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">21</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 4/15/2021 and before 7/1/2021 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD">21</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays1stDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays1stDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays1stDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays1stDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 22 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">22</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 21
</span>
														<span style="width:2px"/>
x 5% (0.05)
<br/>
														<span style="width:60px"/>
366
</td>
													<td class="styDepTblCellRNBSRD">22</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty1stDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty1stDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty1stDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty1stDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 23 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">23</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 6/30/2021 and before 10/1/2021
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD" style="font-weight:bold;">23</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays2ndDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays2ndDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays2ndDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays2ndDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 24 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">24</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 23
</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
366
</td>
													<td class="styDepTblCellRNBSRD">24</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty2ndDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty2ndDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty2ndDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty2ndDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 25 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">25</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 9/30/2021 and before 1/1/2022 
													<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD" style="font-weight:bold;">25</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays3rdDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays3rdDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays3rdDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays3rdDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 26 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">26</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">
Number of days on line 25</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
366
</td>
													<td class="styDepTblCellRNBSRD">26</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty3rdDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty3rdDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty3rdDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty3rdDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 27 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">27</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 12/31/2021 and before 4/1/2022 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD">27</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays4thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays4thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays4thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays4thDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 28 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">28</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 27</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
365
</td>
													<td class="styDepTblCellRNBSRD">28</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty4thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty4thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty4thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty4thDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 29 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">29</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after
<span style="float:left;">3/31/2022 and before 7/1/2022</span>
														<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">....</span>
													</td>
													<td class="styDepTblCellRNBSRD">29</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays5thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays5thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays5thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays5thDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 30 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">30</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 29</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
365
</td>
													<td class="styDepTblCellRNBSRD">30</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty5thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty5thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty5thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty5thDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 31 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">31</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 6/30/2022 and before 10/1/2022 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD" style="font-weight:bold;">31</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays6thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays6thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays6thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays6thDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 32 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">32</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 31</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
365
</td>
													<td class="styDepTblCellRNBSRD">32</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty6thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty6thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty6thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty6thDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 33 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">33</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 9/30/2022 and before 1/1/2023 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD" style="font-weight:bold;">33</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays7thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays7thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays7thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays7thDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 34 -->
												<tr class="styDepTblRow2" style="">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">34</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 33</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
365
</td>
													<td class="styDepTblCellRNBSRD">34</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty7thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty7thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty7thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty7thDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 35 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">35</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Number of days on line 20 after 12/31/2022 and before 3/16/2023 
													<!--Dotted Line -->
														<span class="styDotLn" style="float:right;">.......</span>
													</td>
													<td class="styDepTblCellRNBSRD" style="font-weight:bold;">35</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LateDays8thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/LateDays8thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/LateDays8thDateRangeQty"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/LateDays8thDateRangeQty"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 36 -->
												<tr class="styDepTblRow2">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">36</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
Underpayment on line 17 x
													<br/>
														<span style="width:33mm;border-bottom: 1px solid black;">Number of days on line 35</span>
														<span style="width:2px"/>
x *%
<br/>
														<span style="width:60px"/>
365
</td>
													<td class="styDepTblCellRNBSRD">36</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="Penalty8thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/Penalty8thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/Penalty8thDateRangeAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/Penalty8thDateRangeAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<!-- Line 37 -->
												<tr class="styDepTblRow1">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">37</td>
													<td style="width:60mm;text-align:left;border-left-width:0px;font-size: 6pt" class="styDepTblCell">
Add lines 22, 24, 26, 28, 30, 32, 34, and 36
</td>
													<td class="styDepTblCellRNBSRD">37</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TotalPenaltyPaymentDateAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 1]/TotalPenaltyPaymentDateAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 2]/TotalPenaltyPaymentDateAmt"/>
														</xsl:call-template>
													</td>
													<td class="styDepTblCellSRD">
													<span style="float:left;padding-left:1mm;">$</span>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputationTxt[$curPos + 3]/TotalPenaltyPaymentDateAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<xsl:if test="position()='1'">
</xsl:if>
											</tbody>
										</table>
									</div>
<!--					<p style="page-break-after: always"/>
-->								</xsl:if>
							</xsl:for-each>
							<!-- ****************************************************************************** -->
						</xsl:if>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
