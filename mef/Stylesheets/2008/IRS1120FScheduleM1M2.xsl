<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120FScheduleM1M2Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleM1M2"/>
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
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS1120FScheduleM1M2"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FScheduleM1M2Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120FScheduleM1M2">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!--Begin Header-->
					<div class="styTBB" style="width:187mm;">
						<table cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<!--Form Number-->
									<th rowspan="2" class="sty1120FSchM1M2FNBox" style="width:36mm" scope="col">
                  SCHEDULES M-1 and M-2
                  <br/>
                  (Form 1120-F)
                  <br/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<div class="styAgency" style="font-weight:normal;font-family: 'Arial'">Department of the Treasury</div>
										<div class="styAgency" style="font-weight:normal;font-family: 'Arial'">Internal Revenue Service</div>
									</th>
									<!--Form Name-->
									<th rowspan="2" class="styFTBox" style="width:119mm;font-size:7pt" scope="col">
										<div class="styMainTitle">
                    Reconciliation of Income (Loss) and Analysis of
                    Unappropriated Retained Earnings per Books
                  </div>
										<div class="styFST" style="padding-top:0.5mm;padding-bottom:0.5mm">
											<img src="{$ImagePath}/1120FScheduleM1M2_Bullet.gif" alt="Bullet Image"/>
                    Attach to Form 1120-F.
                  </div>
									</th>
									<!--OMB/Tax Year-->
									<th class="sty1120FSchM1M2OMB" style="width:32mm" scope="col">
                    OMB No. 1545-0126
                </th>
								</tr>
								<tr>
									<td class="sty1120FSchM1M2TY">
                  20<span class="styTYColor">08</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--End header-->
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
            Name of corporation
            <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--End Name/EIN-->
					<!--Begin Schedule M-1-->
					<!--Begin Sch M-1 Header-->
					<div class="styBB" style="width:187mm;height:8mm">
						<div class="styPartName" style="width:24mm;margin-top:2mm;margin-bottom:2mm">Schedule M-1</div>
						<div class="stypartDesc" style="width:150mm;padding-top:0.5mm;font-weight:normal">
							<b>Reconciliation of Income (Loss) per Books With Income per Return<br/>
            Note:</b> Schedule M-3 may be required instead of Schedule M-1&#8212;see instructions.
          </div>
					</div>
					<!--Begin Sch M-1 Table-->
					<div class="styBB" style="width:187mm">
						<!--Left Side (Lines 1 - 6)-->
						<div class="styBB" style="width:93.6mm;float:left;clear:none;border-right-width:1px">
							<!--Line 1-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">1</div>
							<div class="styLNDesc" style="width:53.3mm">Net income (loss) per books<span class="sty1120FSchM1M2DotLn" style="padding-left:3.7mm">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/M1NetIncomeLossPerBooks"/>
								</xsl:call-template>
							</div>
							<!--Line 2-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">2</div>
							<div class="styLNDesc" style="width:53.3mm">Federal income tax per books<span class="sty1120FSchM1M2DotLn" style="padding-left:2mm">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxPerBooks"/>
								</xsl:call-template>
							</div>
							<!--Line 3-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">3</div>
							<div class="styLNDesc" style="width:53.3mm;font-size:6pt">Excess of capital losses over capital gains<span class="sty1120FSchM1M2DotLn" style="padding-left:4.6mm;font-size:7pt">.</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessOfCapLossesOverCapGains"/>
								</xsl:call-template>
							</div>
							<!--Line 4-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:4.25mm">4</div>
							<div class="styLNDesc" style="width:53.3mm;height:4.25mm">Income subject to tax not recorded on </div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:4.25mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:4.25mm"/>
							<div class="styLNDesc" style="width:35.3mm;float:left;clear:none;height:4.25mm">books this year (itemize):</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:15.5mm;height:4.25mm"/>
							<div style="width:2.5mm;float:left;clear:none;height:4.25mm"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:4.25mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableIncomeNotRecOnBks"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableIncomeNotRecOnBks"/>
								</xsl:call-template>
							</div>
							<!--Line 5-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:8mm">5</div>
							<div class="styLNDesc" style="width:53.3mm">Expenses recorded on books this year not deducted on this return (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 5a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">a</div>
							<div class="styLNDesc" style="width:25mm">
              Depreciation<span class="sty1120FSchM1M2DotLn" style="padding-left:3.5mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:26mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepreciationExpenses"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<!--Line 5b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">b</div>
							<div class="styLNDesc" style="height:8mm;width:25mm">
              Charitable contributions<span class="sty1120FSchM1M2DotLn" style="padding-left:3mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:26mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsExpense"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 5c-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">c</div>
							<div class="styLNDesc" style="height:8mm;width:25mm">
              Travel and entertainment<span class="sty1120FSchM1M2DotLn" style="padding-left:1.8mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:26mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TravelEntertainment"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 5d-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">d</div>
							<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:26mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherExpenses"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExpensesNotDeducted"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExpensesNotDeducted"/>
								</xsl:call-template>
							</div>
							<!--Line 6-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:5mm;clear:left">6</div>
							<div class="styLNDesc" style="width:53.3mm;height:5mm">Add lines 1 through 5<span class="sty1120FSchM1M2DotLn" style="padding-left:4.7mm">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0;height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeExpensesSubtotal"/>
								</xsl:call-template>
							</div>
							<!--End Left Side (Lines 1 - 6)-->
						</div>
						<!--Right Side (Lines 7 - 10)-->
						<div class="styBB" style="width:93.4mm;float:left;clear:none;border-left-width:0">
							<!--Line 7-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:8mm">7</div>
							<div class="styLNDesc" style="width:53.3mm">Income recorded on books this year not included on this return (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 7a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">a</div>
							<div class="styLNDesc" style="height:8mm;width:25mm">
              Tax-exempt interest<span class="sty1120FSchM1M2DotLn" style="padding-left:9.8mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:25.8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterest"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 7b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">b</div>
							<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:25.8mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInterest"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeRecordedNotIncluded"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.7mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeRecordedNotIncluded"/>
								</xsl:call-template>
							</div>
							<!--Line 8-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:8.5mm">8</div>
							<div class="styLNDesc" style="width:53.2mm;height:8.5mm">Deductions on this return not charged against book income this year (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:8.5mm">
								<span style="width:1px"/>
							</div>
							<!--Line 8a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">a</div>
							<div class="styLNDesc" style="width:25.2mm">
              Depreciation<span class="sty1120FSchM1M2DotLn" style="padding-left:3.5mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:25.7mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepreciationDeduction"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<!--Line 8b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">b</div>
							<div class="styLNDesc" style="height:8mm;width:25.2mm">
              Charitable contributions<span class="sty1120FSchM1M2DotLn" style="padding-left:3mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:25.7mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDed"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 8c-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">c</div>
							<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:25.8mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsNotCharged"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.7mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsNotCharged"/>
								</xsl:call-template>
							</div>
							<!--Line 9-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">9</div>
							<div class="styLNDesc" style="width:53.2mm">Add lines 7 and 8<span class="sty1120FSchM1M2DotLn" style="padding-left:2.5mm">.......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeDeductionsSubtotal"/>
								</xsl:call-template>
							</div>
							<!--Line 10-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0;height:5mm">10</div>
							<div class="styLNDesc" style="width:53.2mm;height:5mm">Income&#8212;line 6 less line 9<span class="sty1120FSchM1M2DotLn" style="padding-left:3.2mm">....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0;height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Income"/>
								</xsl:call-template>
							</div>
							<!--End Right Side (Lines 7 - 10)-->
						</div>
						<!--End Sch M-1 Table-->
					</div>
					<!--END Schedule M-1-->
					<!--BEGIN Schedule M-2-->
					<!--Schedule M-2 Header-->
					<div class="styBB" style="width:187mm;height:8mm">
						<div class="styPartName" style="width:24mm;margin-top:2mm;margin-bottom:2mm">Schedule M-2</div>
						<div class="styPartDesc" style="width:150mm;padding-top:2mm">
            Analysis of Unappropriated Retained Earnings per Books per Return
          </div>
					</div>
					<!--Begin Schedule M-2 Table-->
					<div class="styBB" style="width:187mm">
						<!--Left Side (Lines 1 - 4)-->
						<div class="styBB" style="width:93.6mm;float:left;clear:none;border-right-width:1px">
							<!--Line 1-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">1</div>
							<div class="styLNDesc" style="width:53.3mm">Balance at beginning of year<span class="sty1120FSchM1M2DotLn" style="padding-left:3.7mm">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceBOY"/>
								</xsl:call-template>
							</div>
							<!--Line 2-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">2</div>
							<div class="styLNDesc" style="width:53.3mm">Net income (loss) per books<span class="sty1120FSchM1M2DotLn" style="padding-left:3.7mm">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/M2NetIncomeLossPerBooks"/>
								</xsl:call-template>
							</div>
							<!--Line 3-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">3</div>
							<div class="styLNDesc" style="width:36.3mm">Other increases (itemize):</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:14.5mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncreases"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncreases"/>
								</xsl:call-template>
							</div>
							<!--Line 4-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:4.7mm">4</div>
							<div class="styLNDesc" style="width:53.3mm;height:4.7mm">Add lines 1, 2, and 3<span class="sty1120FSchM1M2DotLn" style="padding-left:1.8mm">......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0;height:4.7mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceIncomeOtherIncreases"/>
								</xsl:call-template>
							</div>
							<!--End Left Side (Lines 1 - 4)-->
						</div>
						<!--Right Side (Lines 5 - 8)-->
						<div class="styBB" style="width:93.4mm;float:left;clear:none;border-left-width:0">
							<!--Line 5a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">5</div>
							<div class="styLNDesc" style="width:19.2mm;float:left;clear:none">Distributions:</div>
							<div class="styLNDesc" style="width:33.9mm">
								<b>a</b> Cash<span class="sty1120FSchM1M2DotLn" style="padding-left:1.4mm">......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CashDistribution"/>
								</xsl:call-template>
							</div>
							<!--Line 5b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div style="width:19.2mm;float:left;clear:none"/>
							<div class="styLNDesc" style="width:33.9mm">
								<b>b</b> Stock<span class="sty1120FSchM1M2DotLn" style="padding-left:4.4mm">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StockDistribution"/>
								</xsl:call-template>
							</div>
							<!--Line 5c-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div style="width:19.2mm;float:left;clear:none"/>
							<div class="styLNDesc" style="width:33.9mm">
								<b>c</b> Property<span class="sty1120FSchM1M2DotLn" style="padding-left:1.1mm">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PropertyDistribution"/>
								</xsl:call-template>
							</div>
							<!--Line 6-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">6</div>
							<div class="styLNDesc" style="width:37.3mm">Other decreases (itemize):</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:13.5mm"/>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style=";border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherDecreases"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherDecreases"/>
								</xsl:call-template>
							</div>
							<!--Line 7-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left">7</div>
							<div class="styLNDesc" style="width:53.3mm">Add lines 5 and 6<span class="sty1120FSchM1M2DotLn" style="padding-left:2.6mm">.......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DistributionsOtherDecreases"/>
								</xsl:call-template>
							</div>
							<!--Line 8-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:4.5mm">8</div>
							<div class="styLNDesc" style="width:53.3mm;font-size:6pt;height:4.5mm">Balance at end of year (line 4 less line 7)<span class="sty1120FSchM1M2DotLn" style="padding-left:1.3mm;font-size:7pt">..</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0;height:4.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceEOY"/>
								</xsl:call-template>
							</div>
							<!--End Right Side (Lines 5 - 8)-->
						</div>
						<!--End Schedule M-2 Table-->
					</div>
					<!--Begin Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="width:75mm;" class="styGenericDiv">
							<b>For Privacy Act and Paperwork Reduction Act Notice,<br/>see the Instructions for Form 1120-F.</b>
						</div>
						<div style="width:50mm;text-align:center;padding-left:2mm" class="styGenericDiv">Cat. No. 49678K</div>
						<div style="float:right;" class="styGenericDiv">
							<b>Schedules M-1 and M-2 (Form 1120-F) 2008</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Footer-->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
