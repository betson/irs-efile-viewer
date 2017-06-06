<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]><!-- Last Modified by Eugenia McDonald on 09/05/2013 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8916AStyle.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8916A"/>
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Description" content="Form IRS 8916A"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8916AStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8916A">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:34mm;font-size: 7pt;height:19mm;">
      Form <span class="styFormNumber">8916-A</span>
							<br/>
							<br/>
							<span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height:19mm;width:122mm;padding-top:1mm;">
							<div class="styMainTitle" style="">Supplemental  Attachment to Schedule M-3</div>
							<br/>
							<br/>
							<div style="font-size:7.3pt;margin-left:3mm;height:3.6mm">
								<img src="{$ImagePath}/8916A_Bullet.gif" alt="MediumBullet"/>  
        Attach to Schedule M-3 for Form 1065, 1120, 1120-L, 1120-PC, or 1120S. 
							</div>
							<div style="font-size:7.3pt;margin-left:1mm;">
								<img src="{$ImagePath}/8916A_Bullet.gif" alt="MediumBullet"/>  
        Information about Form 8916-A and its instructions is at <i>www.irs.gov/form1120.</i> 
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-2061</div>
							<br/>
							<div class="styTY" style="height:10mm;">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:140mm;height:4mm;font-size:7pt;">
            Name of common parent<br/>
							<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!--  Name and Employer identification number 2  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:140mm;height:4mm;font-size:7pt;">
            Name of subsidiary<br/>
							<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationName/BusinessNameLine1"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationName/BusinessNameLine2"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number 2 -->
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
					    <div class="styPartName" style="width:11mm;font-size:9pt;height:4.5mm">Part l</div>
						<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:4mm;         height:4.5mm">Cost of Goods Sold</div>
					</div>
					<!-- END Part I Title -->
					<!--start table-->
					<table class="styTable" id="IRS8916ATable" summary="Cost of Goods Sold Items [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
						<tr>
							<th class="styTableThead" style="border-bottom:solid black 1px;width:320px;text-align:center;          font-size:8.5pt;" scope="col">
                           <span style="font-weight:normal">Cost of Goods Sold Items</span></th>
							<th class="styIRS8916ATheadCell" scope="col">
								<span class="styBoldText">
                           (a)</span>
								<br/> Expense per<br/>Income Statement<br/>
							</th>
							<th class="styIRS8916ATheadCell" scope="col">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS8916ATheadCell" scope="col">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS8916ATheadCell" scope="col">
								<span class="styBoldText">
                           (d)</span>
								<br/> Deduction per Tax <br/>Return<br/>
							</th>
						</tr>
					</table>
					<table class="styTable" id="IRS8916ATableData" summary="Cost of Goods Sold Items" cellspacing="0" cellpadding="0" style="font-size:8.5pt;width:187mm;">
						<!-- line 1 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>1</td>
							<td>
								<span style="height:8mm;padding-top: 2mm;">
									<span style="float:left">Amounts attributable to cost flow assumptions</span>
									<span class="styDotLn" style="float:right;">..</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmtAttrblCostFlowAssumptionGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmtAttrblCostFlowAssumptionGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmtAttrblCostFlowAssumptionGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmtAttrblCostFlowAssumptionGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">Amounts attributable to:</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916AShadedCell" style="border-left-width:0px">
								<span style="width:1mm"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916AShadedCell" style="border-left-width:0px">
								<span style="width:1mm"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916AShadedCell" style="border-left-width:0px">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- line 2a -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>a</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Stock option expense</span>
									<span class="styDotLn" style="float:right;">..........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/StockOptionExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/StockOptionExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/StockOptionExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/StockOptionExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2b -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>b</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Other equity based compensation</span>
									<span class="styDotLn" style="float:right;">......</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherEquityBasedCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherEquityBasedCompensation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherEquityBasedCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherEquityBasedCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2c -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>c</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Meals and entertainment</span>
									<span class="styDotLn" style="float:right;">.........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2d -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>d</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Parachute payments</span>
									<span class="styDotLn" style="float:right;">...........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/ParachutePayments/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/ParachutePayments/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/ParachutePayments/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/ParachutePayments/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2e -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>e</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Compensation with section 162(m) limitation</span>
									<span class="styDotLn" style="float:right;">..</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CompWithSect162mLimitation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CompWithSect162mLimitation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CompWithSect162mLimitation/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CompWithSect162mLimitation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2f -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>f</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Pension and profit sharing</span>
									<span class="styDotLn" style="float:right;">.........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/PensionAndProfitSharing/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2g -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>g</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Other post-retirement benefits</span>
									<span class="styDotLn" style="float:right;">.......</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2h -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>h</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Deferred compensation</span>
									<span class="styDotLn" style="float:right;">..........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DeferredCompensation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DeferredCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DeferredCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2i -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>i</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Reserved</span>
									<span class="styDotLn" style="float:right;">..............</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm;"/>
							</td>
						</tr>
						<!-- line 2j -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>j</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Amortization</span>
									<span class="styDotLn" style="float:right;">.............</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/Amortization/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/Amortization/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/Amortization/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/Amortization/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2k -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>k</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Depletion</span>
									<span class="styDotLn" style="float:right;">..............</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepletionGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepletionGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepletionGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepletionGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2l -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>l</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Depreciation</span>
									<span class="styDotLn" style="float:right;">.............</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepreciationGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepreciationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/DepreciationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2m -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>m</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Corporate owned life insurance premiums</span>
									<span class="styDotLn" style="float:right;">...</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CorporateOwnedLifeInsPremGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CorporateOwnedLifeInsPremGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CorporateOwnedLifeInsPremGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/CorporateOwnedLifeInsPremGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2n -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:3mm;"/>n</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Other section 263A costs</span>
									<span class="styDotLn" style="float:right;">.........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherSection263ACostsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherSection263ACostsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherSection263ACostsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountsAttributableGrp/OtherSection263ACostsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 3 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Inventory shrinkage accruals</span>
									<span class="styDotLn" style="float:right;">........</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccrualsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccrualsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccrualsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryShrinkageAccrualsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 4 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Excess inventory and obsolescence reserves</span>
									<span class="styDotLn" style="float:right;">..</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExInvntryObsolescenceReserves/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 5 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Lower of cost or market write-downs</span>
									<span class="styDotLn" style="float:right;">.....</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LowerCostOrMarketWritedownsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LowerCostOrMarketWritedownsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LowerCostOrMarketWritedownsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LowerCostOrMarketWritedownsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 6  -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Other items with differences (attach statement)
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferencesGrp"/>
										</xsl:call-template>
									</span>
								</span>
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferencesGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferencesGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferencesGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferencesGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 7 -->
						<tr valign="middle" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>7</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">Other items with no differences</span>
									<span class="styDotLn" style="float:right;">.......</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsNoDifferences/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916AShadedCell">
								<span style="width:1mm"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherItemsNoDifferences/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 8  -->
						<tr valign="top" style="height:8mm;">
							<td class="styIRS8916ANumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td>
								<span style="padding-top:2mm;height:8mm;">
									<span style="float:left">
										<b>Total cost of goods sold.</b> Add lines 1 through 7, in columns a, b, c, and d. Enter totals on the applicable Schedule M-3. See instructions.
										<span class="styBoldText">
											<span style="width:7px"/>.
											<span style="width:7px"/>.
											<span style="width:7px"/>.
										</span>
									</span>
								</span>
								<!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</table>
					<!-- table end -->
					<!--  FOOTER-->
					<div style="width:187mm;border-top:1px solid black;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:125px;"/>                      
                        <span style="font-size:6.5pt">Cat. No. 48657X</span>
                        <span style="width:106px;"/>  
                        <span style="font-size:6.5pt"> Form </span><span style="font-size:8pt">
                        <span class="styBoldText">8916-A</span></span> (2013)
                    </div>
					<br class="pageEnd"/>
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8916-A (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Part ll Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black">
						<div class="styPartName" style="width:13mm;font-size:9pt;height:4.5mm">Part ll</div>
						<div class="styPartDesc" style="width:164mm;font-size:9pt;height:4.5mm;         padding-left:4mm">Interest Income</div>
					</div>
					<!-- END Part ll Title -->
					<!--start table-->
					<table class="styTable" id="IRS8916ATable" summary="Interest Income [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
						<tr valign="middle" style="height:7mm;">
							<th class="styIRS8916ALnNumCell">
							  <span style="width:8.68mm;"/>
							</th>
							<th class="styTableThead" style="border-bottom:solid black 1px;border-right:solid black 1px;          width:45.39mm;text-align:center;font-size:8.5pt;font-weight:normal" scope="col">Interest Income Item</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (a)</span>
								<br/>Income (Loss) per <br/>Income Statement<br/>
							</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS8916ATheadCellPt2" style="border-right:0px;" scope="col">
								<span class="styBoldText">
                           (d)</span>
								<br/> Income (Loss) per<br/>Tax Return<br/>
							</th>
						</tr>
					</table>
					<table class="styTable" id="IRS8916ATableData" summary="Interest Income" cellspacing="0" cellpadding="0" style="font-size:8.5pt;width:187mm;">
						<!-- line 1 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>1</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm">Tax-exempt interest<br/> income
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncomeGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncomeGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestIncomeGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916AShadedCell" style="width:30mm;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- line 2 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>2</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm">Interest income from 
								<br/>hybrid securities
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntIncomeGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntIncomeGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntIncomeGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntIncomeGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 3 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>3</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							 Sale/lease interest income
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncomeGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncomeGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncomeGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SaleLeaseInterestIncomeGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 4a -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>4a</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Intercompany interest <br/>income - From outside tax<br/>affiliated group
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncOutsideGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 4b -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>4b</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Intercompany interest <br/>income - From tax <br/>affiliated group
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffldGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffldGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffldGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntIncAffldGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 5 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>5</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm">Other interest income
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncomeGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncomeGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncomeGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestIncomeGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 6 -->
						<tr valign="top" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>6</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Total interest income. Add<br/>lines 1 through 5 in columns a, b, c and d. Enter total 
							  on the applicable Schedule M-3. See instructions.
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncomeGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncomeGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncomeGrp/PermanentDifferenceAmt "/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestIncomeGrp/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</table>
					<!-- BEGIN Part lll Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:13mm;font-size:9pt;height:4.5mm">Part lll</div>
						<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:4mm;         height:4.5mm">Interest Expense</div>
					</div>
					<!-- END Part lll Title -->
					<!--start table-->
					<table class="styTable" id="IRS8916ATable" summary="Interest Expense [header]" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
						<tr valign="middle" style="height:7mm;">
							<th class="styIRS8916ALnNumCell">
								<span style="width:8.68mm;"/>
							</th>
							<th class="styTableThead" style="border-bottom:solid black 1px;border-right:solid black 1px;          width:45.39mm;text-align:center;font-size:8.5pt;font-weight:normal" scope="col">Interest Expense Item</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (a)</span>
								<br/>Expense per Income<br/>Statement<br/>
							</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS8916ATheadCellPt2" scope="col">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS8916ATheadCellPt2" style="border-right:0px;" scope="col">
								<span class="styBoldText">
                           (d)</span>
								<br/>Deduction per Tax Return<br/>
							</th>
						</tr>
					</table>
					<table class="styTable" id="IRS8916ATableData" summary="Interest Expense" cellspacing="0" cellpadding="0" style="font-size:8.5pt;width:187mm;">
						<!-- line 1 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>1</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Interest expense from <br/>hybrid securities
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExpenseGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExpenseGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExpenseGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HybridSecuritiesIntExpenseGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 2 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>2</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Lease/purchase interest<br/>expense
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpnsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpnsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpnsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LeasePurchaseInterestExpnsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 3a -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>3a</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm;">
							  Intercompany interest<br/>expense – Paid to outside<br/>tax affiliated group
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpnsOutsideGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpnsOutsideGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpnsOutsideGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpnsOutsideGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 3b -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>3b</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							  Intercompany interest<br/>expense – Paid to tax<br/>affiliated group
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntercompanyIntExpAffiliatdGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 4 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>4</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm">Other interest expense
            <!-- pushpin data -->
							</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpenseInfoGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpenseInfoGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpenseInfoGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterestExpenseInfoGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- line 5 -->
						<tr valign="middle" style="height:6mm;">
							<td class="styIRS8916ALnNumCell" style="padding-top:.5mm">
								<span style="width:1.5mm;"/>5</td>
							<td class="styIRS8916ATxCell" style="padding-top:.5mm;padding-bottom:.5mm">
							Total interest expense. <br/>
							Add lines 1 through 4 in <br/>
							columns a, b, c, and d. <br/>
							Enter total on the <br/>
							applicable Schedule M-3. <br/>
							See instructions. <br/>
                        	</td>
							<!-- col 1 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseInfoGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 2 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseInfoGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 3 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseInfoGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<!-- col 4 -->
							<td class="styIRS8916ACell" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseInfoGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
						</tr>
					</table>
					<!--  FOOTER-->
					<div style="width:187mm;border-top:1px solid black;">
						<span style="width:157mm;"/>  
                          Form <span style="font-size:8pt"><span class="styBoldText">8916-A</span></span> (2013)
                    </div>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>