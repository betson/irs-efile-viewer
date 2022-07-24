<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6251Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS6251"/>
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
				<meta name="Description" content="IRS Form 6251"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS6251Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form6251">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1.5px;">
						<div class="styFNBox" style="width:31mm;height:20mm;padding:bottom:0mm;border-right-width:1.5px;">
                         Form<span style="width:1mm;"/>
							<span class="styFormNumber">6251</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:2mm;padding:bottom:0mm;">
								Department of the Treasury<br/>
								Internal Revenue Service (99)
							</div>
						</div>
						<div class="styFTBox" style="width:124mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;padding-bottom:0mm;">
								Alternative Minimum Tax&#8212;Individuals
						    </div>
							<div class="styFBT" style="font-size:7pt;height:5mm;padding-top:6mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> 
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form6251" title="Link to IRS.gov"><i>www.irs.gov/Form6251</i></a> for instructions and the latest information.<br/>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040,  Form 1040-SR, or Form 1040NR . 
						  </div>
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:1.5px;">
							<div class="styOMB" style="width:30mm;height:4mm;border-bottom:1 solid black;font:7pt;">OMB No. 1545-0074</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">19</span>
								</span>
							</div>
							<div class="stySequence" style="padding-top:1mm;">Attachment<br/>Sequence No. <b style="font-size:8pt">32</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm;height:9mm;padding-top:.25mm;">
							Name(s) shown on Form 1040, Form 1040-SR, or Form 1040NR<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="line-height:100%;padding: .25mm 0mm 0mm 1.5mm;">
							<b>Your social security number</b>
							<br/>
							<span style="padding: .5mm 0mm 0mm .25mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;padding-top:0mm;">
						<div class="styPartName" style="height:4mm;font-size:8.5pt;">Part l</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Alternative Minimum Taxable Income</b> (See instructions for how to complete each line.)
						</div>
					</div>
					<!-- End Part I Header -->
					<!-- Part I body -->
					<div style="width:187mm;border-bottom:1px solid black;float:left;">
						<!-- Line 1 -->
						<div style="width:187mm;height:10mm">
                                        <div class="styLNLeftNumBox" style="font-size:7pt;height:mm;padding-bottom:0mm;padding-left: 3mm;">1</div>
                                        <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                                           Enter the amount from Form 1040 or 1040-SR, line 11b, if more than zero.  If Form 1040 or 1040-SR, line 11b, is zero, subtract lines 9
                                                and 10 of Form 1040 or 1040-SR from line 8b of Form 1040  or 1040-SR and enter the result here. (If less than zero, enter as a
                                            negative amount.)
                                               <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........</span>
                                       </div>
                                       <div class="styLNRightNumBox" style="height:10mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:7mm">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:7mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AGIOrAGILessDeductionAmt"/>
								</xsl:call-template>
							</div>
                         </div>
						<!--<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm;">1
                            </div>
                            <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								Enter the amount from Form 1040, Form 1040-SR, line 10, if more than zero. If Form 1040, line 10, is zero, subtract lines 
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							
                            <div class="styLNDesc" style="padding-left:6mm;font-size:7pt;width:143mm;height:4mm;padding-bottom:0mm;padding-left:8mm">
							  8 and 9 of Form 1040 from line 7 of Form 1040 and enter the result here. (If less than zero, enter as a
                            </div>
                            
                           <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							 <div class="styLNDesc" style="padding-left:8mm;font-size:7pt;width:143mm;height:4mm;padding-bottom:0mm;">
							   negative amount.)
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
                            </div>
                          
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AGIOrAGILessDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>-->

					
						<!-- Line 2a -->
							<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm;">2a
                            </div>
                            <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								If filing Schedule A (Form 1040 or 1040-SR), enter the taxes from Schedule A, line 7; otherwise, enter the amount  from Form 1040 , line 9 
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							
                            <div class="styLNDesc" style="padding-left:6mm;font-size:7pt;width:143mm;height:4mm;padding-bottom:0mm;padding-left:8mm">
							          
							 
                            </div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2a</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleATaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						
                         
						
						<!-- Line 2b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4.25mm;padding-bottom:0mm;padding-left: 4.5mm">b
              </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4.25mm;padding-bottom:0mm;">
								<span style="float:left">Tax refund from Schedule 1 (Form 1040 or 1040-SR) line 10 or line 21</span>
								
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.25mm;padding-top:.75mm;padding-bottom:0mm;bottom-border-width:1px;">2b</div>
							<div class="styLNAmountBox" style="width:36mm;height:4.25mm;padding-top:.75mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">c
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Investment interest expense (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2c</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">d
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Depletion (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2d</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">e
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Net operating loss deduction from Schedule 1 (Form 1040 or 1040-SR), line 21. Enter as a positive amount</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2e</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2f -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">f
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Alternative tax net operating loss deduction</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2f</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/AltTaxNetOperatingLossDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2g -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">g
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Interest from specified private activity bonds exempt from the regular tax</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2g</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptPrivateActivityBondsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2h -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">h
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Qualified small business stock, see instructions</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2h</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Section1202ExclusionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2i -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">i
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Exercise of incentive stock options (excess of AMT income over regular tax income)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2i</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncentiveStockOptionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2j -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">j
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Estates and trusts (amount from Schedule K-1 (Form 1041), box 12, code A)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2j</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2k -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">k
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Disposition of property (difference between AMT and regular tax gain or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2k</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PropertyDispositionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2l -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">l
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Depreciation on assets placed in service after 1986 (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2l</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2m -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">m
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Passive activities (difference between AMT and regular tax income or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2m</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PassiveActivityAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2n -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">n
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Loss limitations (difference between AMT and regular tax income or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2n</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LossLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2o -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">o
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Circulation costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2o</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CirculationCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2p -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">p
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Long-term contracts (difference between AMT and regular tax income)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2p</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LongTermContractAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2q -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">q
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Mining costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2q</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MiningCostsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2r -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">r
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Research and experimental costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2r</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ResearchExperimentalCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2s -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">s
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Income from certain installment sales before January 1, 1987</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2s</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/InstallmentSaleIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2t -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.5mm">t
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Intangible drilling costs preference</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2t</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntangibleDrillingCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Other adjustments, including income-based related adjustments</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RelatedAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<b>Alternative minimum taxable income.</b> Combine lines 1 through 3. (If married filing separately and
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">line 4 is more than $733,700, see instructions.)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4 - Residual Interest In REMIC Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none">4</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part ll -->
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4.55mm;padding-top:0mm;border-top:1.2px solid black;border-bottom:1px solid black;float:left;">
						<div class="styPartName" style="height:4.25mm;font-size:8.5pt;">Part ll</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Alternative Minimum Tax (AMT)</b>
						</div>
					</div>
					<!-- END Part ll Header-->
					<!-- Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;padding-left: 3mm;font-size:7pt;">5</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;font-size:7pt;">
							Exemption. (If you were under age 24 at the end of 2019, see instructions.)
					    </div>
						<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
					</div>
					<div style="width:187mm;">
						<div style="float:left;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:21mm;padding-left: 2.25mm"/>
						</div>
						<div style="float:left;font-size:7pt;width:127mm;height:21mm;padding-top:.5mm;">
 							<span style="font-weight:bold;">
								<span class="styLNDesc" style="font-size:7pt;width:56mm;height:4mm;">
									IF your filing status is...
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;">
									AND line 4 is not over...
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;">
									THEN enter on line 5...
								</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:55mm;height:4mm;">
									Single or head of household<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">....</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;padding-left:1mm;">
								     <span style="width:4mm;padding-right:2mm;">$</span>
									510,300<span style="letter-spacing:3mm;font-weight:bold;padding-left:5mm;">....</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:1.5mm;">
								    <span style="width:4mm">$</span>
								<span style="width:10mm;padding-right:2mm"> 71,700 </span>	     
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:55mm;height:4mm;">
									Married filing jointly or qualifying widow(er)
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;padding-left:6mm;">
									1,020,600<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">...</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:3mm;">
									<span style="width:10mm;padding-left:2.5mm;">111,700</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:55mm;height:4mm;">
									Married filing separately<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">.....</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;padding-left:6mm;">
									510,300<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">....</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:3mm;">
								<span style="width:10mm;padding-left:2.5mm;"> 55,850</span> 
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;">
									If line 4 is <b>over</b> the amount shown above for your filing status, see instructions.
								</span>
						</div>
						<div style="float:left;width:3mm;height:13mm;padding-top:8mm;padding-right:1mm;">
							<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif"/>
						</div>
						<div style="float:left;width:5mm;padding-top:14mm;padding-right:2mm;">
							<span style="letter-spacing:3mm;font-weight:bold;">..</span>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:14mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:14mm;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-top:.5mm;padding-bottom:0mm;">5</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxExemptAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">						
							<div class="styLNRightNumBox" style="height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0;padding-left: 3mm">6</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							 Subtract line 5 from line 4. If more than zero, go to line 7. If zero or less, enter -0- here and on
                        </div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left"> lines 7, 9 and 11, and go to line 10</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 6 - RPI Special Processing Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">6</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;height:30mm;">
						<div style="float:left;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-left: 3mm;">7</div>
						</div>
						<div style="float:left;font-size:7pt;width:125mm;height:28mm;padding-top:.7mm;">
						   &#8226; <span style="width:120mm;height:4mm;">If you are filing Form 2555, see instructions for the amount to enter.</span><br/>
						   
                           <span style="width:125mm;height:3mm;"> &#8226;     If you reported capital gain distributions directly on Form 1040 or 1040-SR, line 6;</span>
                           <span style="width:125mm;padding-left:2mm">you reported qualified dividends on Form 1040 or 1040-SR, line 3a; <b>or</b> you had a gain on </span>
                           <span style="width:125mm;padding-left:2mm"> both lines 15 and 16 of Schedule D (Form 1040 or 1040-SR) (as refigured for the AMT, </span>
                           <span style="width:125mm;padding-left:2mm">if necessary), complete Part III on the back and enter the amount from line 40 here.</span>
                           <span style="width:10mm;height:2mm;"/>
                            <span style="width:125mm;height:3mm;padding-top:2mmheight:4mm;"> &#8226;    <b>All others:</b> If line 6 is $194,800 or less ($97,400 or less if married filing separately), multiply.</span>
                            <span style="width:125mm;padding-left:2mm">line 6 by 26% (0.26). Otherwise, multiply line 6 by 28% (0.28) and subtract $3,896 ($1,948) </span>
                            <span style="width:125mm;padding-left:2mm">if married filing separately) from the result. </span>
					
						</div>
						<div style="float:left;width:5mm;height:28mm;padding-top:3mm;">
							<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_lg.gif"/>
						</div>
						<div style="float:left;width:5mm;height:28mm;padding-top:8.5mm;">
							<span style="letter-spacing:2mm;font-weight:bold;">..</span>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:8mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:8mm;"/>
							<div class="styLNRightNumBox" style="clear:left;height:5mm;padding-top:2mm;padding-bottom:0mm;text-align:bottom">7</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-top:2mm;padding-bottom:0mm;text-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnAltMinTaxableIncAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">							
							<div class="styLNRightNumBox" style="clear:left;height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:17mm;"/>
						</div>						
					</div>					
					<!-- Line 8 -->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm">8</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Alternative minimum tax foreign tax credit (see instructions)</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
						</div>
						<div style="float:right;">						
						<div class="styLNRightNumBox" style="clear:left;height:5mm;padding-bottom:0mm;bottom-border-width:0px;padding-top:2mm;text-align:bottom">8</div>
						<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:0px;padding-top:2mm;text-align:bottom;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>						
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 3mm">9
					</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Tentative minimum tax. Subtract line 8 from line 7</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:5mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:2mm;text-align:bottom">9</div>
						<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:2mm;text-align:bottom;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeAlternativeMinTaxAmt"/>
							</xsl:call-template>
						</div>
						</div>						
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;height:13mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:11mm;padding-left:3mm;width:8mm;">10</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:11mm;float:left;">
							 Add Form 1040 or 1040-SR, line 12a  (minus any tax from Form 4972), and Schedule 2 (Form 1040 or 1040-SR), line 2.  Subtract from the result 
							 any foreign tax credit from Schedule 3 (Form 1040 or 1040-SR), line 1. If you used Schedule J to figure your tax on Form 1040 or 1040-SR,
							 line 12a, refigure that tax without using Schedule J before completing this line (see instructions)
						  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:1mm;">........</span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:6mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
						<div class="styLNAmountBox" style="height:6mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="clear:left;width:8mm;height:7mm;padding-top:4mm;padding-bottom:0mm;">10</div>
						<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedRegularTaxAmt"/>
							</xsl:call-template>
						</div>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;height:7.5mm;border-bottom:1.5px solid black;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-bottom:0mm;padding-left: 3mm">11</div>
						<div class="styLNDesc" style="height:4.5mm;font-size:7pt;width:134.9mm;padding-bottom:0mm;">
							<span style="float:left">
								<b>AMT.</b> Subtract line 10 from line 9. If zero or less, enter -0-. Enter here and on Schedule 2 (Form 1040 or 1040-SR), line 1
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>	
                           </span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:none;">11</div>
						<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>	
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:13mm;"/>                        
							  Cat. No. 13600G
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
								  Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2019)
						</div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 6251 (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part IlI - Header -->
					<div style="width:187mm;height:8.5mm;border-bottom:1px solid black;border-top:1px solid black;float:left;">
						<div class="styPartName" style="height:4mm;font-size:8.5pt;">Part lll</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Tax Computation Using Maximum Capital Gains Rates</b>
							<br/>
							<span style="font-size:7.5pt;font-family:arial;">
							 Complete Part III only if you are required to do so by line 7 or by the Foreign Earned Income Tax Worksheet in the instructions.
					  </span>
						</div>
					</div>
					<!-- END Part llI Header-->
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">12</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the amount from Form 6251, line 6. If you are filing Form 2555,  enter the amount<br/>
						from line 3 of the worksheet in the instructions for line 7
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">12</div>
						<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReportedAltMinTaxableIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1.25mm;padding-bottom:0mm;padding-left:3mm;">13</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
					  Enter the amount from line 6 of the Qualified Dividends and Capital Gain Tax Worksheet in the
					  Instructions for Form 1040 and 1040-SR or the amount from line 13 of the Schedule D Tax Worksheet in
     				  the Instructions for Schedule D (Form 1040 or 1040-SR), whichever applies (as refigured for the AMT,<br/>
     				  if necessary) (see instructions). If you are filing Form 2555, see instructions for the<br/>
     				  amount to enter 
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top:14mm;padding-bottom:0mm;border-bottom:1px solid black;">13</div>
						<div class="styLNAmountBox" style="width:36mm;height:17mm;padding-top:14mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsWorksheetAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:.5mm;padding-bottom:0mm;padding-left:3mm;">14</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
					  Enter the amount from Schedule D (Form 1040 or 1040-SR), line 19 (as refigured for the AMT, if necessary)
					  (see instructions). If you are filing Form 2555, see instructions for the amount to enter
					  <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>					  
					</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">14</div>
						<div class="styLNAmountBox" style="width:36mm;height:7.5mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1.25mm;padding-bottom:0mm;padding-left:3mm;">15</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
					  If you did not complete a Schedule D Tax Worksheet for the regular tax or the AMT, enter the amount<br/>
					  from line 13. Otherwise, add lines 13 and 14, and enter the <b>smaller</b> of that result or the amount from<br/> 
     				  line 10 of the Schedule D Tax Worksheet (as refigured for the AMT, if necessary). If you are filing<br/>
     				  Form 2555, see instructions for the amount to enter 
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:13.5mm;padding-top:10.5mm;padding-bottom:0mm;border-bottom:1px solid black;">15</div>
						<div class="styLNAmountBox" style="width:36mm;height:13.5mm;padding-top:10.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumPlusUnrecapturedSect1250Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">16</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 12 or line 15
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">16</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerOfAltMinTxblIncOrSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">17</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 16 from line 12
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">17</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjAltMinTaxableIncLessGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">18</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						 If line 17 is $194,800  or less ($97,400 or less if married filing separately), multiply line 17 by 26%<br/>
						(0.26). Otherwise, multiply line 17 by 28% (0.28) and subtract $3,896 ($1,948 if married filing<br/>
						separately) from the result 
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">.......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:1px solid black;">18</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAdjAltMinTxblIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div style="width:187mm;">
					<div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 3mm;padding-top:1mm;">19</div>
		 			  <div style="float:left;">	
							<div class="styLNDesc" style="font-size:7pt;width:100mm;padding-top:1mm;">
							  Enter:<br/>
								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$78,750 if married filing jointly or qualifying widow(er),<br/>
 								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$39,375 if single or married filing separately, or<br/>
								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$52,750 if head of household.
							</div>
					  </div>								
						    <div style="float:left;margin-top:3mm;">							
								<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif"/>	
								<span style="float:right;text-align:right;letter-spacing:3.3mm;font-weight:bold;margin:6mm 2mm 0mm 1mm;">.......</span>
							</div>					
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNAmountBox" style="height:8mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>							
							<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.75mm;padding-bottom:0mm;">19</div>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingStatusLimitAmt"/>
								</xsl:call-template>
							</div>						
							<div class="styLNRightNumBox" style="width:8.25mm;height:5mm;border-right-width:1px;border-bottom:0;clear:left;"/>
						</div>
					</div>
					<!-- Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-top:0mm;padding-bottom:0mm;padding-left:3mm;">20</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
					  Enter the amount from line 7 of the Qualified Dividends and Capital Gain Tax Worksheet <br/> 
					  or the amount from line 14 of the Schedule D Tax Worksheet, whichever applies (as figured for the regular tax).
					  If you did not complete either worksheet for the regular tax, enter the amount from Form 1040 or 1040-SR, line 11b;
                      if zero or less, enter -0-. If you are filing Form 2555, see instructions for the  amount to enter
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:0mm;">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:19mm;padding-top:16mm;padding-bottom:0mm;border-bottom:1px solid black;">20</div>
						<div class="styLNAmountBox" style="width:36mm;height:19mm;padding-top:16mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeAboveThresholdWorkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">21</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 20 from line 19. If zero or less, enter -0-
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">21</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FSAmtLessIncAboveThresholdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">22</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 12 or line 13
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">22</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrOfAdjustedAltMinOrSchDAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">23</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 21 or line 22. This amount is taxed at 0%
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">23</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrAbvThrshldOrAltMinGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">24</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 23 from line 22
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">24</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrNetAdjAltMinOrNetGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div style="width:187mm;">
					<div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 3mm;padding-top:1mm;">25</div>
		 			  <div style="float:left;">	
							<div class="styLNDesc" style="font-size:7pt;width:100mm;padding-top:1mm;">
							  Enter:<br/>
								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$434,550 if single<br/>
 								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$244,425 if married filing separately<br/>
								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$488,850 if married filing jointly or qualifying widow(er)<br/>
								&#8226;<span style="margin:3mm 0mm 0mm .5mm;"/>$461,700 if head of household								
							</div>
					  </div>								
						    <div style="float:left;margin-top:5mm;">							
								<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif"/>	
								<span style="float:right;text-align:right;letter-spacing:3.3mm;font-weight:bold;margin:4mm 2mm 0mm 1mm;">.......</span>
							</div>					
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNAmountBox" style="height:8mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>							
							<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.75mm;padding-bottom:0mm;">25</div>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingThresholdAmt"/>
								</xsl:call-template>
							</div>						
							<div class="styLNRightNumBox" style="width:8.25mm;height:7mm;border-right-width:1px;border-bottom:0;clear:left;"/>
						</div>
					</div>					
					<!-- Line 26 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">26</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Enter the amount from line 21
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">26</div>
						<div class="styLNAmountBox" style="width:36mm;height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FSAmtLessIncAboveThresholdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:2mm;padding-bottom:0mm;padding-left:3mm;">27</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:2mm;padding-bottom:0mm;">
						Enter the amount from line 7 of the Qualified Dividends and Capital Gain Tax Worksheet or the <br/> 
						amount from line 21 of the Schedule D Tax Worksheet, whichever applies (as figured for the regular tax). 
                        If you did not complete either worksheet for the regular tax, enter the amount from Form 1040 or 1040-SR, 
                        line 11b; if zero or less, enter -0-. If you are filing Form 2555, see instructions for the amount to enter
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm;padding-bottom:0mm;border-bottom:1px solid black;">27</div>
						<div class="styLNAmountBox" style="width:36mm;height:18mm;padding-top:14.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCapGainsOrSchDWrkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">28</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Add line 26 and line 27
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">28</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumThresholdApplcblWrkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">29</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Subtract line 28 from line 25. If zero or less, enter -0-
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">29</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FlngThrshldLessThesholdSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">30</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Enter the smaller of line 24 or line 29
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">30</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrAdjNetGainOrTxblIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">31</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Multiply line 30 by 15% (0.15)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">31</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 32 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">32</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Add lines 23 and 30
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">32</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfSmllrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-weight:bold;font-size:6.75pt;width:135mm;height:4mm;padding-bottom:0mm;">
						If lines 32 and 12 are the same, skip lines 33 through 37 and go to line 38. Otherwise, go to line 33.
					</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
					</div>
					</div>
					<!-- Line 33 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">33</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Subtract line 32 from line 22
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">33</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">34</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Multiply line 33 by 20% (0.20)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">34</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-weight:bold;font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							 If line 14 is zero or blank, skip lines 35 through 37 and go to line 38. Otherwise, go to line 35.
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
						</div>
					</div>
					<!-- Line 35 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">35</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Add lines 17, 32, and 33
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">35</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">36</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 35 from line 12
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">36</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmallerSchDOrAdjNetGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">37</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Multiply line 36 by 25% (0.25)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">37</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSchDOrAdjNetGainTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">38</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Add lines 18, 31, 34, and 37
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">38</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfAltMinTaxPercentagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">39</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						If line 12 is $194,800 or less ($97,400 or less if married filing separately), multiply line 12 by 26% <br/>
						(0.26). Otherwise, multiply line 12 by 28% (0.28) and subtract $3,896 ($1,948 if married filing<br/>
						separately) from the result
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm;padding-bottom:0mm;border-bottom:1px solid black;">39</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:6.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTxblIncTimesFSPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div style="width:187mm;border-bottom:1.5px black solid">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:3mm;">40</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 38 or line 39 here and on line 7. If you are filing Form 2555, <br/>
						do not enter this amount on line 7. Instead, enter it on line 4 of the worksheet in the instructions for<br/>
						line 7
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:none;">40</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnAlternativeMinimumGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;text-align:right;margin-top:.5mm;">
          Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2019)
          </div>
					<!-- END Page Break and Footer-->
					<div class="pageEnd"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 4 - Residual Interest In REMIC Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 6 - RPI Special Processing Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
