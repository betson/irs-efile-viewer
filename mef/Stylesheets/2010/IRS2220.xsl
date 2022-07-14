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
	<xsl:param name="Form2220ScheduleA" select="$RtnDoc/IRS2220/IRS2220ScheduleA"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2220Data)"/>
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
				<meta name="Description" content="IRS Form 2220"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--HINTS: Part IV exists in both inline and separated print 
            Unique Feature: Part IV (inline and empty are in Div format) and (separated is in table format)-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2220Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2220">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
							<div style="padding-top:1mm;">
            Form<span class="styFormNumber"> 2220<br/>
								</span>
							</div>
							<div style="padding-top:3.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm;">
							<div style="height:8mm;" class="styMainTitle">Underpayment of Estimated Tax by Corporations</div>
							<div class="styFBT" style="height:5mm;">
								<img src="{$ImagePath}/2220_Bullet.gif" alt="Bullet"/> See separate instructions.<br/>
								<br/>
								<img src="{$ImagePath}/2220_Bullet.gif" alt="Bullet"/> Attach to the corporation's tax return.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0142</div>
							<div class="styTaxYear" style="padding-top:3mm;">20<span class="styTYColor">10</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!--EIN Line -->
						<div class="styEINBox" style="width:48mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Employer identification number<br/>
							<br/>
							<span style="width: 40mm; text-align: left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Note Line -->
					<div class="styBB" style="width:187mm;">
						<span class="styBoldText">Note: </span>
						<span class="styItalicText" style="padding-left:1mm;"> 
          Generally, the corporation is not required to file Form 2220 (see Part II below for 
          exceptions) because the IRS will figure any penalty owed and bill the corporation. 
          However, the corporation may still use Form 2220 to figure the penalty. If so, enter 
          the amount from page 2, line 38 on the estimated tax penalty line of the corporation's 
          income tax return, but <span class="styBoldText">do not</span> attach Form 2220.
        </span>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="padding-left:1mm;float:left;clear:none;">
          Required Annual Payment
        </div>
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
						<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
						<div class="styLNDesc" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">Total tax (see instructions)
          <span style="width:2px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 1 - Section 338 Gain Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTax/@section338GainIndicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 1 - Section 338 Gain Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTax/@section338GainAmount"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">2a</div>
						<div class="styLNDesc" style="width:98.25mm;height:7mm;padding-top:3mm;">
							<span style="font-size: 6pt; font-family: Verdana;">
            Personal holding company tax (Schedule PH (Form 1120), line 26) included on line 1.
          </span>
							<span class="styBoldText">
								<span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">2a</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/PersonalHoldingCompanyTax"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-top:3mm;"/>
						<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:3mm;"/>
					</div>
					<!--Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width:98.25mm;">
							<span class="stySmallText">
            Look-back interest included on line 1 under section
            460(b)(2) for completed long-term contracts or section 167(g) for depreciation under the
            income forecast method.
          </span>
							<span class="styBoldText">
								<span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">2b</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/LookbackInterestIncluded"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;padding-top:3mm;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:3mm;"/>
					</div>
					<!--Line 2c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7mm;padding-top:3mm;">c</div>
						<div class="styLNDesc" style="width:98.25mm;height:7mm;padding-top:3mm;">Credit for federal tax paid on fuels (see instructions)
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">2c</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/CreditForFederalTaxPaidOnFuels"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:3mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:3mm;"/>
					</div>
					<!--Line 2d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc">
							<span class="styBoldText">Total.</span> Add lines 2a through 2c
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/SumOfIncludedTaxesAndCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">3</div>
						<div class="styLNDesc" style="height:7mm;">Subtract line 2d from line 1. If the result is 
          less than $500, <span class="styBoldText">do not</span> complete or file this form. 
          The corporation does not owe the penalty
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">3</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTaxLessSumOfIncluded"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">4</div>
						<div class="styLNDesc" style="height:7mm;">
							<span class="stySmallText">
            Enter the tax shown on the corporation's 2009
             income tax return (see instructions).
            <span class="styBoldText">Caution: </span>
								<span class="styBoldItalicText">If the tax 
            is zero or the tax year was for less than 12 months, skip this line and enter the 
            amount from line 3 on line 5 </span>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">4</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/TaxShownOnPriorYearTaxReturn"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">5</div>
						<div class="styLNDesc" style="height:7mm;">
							<span class="styBoldText">Required annual payment.</span>
          Enter the <span class="styBoldText">smaller</span> of line 3 or line 4.
          If the corporation is required to skip line 4, enter the amount from line 3
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:3.5mm;">5</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/SmallerTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;height:8mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="padding-left:1mm;float:left;clear:none;">Reasons for Filing-
          <span style="font-weight:normal">
            Check the boxes below that apply. If any boxes are checked, the corporation 
            <span class="styBoldText">must</span> file Form 2220 even if it does not owe 
            a penalty (see instructions).
          </span>
						</div>
					</div>
					<!-- END PART II TITLE -->
					<!--Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc" style="width:178mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UsingAdjustedSeasonal"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UsingAdjustedSeasonal"/>
								</xsl:call-template>
            The corporation is using the adjusted seasonal installment method.
          </label>
						</div>
					</div>
					<!--Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">7</div>
						<div class="styLNDesc" style="width:178mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UsingAnnualizedIncome"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2220Data/UsingAnnualizedIncome"/>
								</xsl:call-template>
            The corporation is using the annualized income installment method.
          </label>
						</div>
					</div>
					<!--Line 8 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">8</div>
						<div class="styLNDesc" style="width:178mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2220Data/LargeCorporation1stInstallment"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2220Data/LargeCorporation1stInstallment"/>
								</xsl:call-template>
            The corporation is a "large corporation" figuring its first required installment based on the prior year's tax.
          </label>
						</div>
					</div>
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Figuring the Underpayment</div>
					</div>
					<!-- END PART III TITLE -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styIRS2220LNDescTbl"/>
						<div class="styLNRightNumBox" style="height:4.7mm;border-left-width:0px;"/>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(a)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(b)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(c)</div>
						<div class="styIRS2220Part2LNCellHeader" style="height:4.7mm;">(d)</div>
					</div>
					<!--Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:17mm;padding-left:3mm ">9</div>
						<div class="styIRS2220LNDescTbl" style="height:17mm;">
							<span class="styBoldText">Installment due dates.</span>
          Enter in columns (a) through (d) the 15th day of the 4th
          (<span class="styBoldItalicText">Form 990-PF filers:</span>
          Use 5th month), 6th, 9th, and 12th months of the corporation's tax year
       </div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top:13mm;">9</div>
						<div class="styIRS2220Part2LNCell" style="height:17mm;padding-top:13mm;text-align:center">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form2220Data/InstallmentDueDate1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:17mm;padding-top:13mm;text-align:center">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form2220Data/InstallmentDueDate2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:17mm;padding-top:13mm;text-align:center">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form2220Data/InstallmentDueDate3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:17mm;padding-top:13mm;text-align:center">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form2220Data/InstallmentDueDate4"/>
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
          amounts to enter.<br/> If none of these boxes are checked, enter 25% of line 5 above in 
          each column.
          <span class="styBoldText">
								<span style="width:16px"/>.
          </span>
						</div>
						<div class="styGenericDiv" style="height:23mm;">
							<div class="styLNRightNumBox" style="height:18.5mm;border-bottom-width: 0px;"/>
							<div class="styLNRightNumBox" style="height:3mm;float:none;clear:both;">10</div>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:23mm;padding-top:19mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/RequiredInstallment4"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10mm;padding-left:.5mm">11</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;">
          Estimated tax paid or credited for each period (see instructions). For column (a)
          only, enter the amount from line 11 on line 15
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:10mm;">11</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:10.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:10.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:10.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:10.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited4"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:14mm;padding-top:7mm">12</div>
						<div class="styIRS2220LNDescTbl" style="height:14mm;">
							<span class="styBoldItalicText">Complete lines 12 through 18
            of one column before going to the next column.
          </span>
            Enter amount, if any, from line 18 of the preceding column
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:9mm;">12</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:14mm;width:28mm;"/>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;">Add lines 11 and 12
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:4.5mm;width:28mm;"/>
						<div class="styIRS2220Part2LNCell" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid2AndOverpayment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid3AndOverpayment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedPaid4AndOverpayment3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">14</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;">Add amounts on lines 16 and 17 of
          the preceding column
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">14</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalUnderpayment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/TotalUnderpayment3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">15</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;">
          Subtract line 14 from line 13. If zero or less, enter -0-
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstimatedTaxPaidOrCredited1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd2AndOvpmt1LessTotUndpymt1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd3AndOvpmt2LessTotUndpymt2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/EstPd4AndOvpmt3LessTotUndpymt3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">16</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;">If the amount on line 15 is zero, subtract
          line 13 from line 14. Otherwise, enter -0-
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">16</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:28mm;"/>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/UnderpaymentCarryover2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/UnderpaymentCarryover3"/>
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
          Then go to line 12 of the next column. Otherwise, go to line 18
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">17</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Underpayment4"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 18 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;">18</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;">
							<span class="styBoldText">Overpayment.</span>
          If line 10 is less than line 15, subtract line 10 from line 15. Then go
          to line 12 of the next column
          <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;border-bottom:0px;">18</div>
						<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220Part2LNCell" style="height:11mm;padding-top:7.5mm; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220Data/Overpayment3"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:11mm;width:28mm;"/>
					</div>
					<!-- Page 1 note -->
					<div class="styBoldItalicText" style="border-bottom-width: 2px; border-style:solid; border-color:black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; width: 187mm; padding-left: 8mm">
        Go to Part IV on page 2 to figure the penalty. Do not go to Part IV if there are no entries on line 17—no penalty is owed.
      </div>
					<!--Begin Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div class="stySmallText" style="width:110mm;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div class="stySmallText" style="width:40mm;">Cat. No. 11746L</div>
						<div class="stySmallText" style="width:36mm;text-align:right;">Form <span class="styBoldText">2220</span> (2010)</div>
					</div>
					<!--End Footer-->
					<!-- Page 2 Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 2220 (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN  Part IV TITLE -->
					<div class="styBB" style="width:187mm;border-top-width:1px;padding-top:1.5mm;padding-bottom:1.5mm;">
						<div class="styPartName" style="">Part IV</div>
						<div class="styPartDesc" style="padding-left:1mm;width:163mm;float:left;clear:none;">Figuring the Penalty</div>
					</div>
					<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<!-- Check if Separated Print is not selected and Part IV count  is < 5 
          Inline format  -->
					<xsl:if test="$Print != $Separated or count($Form2220Data/PaymentPenaltyComputation) &lt; 5">
						<xsl:for-each select="$Form2220Data/PaymentPenaltyComputation">
							<xsl:variable name="curPos">
								<xsl:value-of select="position()"/>
							</xsl:variable>
							<xsl:if test="position() mod 4 = 1">
								<!--This check so no extra line display after the Part Title -->
								<xsl:if test="position()!=1">
									<div class="styBB" style="width:187mm;">
										<br/>
									</div>
								</xsl:if>
								<!--a, b , c, d table header Line  -->
								<div style="width:187mm; float:none; clear:both">
									<div class="styLNLeftNumBox"/>
									<div class="styIRS2220LNDescTbl"/>
									<div class="styLNRightNumBox" style="border-right-width:0px;"/>
									<div class="styIRS2220Part3LNCellHeader" style="border-left-width:0px;">
										<xsl:number value="position() " format=" (a) "/>
										<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader">
										<xsl:number value="position() +1" format=" (a) "/>
										<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader">
										<xsl:number value="position() +2" format=" (a) "/>
										<span class="styTableCellPad"/>
									</div>
									<div class="styIRS2220Part3LNCellHeader">
										<xsl:number value="position() +3" format=" (a) "/>
										<span class="styTableCellPad"/>
									</div>
									<!--Line 19 in regular print -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:20mm;">19</div>
										<div class="styIRS2220LNDescTbl" style="height:20mm;">
              Enter the date of payment or the 15th day of the 3rd month after the close of
              the tax year, whichever is earlier (see instructions).
              <span class="styBoldItalicText">(Form 990-PF and Form 990-T filers:</span>
              Use 5th month instead of 3rd month.)
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:20mm;padding-top:16mm;">19</div>
										<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PaymentDate"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 20 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">20</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Number of days from due date of installment
              on line 9 to the date shown on line 19
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">20</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="DaysFromDueDateToPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/DaysFromDueDateToPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/DaysFromDueDateToPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/DaysFromDueDateToPaymentDate"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 21 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">21</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 4/15/2010 and before 7/1/2010
                <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">21</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn1stDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 22 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:11mm;">22</div>
										<div class="styIRS2220LNDescTbl" style="height:11mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 21
              </span>
											<span style="width:2px"/>
              x 4%
              <br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">22</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor1stDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor1stDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 23 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">23</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 6/30/2010 and before 10/1/2010
              <span class="styBoldText">
												<span style="width:16px"/>.
                 <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">23</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn2ndDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 24 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">24</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 23</span>
											<span style="width:2px"/>
                 x  X%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">24</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor2ndDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor2ndDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 25 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">25</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 9/30/2010 and before 1/1/2011
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">25</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn3rdDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 26 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">26</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 25</span>
											<span style="width:2px"/>
                 x X%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor3rdDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor3rdDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 27 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">27</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 12/31/2010 and before 4/1/2011
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">27</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn4thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 28 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">28</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 27</span>
											<span style="width:2px"/> x X%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">28</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor4thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor4thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 29 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">29</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 3/31/2011 and before 7/1/2011
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn5thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 30 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">30</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 29</span>
											<span style="width:2px"/> x *%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">30</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor5thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor5thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 31 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">31</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 6/30/2011 and before 10/1/2011
              <span class="styBoldText">
												<span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">31</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn6thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 32 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">32</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 31</span>
											<span style="width:2px"/> x *%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">32</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor6thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor6thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 33 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">33</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 9/30/2011 and before 1/1/2012
              <span class="styBoldText">
												<span style="width:16px"/>.
                <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">33</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn7thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 34 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">34</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 33</span>
											<span style="width:2px"/> x *%<br/>
											<span style="width:60px"/>365
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">34</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor7thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor7thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 35 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">35</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 12/31/2011 and before 2/16/2012
              <span class="styBoldText">
												<span style="width:16px"/>.
              </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">35</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="LateDaysIn8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="3"/>
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn8thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 36 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:10mm;">36</div>
										<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Underpayment on line 17 x <br/>
											<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 35</span>
											<span style="width:2px"/> x *%<br/>
											<span style="width:60px"/>366
            </div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">36</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PenaltyFor8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor8thDateRange"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor8thDateRange"/>
											</xsl:call-template>
										</div>
									</div>
									<!--Line 37 -->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:8mm;">37</div>
										<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Add lines 22, 24, 26, 28, 30, 32, 34, and 36
              <!--Dotted Line-->
											<span class="styBoldText">
												<span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
            <span style="width:16px"/>.
     	   <span style="width:16px"/>.
     	    <span style="width:16px"/>.
           <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">37</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalPenaltyForPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/TotalPenaltyForPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/TotalPenaltyForPaymentDate"/>
											</xsl:call-template>
										</div>
										<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/TotalPenaltyForPaymentDate"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
						<!--Check if Line 38 is not = to "0" -->
						<!-- if statement for line 38 -->
						<xsl:if test="$Form2220Data/TotalPenalty != 0">
							<!--Line 38 -->
							<div class="styBB" style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:6mm;">38</div>
								<div class="styLNDesc" style="height:6mm;width:138mm">
									<span class="styBoldText">Penalty. </span> 
          Add columns (a) through (d) of line 37. Enter the total here and on Form 1120, line 
            33;or the comparable line for other income tax returns
          <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
     	     <span style="width:16px"/>.
     	     <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
     	   <span style="width:16px"/>.
          </span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:6mm;
            padding-top:3.5mm;width:8mm;">38</div>
								<div class="styLNAmountBoxNBB" style="height:7mm;float:right;
          padding-top:3.5mm;">$<span class="styDollarSpan"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2220Data/TotalPenalty"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:if>
					<!-- Check when separated print is selected and Part IV count is >4 
        populate the empty grid when there is no PaymentPenaltyComputation -->
					<!--<xsl:if test="not($Form2220Data/PaymentPenaltyComputation) or ((count($Form2220Data/PaymentPenaltyComputation) &gt; 4) and ($Print = $Separated))">-->
					<xsl:if test="(count($Form2220Data/PaymentPenaltyComputation) &lt; 1) or (($Print = $Separated) and (count($Form2220Data/PaymentPenaltyComputation) &gt; 4))">
						<!--a, b , c, d table header Line  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styIRS2220LNDescTbl"/>
							<div class="styLNRightNumBox" style="border-right-width:0px;"/>
							<div class="styIRS2220Part3LNCellHeader" style="border-left-width:0px;">(a)<span class="styTableCellPad"/>
							</div>
							<div class="styIRS2220Part3LNCellHeader">(b)<span class="styTableCellPad"/>
							</div>
							<div class="styIRS2220Part3LNCellHeader">(c)<span class="styTableCellPad"/>
							</div>
							<div class="styIRS2220Part3LNCellHeader">(d)<span class="styTableCellPad"/>
							</div>
						</div>
						<!--Line 19 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:20mm;">19</div>
							<div class="styIRS2220LNDescTbl" style="height:20mm;">
              Enter the date of payment or the 15th day of the 3rd month after the close of
              the tax year, whichever is earlier (see instructions).
              <span class="styBoldItalicText">(Form 990-PF and Form 990-T filers:</span>
              Use 5th month instead of 3rd month.)
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
							</div>
							<div class="styLNRightNumBox" style="height:20mm;padding-top:16mm;">19</div>
							<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation"/>
									<xsl:with-param name="ShortMessage" select=" 'true' "/>
								</xsl:call-template>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center"/>
							<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center"/>
							<div class="styIRS2220Part3LNCell" style="height:20mm;padding-top:16mm;text-align:center"/>
						</div>
						<!--Line 20 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10mm;">20</div>
							<div class="styIRS2220LNDescTbl" style="height:10mm;">
              Number of days from due date of installment
              on line 9 to the date shown on line 19
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">20</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;"/>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;"/>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;"/>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;"/>
						</div>
						<!--Line 21 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">21</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 4/15/2010 and before 7/1/2010
                <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 21
              </span>
								<span style="width:2px"/>
              x 4%
              <br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">22</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 23 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">23</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 6/30/2010 and before 10/1/2010 
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 23</span>
								<span style="width:2px"/>
                 x  X%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">24</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 25 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">25</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 9/30/2010 and before 1/1/2011
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 25</span>
								<span style="width:2px"/>
                x  X%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 27 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">27</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 12/31/2010 and before 4/1/2011
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 27</span>
								<span style="width:2px"/> x  X%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">28</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 29 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">29</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 3/31/2011 and before 7/1/2011
              <span class="styBoldText">
									<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 29</span>
								<span style="width:2px"/> x *%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">30</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 31 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">31</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 6/30/2011 and before 10/1/2011
              <span class="styBoldText">
									<span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 31</span>
								<span style="width:2px"/> x *%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">32</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 33 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">33</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 9/30/2011 and before 1/1/2012
              <span class="styBoldText">
									<span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 33</span>
								<span style="width:2px"/> x *%<br/>
								<span style="width:60px"/>365
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">34</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 35 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">35</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;">
              Number of days on line 20 after 12/31/2011 and before 2/16/2012
              <span class="styBoldText">
									<span style="width:16px"/>.
              </span>
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
              Underpayment on line 17 x <br/>
								<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 35</span>
								<span style="width:2px"/> x *%<br/>
								<span style="width:60px"/>366
            </div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">36</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:11mm;padding-top:7mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 37 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top: 4.5mm">37</div>
							<div class="styIRS2220LNDescTbl" style="height:8mm;font-size: 6pt; padding-top: 4.5mm">
              Add lines 22, 24, 26, 28, 30, 32, 34, and 36
              <span class="styBoldText">
									<span style="width:16px"/>.
                </span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">37</div>
							<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
							</div>
							<div class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;">$<span class="styDollarSpan"/>
							</div>
						</div>
						<!--Line 38 -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:6mm;">38</div>
							<div class="styLNDesc" style="height:6mm;">
								<span class="styBoldText">Penalty. </span> 
            Add columns (a) through (d) of line 37. Enter the total here and on Form 1120, line 33;        
            or the comparable line for other income tax returns 
            <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
             <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>. 
               <span style="width:16px"/>.
           <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
     	   <span style="width:16px"/>.
            </span>
							</div>
							<div class="styLNRightBoxNBB" style="height:8mm;float:right;">
								<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:3.5mm;">38</div>
								<div class="styLNAmountBoxNBB" style="width:29mm;height:8mm;padding-top:3.5mm;text-align:right;">$<span class="styDollarSpan "/>
								</div>
							</div>
						</div>
					</xsl:if>
					<!--Page 2 note  -->
					<div class="styTBB" style="width:187mm;">*Use the penalty interest rate for each calendar quarter, which the IRS will determine during the first month in the preceding quarter. These rates are published quarterly in an IRS News Release and in a revenue ruling in the Internal Revenue Bulletin. To obtain this information on the Internet, access the IRS website at <span class="styBoldText">www.irs.gov.</span> You can also call
        1-800-829-4933 to get interest rate information.
      </div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>  
          Form <span class="styBoldText">2220</span> (2010)
        </div>
					</div>
					<!--END Page Footer-->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 2220 (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="padding-left: 0px">Schedule A
          <span style="width:16px;"/>
            Adjusted Seasonal Installment Method and Annualized Income Installment Method<br/>
							<span class="styNormalText" style="padding-left: 24mm">(see instructions)</span>
						</div>
						<!--Line  -->
						<div style="width:187mm;float:left;clear:none;">
							<span class="styBoldText">Form 1120S filers:</span>
							<span class="styItalicText">
            For lines 1, 2, 3, and 21, below, "taxable income" refers to excess 
            net passive income or the amount on which tax is imposed under section 
            1374(a), whichever applies.
          </span>
						</div>
					</div>
					<!-- END SCHEDULE A TITLE -->
					<div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Adjusted Seasonal Installment Method
          (Caution: <span class="styItalicText" style="font-weight:normal;font-size:7.8pt">Use this method only if the base period percentage for any 6 consecutive months is at least 70%. See instructions.)</span>
						</div>
					</div>
					<!--a, b, c, d header Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;border-top-width:1px;text-align:bottom;">1</div>
						<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm;border-top-width:1px;text-align:bottom;">Enter taxable income for the following periods:</div>
						<div class="styLNRightNumBox" style="height:4.75mm;border-left-width:1px;width:6mm;border-bottom-width:0px;"/>
						<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-left-width:1px;border-bottom-width:1px;">(a)</div>
						<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(b)</div>
						<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(c)</div>
						<div class="styIRS2220LNCellHeader" style="height:4.75mm;padding-top:0px;width:25.3mm;border-bottom-width:1px;">(d)</div>
					</div>
					<!--Sch A Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;"/>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;width:6mm;"/>
						<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 3 months</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 5 months</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 8 months</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;text-align:center;width:25.3mm;border-bottom-width:1px;">First 11 months</div>
					</div>
					<!--Line 1a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;width:6mm;">a</div>
						<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm">Tax year beginning in 2007</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px;">1a</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 1b -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm">b</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm">Tax year beginning in 2008</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px;">1b</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 1c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm">c</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm">Tax year beginning in 2009</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px;">1c</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 2 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10mm;width:6mm">2</div>
						<div class="styIRS2220LNDescTbl" style="height:10mm;width:73mm">
          Enter taxable income for each period for the tax year beginning in 2009 (see instructions for the treatment of extraordinary items).
        </div>
						<div class="styLNRightNumBox" style="height:10.5mm;padding-top:7mm;width:6mm;border-bottom-width: 0px;">2</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First3MonthsTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First5MonthsTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First8MonthsTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First11MonthsTaxableIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-top:1.5mm;">3</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm;padding-top:1.5mm;">Enter taxable income for the following periods:</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.5mm;border-bottom-width:0px;width:6mm"/>
						<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 0px;">First 4 months</div>
						<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 0px;">First 6 months</div>
						<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 0px;">First 9 months</div>
						<div class="styIRS2220LNCell" style="height:5.25mm;text-align:center;width:25.3mm;padding-top:1mm;border-bottom-width: 0px;">Entire year</div>
					</div>
					<!-- line 3a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm">a</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm">Tax year beginning in 2007</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px">3a</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY1"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3b -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;width:6mm">b</div>
						<div class="styIRS2220LNDescTbl" style="height:4mm;width:73mm">Tax year beginning in 2008</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px">3b</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY2"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm">c</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;width:73mm">Tax year beginning in 2009</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width: 0px;">3c</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxableIncomeTY3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 4 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">4</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Divide the amount in each column on line 1a by the amount in column (d) on line 3a.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm; width:6mm;border-bottom-width: 0px;">4</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio1TY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio1TY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio1TY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeRatioTY1"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">5</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Divide the amount in each column on line 1b by the amount in column (d) on line 3b.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">5</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio1TY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width:0px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio1TY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio1TY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeRatioTY2"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 6 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">6</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;border-bottom-width: 0px;">
          Divide the amount in each column on line 1c by the amount in column (d) on line 3c.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">6</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio1TY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio1TY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio1TY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeRatioTY3"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:4m;padding-top:2mm;">7</div>
						<div class="styIRS2220LNDescTbl" style="width:73mm;height:4m;padding-top:2mm;">Add lines 4 through 6.</div>
						<div class="styLNRightNumBox" style="width:6mm;height:4.5mm;padding-top:2mm;border-bottom-width: 0px;">7</div>
						<div class="styIRS2220LNCell" style="width:25.3mm;height:4.5mm;font-size:4.5pt;padding-top:3.5mm;border-bottom-width: 0px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatioTotal1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="width:25.3mm;height:4.5mm;font-size:4.5pt;padding-top:3.5mm;border-bottom-width: 0px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatioTotal1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="width:25.3mm;height:4.5mm;font-size:4.5pt;padding-top:3.5mm;border-bottom-width: 0px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatioTotal1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style=" width:25.3mm;height:4.5mm;font-size:4.5pt;padding-top:3.5mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeRatioTotal"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 8 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;width:6mm">8</div>
						<div class="styIRS2220LNDescTbl" style="height:4mm;padding-top:2mm;width:73mm">Divide line 7 by 3.0.</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:2mm;width:6mm;border-bottom-width: 0px;">8</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatioAvg1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatioAvg1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatioAvg1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeRatioAvg"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 9a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;width:6mm">9a</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;padding-top:2mm;width:73mm">Divide line 2 by line 8.</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:2mm;width:6mm;border-bottom-width: 0px;">9a</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeFactored"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeFactored"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeFactored"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncomeFactored"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 9b -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:2mm;width:6mm;">b</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;padding-top:2mm;width:73mm">Extraordinary items (see instructions).</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:3mm;width:6mm;border-bottom-width: 0px;">9b</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MnthIncmExtraordnryItems"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MnthIncmExtraordnryItems"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MnthIncmExtraordnryItems"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearIncmExtraordnryItem"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 9c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:2mm;width:6mm">c</div>
						<div class="styIRS2220LNDescTbl" style="height:4.5mm;padding-top:2mm;width:73mm">Add lines 9a and 9b.</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:3mm;width:6mm;border-bottom-width: 0px;">9c</div>
						<div class="styIRS2220LNCell" style="height:4.75mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTotalTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTotalTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTotalTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:4.5mm;padding-top:3.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTotalTaxableIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 10 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:12mm;width:6mm">10</div>
						<div class="styIRS2220LNDescTbl" style="height:12mm;width:73mm">
          Figure the tax on the amount on line 9c using the instructions for Form 1120,
          Schedule J, line 2 (or comparable line of corporation's return).
        </div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;width:6mm;border-bottom-width: 0px;">10</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxFigured1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxFigured1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxFigured1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxFigured"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 11a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;padding-left:.25mm">11a</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Divide the amount in columns (a) through (c) on line 3a by the amount in column (d) on line 3a.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">11a</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio2TY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio2TY1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio2TY1"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
					</div>
					<!-- Sch-A Line 11b -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:8mm;width:6mm">b</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Divide the amount in columns (a) through (c) on line 3b by the amount in
          column (d) on line 3b.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">11b</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio2TY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio2TY2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio2TY2"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
					</div>
					<!-- Sch-A Line 11c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:8mm;width:6mm">c</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Divide the amount in columns (a) through (c) on line 3c by the amount in
          column (d) on line 3c.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">11c</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatio2TY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatio2TY3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatio2TY3"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
					</div>
					<!-- Sch-A Line 12 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">12</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Add lines 11a through 11c.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">12</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatioTotal2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatioTotal2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatioTotal2"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
					</div>
					<!-- Sch-A Line 13 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">13</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Divide line 12 by 3.0.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">13</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsIncomeRatioAvg2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsIncomeRatioAvg2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="font-size:4.5pt;height:8mm;padding-top:4.5mm; width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsIncomeRatioAvg2"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
					</div>
					<!-- Sch-A Line 14 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:12mm;width:6mm">14</div>
						<div class="styIRS2220LNDescTbl" style="height:12mm;;width:73mm">
          Multiply the amount in columns (a) through (c) of line 10 by columns (a) through
          (c) of line 13. In column (d), enter the amount from line 10, column (d).
        </div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;width:6mm;border-bottom-width: 0px;">14</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxFigured2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxFigured2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxFigured2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:12mm;padding-top:8mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxFigured"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 15 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">15</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Enter any alternative minimum tax for each payment period
          (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">15</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsAlternativeMinTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsAlternativeMinTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsAlternativeMinTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearAlternativeMinTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 16 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.8mm;width:6mm">16</div>
						<div class="styIRS2220LNDescTbl" style="height:7.8mm;width:73mm">
          Enter any other taxes for each payment period (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:3.5mm;width:6mm;border-bottom-width: 0px;">16</div>
						<div class="styIRS2220LNCell" style="height:7.8mm;padding-top:3.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsOtherTaxes"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:7.8mm;padding-top:3.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsOtherTaxes"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:7.8mm;padding-top:3.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsOtherTaxes"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:7.8mm;padding-top:3.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearOtherTaxes"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 17 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">17</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Add lines 14 through 16.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">17</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTotalTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTotalTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTotalTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTotalTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 18 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10.5mm;width:6mm;">18</div>
						<div class="styIRS2220LNDescTbl" style="height:10.5mm;width:73mm;">
          For each period, enter the same type of credits as allowed on Form 2220, lines 1 and 2c (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:10.5mm;width:6mm;border-bottom-width: 0px;padding-top:6mm;">18</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:6mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:6mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:6mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10.5mm;padding-top:6mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 19 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;">19</div>
						<div class="styIRS2220LNDescTbl" style="height:7mm;padding-top:1px;padding-bottom:0px;width:73mm">
          Total tax after credits. Subtract line 18 from line 17. If zero or less, enter  -0-.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;padding-bottom:0px;width:6mm;border-bottom-width: 0px;">19</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsTaxAfterCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsTaxAfterCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsTaxAfterCredits"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/EntireYearTaxAfterCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>  
          Form <span class="styBoldText">2220</span> (2010)
        </div>
					</div>
					<!--END Page Footer-->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 2220 (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- Part II -->
					<div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;border-top-width:1px;">
						<div class="styIRS2220PTDesc" style="width:186mm; ">
							<span class="styPartName">Part II</span>
							<span class="styPartDesc">Annualized Income Installment Method</span>
						</div>
					</div>
					<!-- Line 20 line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;border-top-width: 1px;"/>
						<div class="styIRS2220LNDescTbl" style="width:73mm;height:4mm;border-top-width: 1px;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-left-width:1px;border-right-width:0px;width:6mm;border-bottom-width:0px;"/>
						<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(a)</div>
						<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(b)</div>
						<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(c)</div>
						<div class="styIRS2220LNCellHeader" style="height:4mm;padding-top:0px;padding-bottom:.75mm;width:25.3mm;border-bottom-width:1px;">(d)</div>
					</div>
					<!--Line 20, line 2-->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8.5mm;width:6mm;padding-top:4.5mm;border-bottom-width:0px;">20</div>
						<div class="styIRS2220LNDescTbl" style="height:8.5mm;width:73mm;padding-top:4.5mm;">
          Annualization periods (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:8.5mm;width:6mm;border-top-width: 0px;padding-top:4.5mm;border-bottom-width: 0px;">20</div>
						<div class="styIRS2220LNCell" style="width:25.4mm;text-align:center;border-left-width:1px;border-right-width:0px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;">
							<br/>First 
       	<span style="width:5mm;border-bottom: 1 solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="2"/>
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod1"/>
								</xsl:call-template>
							</span>
							<br/> months
       </div>
						<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;">
							<br/>First 
       	<span style="width:5mm;border-bottom: 1 solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="2"/>
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod2"/>
								</xsl:call-template>
							</span>
							<br/> months
       </div>
						<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;">
							<br/>First 
       	<span style="width:5mm;border-bottom: 1 solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="2"/>
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod3"/>
								</xsl:call-template>
							</span>
							<br/> months
       </div>
						<div class="styIRS2220LNCell" style="width:25.3mm;text-align:center;border-left-width:1px;border-right-width:0px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;">
							<br/>First 
       	<span style="width:5mm;border-bottom: 1 solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="2"/>
									<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationPeriod4"/>
								</xsl:call-template>
							</span>
							<br/> months
       </div>
					</div>
					<!-- Sch-A Line 21 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10mm;width:6mm">21</div>
						<div class="styIRS2220LNDescTbl" style="height:10mm;padding-top:0px;padding-bottom:0px;width:73mm">
          Enter taxable income for each annualization period (see instructions for the treatment of extraordinary items).
        </div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;width:6mm;border-bottom-width: 0px;">21</div>
						<div class="styIRS2220LNCell" style="height:10mm;padding-top:6mm;;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10mm;padding-top:6mm;;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10mm;padding-top:6mm;;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:10mm;padding-top:6mm;;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TaxableIncome4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 22 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">22</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Annualization amounts (see instructions).</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">22</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizationAmount4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;padding-top:4mm;">23a</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;padding-top:4mm;">
          Annualized taxable income. Multiply line 21 by line 22.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;padding-top:4mm;">23a</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTaxableIncome4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23b -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:8mm;width:6mm;padding-top:4mm;padding-left:4mm;">b</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;padding-top:4mm;">
          Extraordinary items (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">23b</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/ExtraordinaryItems4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:8mm;width:6mm;padding-top:4mm;padding-left:4mm;">c</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;padding-top:4mm;">
         Add lines 23a and 23b.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">23c</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncome1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncome2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncome3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedTotalTaxableIncome4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 24 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm;padding-top:2mm;">24</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm;padding-top:2mm;">
          Figure the tax on the amount on line 23c using the instructions for
          Form 1120, Schedule J, line 2 (or comparable line of corporation’s return).          
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:10mm;width:6mm;border-bottom-width: 0px;">24</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:10.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:10.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:10.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:10.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredTaxAmount4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 25 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">25</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Enter any alternative minimum tax for each payment period
          (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">25</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4 mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AlternativeMinimumTax4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 26 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;width:6mm;">26</div>
						<div class="styIRS2220LNDescTbl" style="height:7mm;width:73mm;">
          Enter any other taxes for each payment period
          (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">26</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/OtherTaxes4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 27 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;width:6mm;padding-top:4mm;">27</div>
						<div class="styIRS2220LNDescTbl" style="height:6mm;width:73mm;padding-top:4mm;">Total tax. Add lines 24 through 26.</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">27</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:6.75mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTax4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 28 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm">28</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm">
          For each period, enter the same type of credits as allowed on Form 2220, lines
          1 and 2c (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;width:6mm;border-bottom-width: 0px;">28</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/Credits4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 29 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">29</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Total tax after credits. Subtract line 28 from line 27. If zero or less, enter -0-.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">29</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterCredits4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 30 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">30</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Applicable percentage.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">30</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 0px;">25%</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 0px;">50%</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 0px;">75%</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;text-align:center;width:25.3mm;border-bottom-width: 0px;">100%</div>
					</div>
					<!-- Sch-A Line 31 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">31</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Multiply line 29 by line 30.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">31</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxAfterPercentage3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalTaxPercentage4"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Begin Part III -->
					<div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<div class="styIRS2220PTDesc" style="width:186mm; ">
							<span class="styPartName">Part III</span>
							<span class="styPartDesc">Required Installments</span>
						</div>
					</div>
					<!--Note Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm"/>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
							<span class="styBoldText">Note:</span>
							<span class="styItalicText">
            Complete lines 32 through 38 of one column <br/>before completing 
            the next column.
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">1st<br/>installment</div>
						<div class="styIRS2220LNCell" style="height:8mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">2nd<br/>installment</div>
						<div class="styIRS2220LNCell" style="height:8mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">3rd<br/>installment</div>
						<div class="styIRS2220LNCell" style="height:8mm;text-align:center;width:25.3mm;border-bottom-width: 1px;">4th<br/>installment</div>
					</div>
					<!-- Sch-A Line 32 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:14mm;width:6mm">32</div>
						<div class="styIRS2220LNDescTbl" style="height:14mm;width:73mm">
          If only Part I or Part II is completed, enter the amount in each
          column from line 19 or line 31. If both parts are completed, enter
          the <span class="styBoldText">smaller</span> of the amounts in each column from line 19 or line 31.
        </div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:9mm;width:6mm;border-bottom-width: 0px;">32</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSeasonal1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSeasonal2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSeasonal3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:14mm;padding-top:9mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AnnualizedOrAdjustedSeasonal4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 33 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">33</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Add the amounts in all preceding columns of line 38 (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">33</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/TotalPrecedingRequired4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 34 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm;">34</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm;">
							<span style="font-weight: bold">Adjusted seasonal or annualized income installments.</span>
          Subtract line 33 from line 32. If zero or less, enter -0-.
        </div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">34</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First4MonthsAdjSsnlOrAnnlzd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First6MonthsAdjSsnlOrAnnlzd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/First9MonthsAdjSsnlOrAnnlzd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:4.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/AdjustedSeasonalOrAnnualized"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 35 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm;">35</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;padding-bottom:0px;width:73mm;">
          Enter 25% of line 5 on page 1 of Form 2220 in each column. 
          <span class="styBoldText">Note:</span>
							<span class="styItalicText"> “Large corporations,” see the instructions for line 10 for
the amounts to enter.</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;width:6mm;border-bottom-width: 0px;">35</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionOfSmallerTax1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 0px;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionOfSmallerTax2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionOfSmallerTax3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7.5mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionOfSmallerTax4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 36 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;width:6mm">36</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;width:73mm">
          Subtract line 38 of the preceding column from line 37 of the preceding column.
        </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">36</div>
						<div class="styShadingCell" style="border-bottom-width:1px;height:8mm;width:25.3mm;border-bottom-width: 0px;"/>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/InstallmentCarryover4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 37 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;width:6mm">37</div>
						<div class="styIRS2220LNDescTbl" style="height:8mm;padding-top:4mm;width:73mm">Add lines 35 and 36.</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;border-bottom-width: 0px;">37</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/PortionOfSmallerTax1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:8mm;padding-top:4mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/FiguredRequiredInstallment4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch-A Line 38 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:6mm">38</div>
						<div class="styIRS2220LNDescTbl" style="height:11mm;width:73mm">
							<span class="styBoldText">Required installments.</span> Enter the
          <span class="styBoldText">smaller</span> of line 34 or line 37 here
          and on page 1 of Form 2220, line 10 (see instructions).
        </div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;width:6mm;border-bottom-width: 0px;">38</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment1"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment2"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment3"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2220LNCell" style="height:11mm;padding-top:7mm;width:25.3mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2220ScheduleA/RequiredInstallment4"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>  
          Form <span class="styBoldText">2220</span> (2010)
        </div>
					</div>
					<!--END Page Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
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
							<xsl:with-param name="Desc">Line 1 - Section 338 Gain Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTax/@section338GainIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 1 - Section 338 Gain Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form2220Data/TotalTax/@section338GainAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- ********************************************************************************** -->
					<!-- Begin Separated repeating data for Part IV -->
					<xsl:if test="$Print = $Separated and count($Form2220Data/PaymentPenaltyComputation) &gt;4">
						<!--Populate columns heading in incremented alpha -->
						<xsl:for-each select="$Form2220Data/PaymentPenaltyComputation">
							<xsl:variable name="curPos">
								<xsl:value-of select="position()"/>
							</xsl:variable>
							<xsl:if test="position() mod 4 = 1">
								<!-- Part IV Table heading -->
								<div class="styRepeatingDataTitle">Form 2220, Part IV - Figuring the Penalty :</div>
								<div>
									<table class="styDepTbl" style="font-size:7pt;">
										<thead class="styTableThead">
											<!-- Label the Column Headers -->
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" scope="col" style="width:6mm;border-right-width:0px;"/>
												<th class="styDepTblCell" scope="col" style="width:60mm;border-right-width:0px;border-left-width:0px;"/>
												<th class="styDepTblCell" scope="col" style="width:8mm;border-right-width:0px;"/>
												<th class="styDepTblCell" scope="col" style="width:28mm;border-left-width:0px;">(<xsl:number value="position()" format="a"/>)</th>
												<th class="styDepTblCell" scope="col" style="width:28mm;">(<xsl:number value="position() + 1" format="a"/>)</th>
												<th class="styDepTblCell" scope="col" style="width:28mm;">(<xsl:number value="position() + 2" format="a"/>)</th>
												<th class="styDepTblCell" scope="col" style="width:28mm;">(<xsl:number value="position() + 3" format="a"/>)</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<!--  Line 19-->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">19</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                    Enter the date of payment or the 15th day of the 3rd month after the close of
                    the tax year, whichever is earlier (see instructions).
                    <span class="styBoldItalicText">(Form 990-PF and Form 990-T filers:</span>
                    Use 5th month instead of 3rd month.)
                  <span class="styBoldText">
														<span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD">19</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PaymentDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 20 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">20</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Number of days from due date of installment
              on line 9 to the date shown on line 19
              <span class="styBoldText">
														<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
												</td>
												<td class="styDepTblCellRNBSRD">20</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="DaysFromDueDateToPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/DaysFromDueDateToPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/DaysFromDueDateToPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/DaysFromDueDateToPaymentDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 21 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">21</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                    Number of days on line 20 after 4/15/2009 and before 7/1/2009
                    <span class="styBoldText">
														<span style="width:16px"/>.
                    </span>
												</td>
												<td class="styDepTblCellRNBSRD">21</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn1stDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 22 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">22</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">
                    Number of days on line 21
                  </span>
													<span style="width:2px"/>
                  x 4%
                  <span class="styBoldText">
														<span style="width:16px"/>.
                    </span>
													<br/>
													<span style="width:60px"/>365
                </td>
												<td class="styDepTblCellRNBSRD">22</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor1stDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor1stDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 23 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">23</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 6/30/2009 and before 10/1/2009
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD" style="font-weight:bold;">23</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn2ndDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 24 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">24</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">
                Number of days on line 23</span>
													<span style="width:2px"/>
                 x 4% 
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">24</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor2ndDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor2ndDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 25 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">25</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 9/30/2009 and before 1/1/2010
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD" style="font-weight:bold;">25</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn3rdDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 26 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">26</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">
                    Number of days on line 25</span>
													<span style="width:2px"/>
                     x X%
                  <span class="styBoldText">
														<span style="width:16px"/>.
                    </span>
													<br/>
													<span style="width:60px"/>365
                </td>
												<td class="styDepTblCellRNBSRD">26</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor3rdDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor3rdDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 27 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">27</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 12/31/2009 and before 4/1/2010
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD">27</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn4thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--  Line 28 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">28</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 27</span>
													<span style="width:2px"/> x X%
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">28</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor4thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor4thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 29 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">29</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 3/31/2010 and before 7/1/2010
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD">29</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn5thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--  Line 30-->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">30</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 29</span>
													<span style="width:2px"/> x *%
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">30</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor5thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor5thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--  Line 31 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">31</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 6/30/2010 and before 10/1/2010
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD" style="font-weight:bold;">31</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 32 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">32</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 31</span>
													<span style="width:2px"/> x *%
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">32</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PenaltyFor6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/PenaltyFor6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/PenaltyFor6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/PenaltyFor6thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--  Line 33 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">33</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 9/30/2010 and before 1/1/2011
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD" style="font-weight:bold;">33</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 34 -->
											<tr class="styDepTblRow2" style="">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">34</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 33</span>
													<span style="width:2px"/> x *%
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">34</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--  Line 35 -->
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">35</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
                  Number of days on line 20 after 12/31/2010 and before 2/16/2011
                  <span class="styBoldText">
														<span style="width:16px"/>.
                  </span>
												</td>
												<td class="styDepTblCellRNBSRD" style="font-weight:bold;">35</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="MaxSize" select="3"/>
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/LateDaysIn6thDateRange"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 36 -->
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">36</td>
												<td style="width:60mm;text-align:left;border-left-width:0px;" class="styDepTblCell">
              Underpayment on line 17 x <br/>
													<span style="width:35mm;border-bottom: 1 solid black">Number of days on line 35</span>
													<span style="width:2px"/> x *%
              <span class="styBoldText">
														<span style="width:16px"/>.
                </span>
													<br/>
													<span style="width:60px"/>365
            </td>
												<td class="styDepTblCellRNBSRD">36</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/TotalPenaltyForPaymentDate"/>
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
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 1]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 2]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCellSRD">$<span class="styDollarSpan"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/TotalPenaltyForPaymentDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<xsl:if test="position()='1'">
												<!--Line 38 -->
												<tr class="styDepTblRow2" style="width:187mm;">
													<td class="styDepTblCell" style="text-align:left;border-right-width:0px;font-weight:bold;">38</td>
													<td style="text-align:left;" colspan="5">
														<b>Penalty. </b>
                    Add columns (a) through (d) of line 37.  Enter the total here and on form 1120, line 33; or the comparable line for other income tax returns
                    <!--Dotted Line-->
														<span class="styBoldText">
															<span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.
                    </span>
													</td>
													<td class="styIRS2220Part3LNCell" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">$<span class="styDollarSpan"/>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form2220Data/PaymentPenaltyComputation[$curPos + 3]/TotalPenaltyForPaymentDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</div>
								<br/>
							</xsl:if>
						</xsl:for-each>
						<!--  ******************************************************************************-->
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
