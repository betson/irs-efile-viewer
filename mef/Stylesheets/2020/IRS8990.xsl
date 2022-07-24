<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;"> <!ENTITY mdash "&#8212;">]>
    <!-- Last Modified by Iskilu Lawal on 10/27/2020 UWR # 238414 Drop 3 R10.4 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8990Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8990" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 8990" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8990Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8990">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					
										<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:18pt;">8990</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<div class="" style="padding-top:.5mm;font-size:7pt;">Rev. May 2020</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Limitation on Business Interest Expense <br />
							Under Section 163(j)</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to your tax return.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8990</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div style="float:left;width:140mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							Taxpayer name(s) shown on tax return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="float:left;width:37mm;height:10mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<strong>Identification number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					
					<!-- Line comment 1 Start -->
					<div class="styStdDiv" style="border-top:1px solid black;height:20mm">
							
							<div style="float:left;clear;none;">
								
								<div class="styLNDesc">
									If Form 8990 relates to an information return for a foreign entity (for example, Form 5471), enter: 
																	</div>
								
															</div>
							<!-- Line comment 1 End -->
							<!-- Line comment 2 Start -->
							<div style="float:left;clear;none;">
								<div class="styLNDesc" style="width:31mm;">
									Name of foreign entity
																	</div>
								<div class="styLNRightNumBox" style="border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet" />
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:140mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</span>	
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:140mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</span>	
								</div>
								
							</div>
							<!-- Line comment 2 End -->
							
							<!-- Line comment 3 Start -->
							<div style="float:left;clear;none;">
								<div class="styLNDesc" style="width:50mm;">
									Employer identification number, if any
																	</div>
								<div class="styLNRightNumBox" style="border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet" />
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:120mm;">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
										</xsl:call-template>
									</span>	
								</div>
							</div>
							<!-- Line comment 3 End -->
																		
							<!-- Line comment 4 Start -->
							<div style="float:left;clear;none;">
								<div class="styLNDesc" style="width:50mm;">
									Reference ID number (see instructions) 
																	</div>
								<div class="styLNRightNumBox" style="border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet" />
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:121mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>	
								</div>
							</div>
							<!-- Line comment 4 End -->
							
						</div>
					
										
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Computation of Allowable Business Interest Expense</div>
					</div>
															
					<div class="sty8990InstructionLn">
						Part I is completed by all taxpayers subject to section 163(j). Schedule A and Schedule B need to be completed before Part I when the 
						taxpayer is a partner or shareholder of a pass-through entity subject to 163(j).
					</div>
					<div class="sty8990SectionLn">
						Section I &mdash; Business Interest Expense
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Current year business interest expense (not including floor plan financing <br /> interest expense), before the section 163(j) limitation
							<span class="sty8990DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYBusIntExpnsBfr163jLmtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Disallowed business interest expense carryovers from prior years. <br /> (Does not apply to a partnership)
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CfwdPrevDsallwIntExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Partner's excess business interest expense treated as paid or accrued <br /> in current year (Schedule A, line 44, column (h))
							<span class="sty8990DotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />3</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrtnrExBusIntExpnsPdAccrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Floor plan financing interest expense. See instructions 
							<span class="sty8990DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FlrPlanFinancingIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							<strong>Total business interest expense. </strong> Add lines 1 through 4 
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">..............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">5</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllowableBusIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990SectionLn">
						Section II &mdash; Adjusted Taxable Income
					</div>
					<div class="sty8990BlockLn" style="border-top-width:0px;">
						Taxable Income
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Taxable income. See instructions
							<span class="sty8990DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Additions <span style="font-weight:normal;">(adjustments to be made if amounts included on line 6)</span>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Any item of loss or deduction which is not properly allocable to a trade <br /> or business of the taxpayer. See instructions
							<span class="sty8990DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />7</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LossDeductionNotAllocableAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Any business interest expense not from a pass-through entity. See <br /> instructions
							<span class="sty8990DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusInterestExpnsNotPassThruAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:98mm;">
							Amount of any net operating loss deduction under section 172
							<span class="sty8990DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Sect172NOLTakenAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Amount of any qualified business income deduction allowed under <br /> section 199A
							<span class="sty8990DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />10</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Sect199AQlfyBusIncomeDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Deduction allowable for depreciation, amortization, or depletion <br /> attributable to a trade or business
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />11</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeprecAmortzDpltnDedTakenAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Amount of any loss or deduction items from a pass-through entity. <br /> See instructions
							<span class="sty8990DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />12</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PassThroughEntityLossDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:98mm;">
							Other additions. See instructions
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjTxblIncomeOtherAdditionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Total current year partner's excess taxable income (Schedule A, <br /> line 44, column (f))
							<span class="sty8990DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />14</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYPrtnrExcessTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Total current year S corporation shareholder's excess taxable <br /> income (Schedule B, line 46, column (c))
							<span class="sty8990DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />15</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYSCorpShrExcessTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 7 through 15 
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">.......................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">16</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Reductions <span style="font-weight:normal;">(adjustments to be made if amounts included on line 6)</span>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Any item of income or gain which is not properly allocable to a trade <br /> or business of the taxpayer. See instructions
							<span class="sty8990DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />17</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/IncmGainNotAllcblTradeBusAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:98mm;">
							Any business interest income not from a pass-through entity. See instructions
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/NotPassThruEntBusIntIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Amount of any income or gain items from a pass-through entity. <br /> See instructions
							<span class="sty8990DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />19</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/PassThroughEntityIncomeGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv" style="height:4.2mm;">
						<div class="styLNLeftNumBox" style="height:4.2mm;">20</div>
						<div class="styLNDesc" style="width:98mm;height:4.2mm;">
							Other reductions. See instructions
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.2mm;">20</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:4.2mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/AdjTxblIncmOtherReductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.2mm;">21</div>
						<div class="styLNDesc" style="height:4.2mm;">
							<strong>Total. </strong> Combine lines 17 through 20 
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">.....................&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.2mm;">21</div>
						<div class="styLNAmountBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotalReductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc">
							<strong>Adjusted taxable income. </strong> Combine lines 6, 16, and 21. (If zero or less, enter -0-.)
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">......&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">22</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37814C</span>
						<span style="float:right;">Form <strong>8990</strong> (Rev. 5-2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 8990 (Rev. 5-2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="sty8990SectionLn">
						Section III &mdash; Business Interest Income
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:98mm;">
							Current year business interest income. See instructions
							<span class="sty8990DotLn">......</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYBusinessInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Excess business interest income from pass-through entities (total of <br /> Schedule A, line 44, column (g) and Schedule B, line 46, column(d))
							<span class="sty8990DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />24</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPassThruEntExBusIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 23 and 24
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">........................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">25</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990SectionLn" style="border-top-width:1px;">
						Section IV &mdash; 163(j) Limitation Calculations
					</div>
					<div class="sty8990BlockLn" style="border-top-width:0px;">
						Limitation on Business Interest Expense
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							Multiply adjusted taxable income (line 22) by the applicable percentage. <br /> See instructions
							<span class="sty8990DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />26</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjTaxableIncomeApplcblPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="width:98mm;">
							Business interest income (line 25)
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">27</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="width:98mm;">
							Floor plan financing interest expense (line 4)
							<span class="sty8990DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">28</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FlrPlanFinancingIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 26, 27, and 28
							<span class="sty8990DotLn" style="padding-right:0px;margin-right:-4px;">.......................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">29</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBusIntExpnsLimitationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Allowable Business Interest Expense
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc">
							<strong>Total current year business interest expense deduction. </strong> See instructions
							<span class="sty8990DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB">30</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYBusinessIntExpnsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Carryfoward
					</div>
					<!-- Line 31 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc">
							<strong>Disallowed business interest expense. </strong> Subtract line 29 from line 5. (If zero or less, enter -0-.)
							<span class="sty8990DotLn">...</span>
						</div>
						<div class="styLNRightNumBoxNBB">31</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DisallowedBusInterestExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Partnership Pass-Through Items</div>
					</div>
					<div class="sty8990InstructionLn">
						Part II is only completed by a partnership that is subject to section 163(j). The partnership items below are allocated to the partners 
						and are not carried forward by the partnership. See the instructions for more information.
					</div>
					<div class="sty8990BlockLn">
						Excess Business Interest Expense
					</div>
					<!-- Line 32 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">32</div>
						<div class="styLNDesc">
							<strong>Excess business interest expense. </strong> Enter amount from line 31
							<span class="sty8990DotLn">.............</span>
						</div>
						<div class="styLNRightNumBoxNBB">32</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DisallowedBusInterestExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Excess Taxable Income <span style="font-weight:normal;"> (If you entered an amount on line 32, skip lines 33 through 37.)</span>
					</div>
					<!-- Line 33 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">33</div>
						<div class="styLNDesc">
							Subtract the sum of lines 4 and 25 from line 5. (If zero or less, enter -0-.)
							<span class="sty8990DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">33</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpExTxblIncmIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc">
							Subtract line 33 from line 26. (If zero or less, enter -0-.)
							<span class="sty8990DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">34</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpExcessTxblIncomeCalcAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">35</div>
						<div class="styLNDesc">
							Divide line 34 by line 26. Enter the result as a decimal. (If line 26 is zero, enter -0-.)
							<span class="sty8990DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">35</div>
						<div class="styLNAmountBox" style="font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpExcessTaxableIncomeRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc">
							<strong>Excess Taxable Income. </strong> Multiply line 35 by line 22
							<span class="sty8990DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">36</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrtshpExcessTxblIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Excess Business Interest Income
					</div>
					<!-- Line 37 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">37</div>
						<div class="styLNDesc" style="height:7mm;">
							Excess business interest income. Subtract the sum of lines 1, 2, and 3 from line 25. (If zero <br /> or less, enter -0-.)
							<span class="sty8990DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />37</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpExcessBusInterestIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">S Corporation Pass-Through Items</div>
					</div>
					<div class="sty8990InstructionLn">
						Part III is only completed by S corporations that are subject to section 163(j). The S corporation items below are allocated to the shareholders.
						See the instructions for more information.
					</div>
					<div class="sty8990BlockLn">
						Excess Taxable Income
					</div>
					<!-- Line 38 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">38</div>
						<div class="styLNDesc">
							Subtract the sum of lines 4 and 25 from line 5. (If zero or less, enter -0-.)
							<span class="sty8990DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">38</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SCorpExTxblIncmIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">39</div>
						<div class="styLNDesc">
							Subtract line 38 from line 26. (If zero or less, enter -0-.)
							<span class="sty8990DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">39</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SCorpExcessTxblIncomeCalcAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">40</div>
						<div class="styLNDesc">
							Divide line 39 by line 26. Enter the result as a decimal. (If line 26 is zero, enter -0-.)
							<span class="sty8990DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">40</div>
						<div class="styLNAmountBox" style="font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SCorpExcessTaxableIncomeRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">41</div>
						<div class="styLNDesc">
							<strong>Excess Taxable Income. </strong> Multiply line 40 by line 22
							<span class="sty8990DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">41</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotSCorpExcessTxblIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990BlockLn">
						Excess Business Interest Income
					</div>
					<!-- Line 42 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">42</div>
						<div class="styLNDesc" style="height:7mm;">
							Excess business interest income. Subtract the sum of lines 1, 2, and 3 from line 25. (If zero <br /> or less, enter -0-.)
							<span class="sty8990DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />42</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SCorpExcessBusInterestIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8990</strong> (Rev. 5-2020)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8990 (Rev. 5-2020)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:23mm;">SCHEDULE A</div>
						<div class="styPartDesc">Summary of Partner's Allocable Partnership Interest</div>
						<div style="float:right;width:5mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAllocablePrtshpIntGrp"/>
								<xsl:with-param name="containerID" select=" 'SchATable' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="6"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990InstructionLn" style="width:256mm;border-bottom:1px solid black;">
						Any taxpayer that owns an interest in a partnership and receives excess business interest expense allocated 
						from the partnership should complete Schedule A before completing Part I.
					</div>
					<!-- Line 43 table -->
					<xsl:variable name="shouldSeparateSchA" select="($Print = $Separated) and (count($FormData/PartnerAllocablePrtshpIntGrp) &gt; 6)"/>
					<div class="styTableContainerLandscapeNBB" id="SchATable">
						<xsl:call-template name="SetInitialState" />
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:7mm;border-right-width:0px;"> </th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:32mm;width:48mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> Name of partnership
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:19mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> EIN
									</th>
									<th class="styTableCellHeader" colspan="3" scope="colgroup" style="width:78mm;font-weight:normal;">
										Excess Business Interest Expense
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> Current year excess taxable income
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> Current year excess business interest income
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> Excess business interest expense treated as paid or accrued (lesser of (e) or (f) plus (g))
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:26mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(i) </span> Current year business interest carryover <br /> ((e) minus (h))
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> Current year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> Prior year carryover
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> Total <br /> ((c) plus (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSchA)">
									<xsl:for-each select="$FormData/PartnerAllocablePrtshpIntGrp">
										<tr style="vertical-align:top;height:7mm;">
											<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;border-bottom-width:0px;border-right-width:0px;">
												<xsl:if test="position() = 1">43</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PartnershipName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessBusinessIntExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PYExcessBusIntExpnsCfwdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotExcessBusInterestExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessBusinessIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessBusIntExpnsPaidAccrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessBusIntExpnsCfwdAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 1">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;border-bottom-width:0px;border-right-width:0px;">43</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerAllocablePrtshpIntGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 2">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 3">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 4">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 5">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchA or count($FormData/PartnerAllocablePrtshpIntGrp) &lt; 6">
									<tr style="vertical-align:top;height:7mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">44</div>
						<div class="styLNDesc" style="width:47.8mm;"><strong>Total</strong></div>
						<div class="styLNAmountBoxNBB" style="width:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:26.1mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYPrtnrExcessTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYPrtnrExcessBusIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrtnrExBusIntExpnsPdAccrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<xsl:if test="not($shouldSeparateSchA)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerAllocablePrtshpIntGrp"/>
							<xsl:with-param name="containerID" select=" 'SchATable' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="6"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="width:23mm;">SCHEDULE B</div>
						<div class="styPartDesc" style="width:220mm;">Summary of Shareholder's Excess Taxable Income and Excess Business Interest Income</div>
						<div style="float:right;width:5mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/ShrExTxblIncmBusIntIncmGrp"/>
								<xsl:with-param name="containerID" select=" 'SchBTable' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="5"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty8990InstructionLn" style="width:256mm;border-bottom:1px solid black;">
						Any taxpayer that is required to complete Part I and is a shareholder in an S corporation that has excess taxable income or 
						excess business interest income should complete Schedule B before completing Part I.
					</div>
					<!-- Line 45 table -->
					<xsl:variable name="shouldSeparateSchB" select="($Print = $Separated) and (count($FormData/ShrExTxblIncmBusIntIncmGrp) &gt; 5)"/>
					<div class="styTableContainerLandscapeNBB" id="SchBTable">
						<xsl:call-template name="SetInitialState" />
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="height:12mm;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:0px;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:115mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> Name of S corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> Current year excess <br /> taxable income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(d) </span> Current year excess <br /> business interest income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSchB)">
									<xsl:for-each select="$FormData/ShrExTxblIncmBusIntIncmGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;border-bottom-width:0px;border-right-width:0px;">
												<xsl:if test="position() = 1">45</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="SCorporationName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYExcessBusinessIntIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchB or count($FormData/ShrExTxblIncmBusIntIncmGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;border-bottom-width:0px;border-right-width:0px;">45</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/ShrExTxblIncmBusIntIncmGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchB or count($FormData/ShrExTxblIncmBusIntIncmGrp) &lt; 2">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchB or count($FormData/ShrExTxblIncmBusIntIncmGrp) &lt; 3">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchB or count($FormData/ShrExTxblIncmBusIntIncmGrp) &lt; 4">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSchB or count($FormData/ShrExTxblIncmBusIntIncmGrp) &lt; 5">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateSchB)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ShrExTxblIncmBusIntIncmGrp"/>
							<xsl:with-param name="containerID" select=" 'SchBTable' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">46</div>
						<div class="styLNDesc" style="width:114.95mm;"><strong>Total</strong></div>
						<div class="styLNAmountBoxNBB" style="width:23.95mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:55mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYSCorpShrExcessTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:55mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCYSCorpExcessBusIntIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8990</strong> (Rev. 5-2020)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					
					<!-- Sch A separated tables -->
					<xsl:if test="$shouldSeparateSchA">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A, Line 43 - Partner's Allocable Partnership Interest</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="2" scope="col" style="min-width:32mm;width:48mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> Name of partnership
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:19mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> EIN
									</th>
									<th class="styDepTblCell" colspan="3" scope="colgroup" style="width:78mm;font-weight:normal;">
										Excess Business Interest Expense
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> Current year excess taxable income
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> Current year excess business interest income
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> Excess business interest expense treated as paid or accrued (lesser of (e) or (f) plus (g))
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> Current year business interest carryover <br /> ((e) minus (h))
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> Current year
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> Prior year carryover
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> Total <br /> ((c) plus (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PartnerAllocablePrtshpIntGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PartnershipName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessBusinessIntExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PYExcessBusIntExpnsCfwdAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotExcessBusInterestExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessBusinessIntIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExcessBusIntExpnsPaidAccrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessBusIntExpnsCfwdAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch B separated tables -->
					<xsl:if test="$shouldSeparateSchB">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule B, Line 45 - Shareholder's Excess Taxable Income and Excess Business Interest Income</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:32mm;width:115mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> Name of S corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:55mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> Current year excess <br /> taxable income
									</th>
									<th class="styDepTblCell" scope="col" style="width:55mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(d) </span> Current year excess <br /> business interest income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ShrExTxblIncmBusIntIncmGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="SCorporationName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYExcessBusinessIntIncomeAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br /><br />
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
