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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
		<!-- Updated 10/28/2010 (RLW)  -->
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
				<meta name="Description" content="Form IRS1120FScheduleM1M2"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				    <!--Print statement -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FScheduleM1M2Style"/>
						<xsl:call-template name="AddOnStyle"/>
				    </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1120FScheduleM1M2">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!--Begin Header-->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:33.5mm;height:21mm;border-right-width:.5mm;">
							<div class="styFormNumber" style="font-size: 7.5pt;height:15mm">SCHEDULES M-1 and M-2
								<br/>
								<div class="styFormNumber" style="font-size: 12pt;">
								  (Form 1120-F)
								</div>	      
								<br/>
								<!-- General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>		
							</div>	
						<div class="styAgency" style="font-weight:normal;height:6mm">
						  Department of the Treasury<br/>Internal Revenue Service
						</div>
					</div>
					<div class="styFTBox" style="width:122.5mm;height:21mm;">
						<div class="styMainTitle" style="height:12mm;">
						  Reconciliation of Income (Loss) and Analysis of
						  Unappropriated Retained Earnings per Books
						</div>
						<div class="styFST" style="padding-top:2mm;">
							<img src="{$ImagePath}/1120FScheduleM1M2_Bullet.gif" alt="Bullet Image"/>
							Go to
							<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120f">www.irs.gov/Form1120F</a> for the latest information.<br/>
							<img src="{$ImagePath}/1120FScheduleM1M2_Bullet.gif" alt="Bullet Image"/>
							Attach to Form 1120-F.
						</div>
					</div>
					<div class="styTYBox" style="width:31mm;height:21mm;border-left-width:.5mm;">
						<div class="styOMB" style="height:5mm;">OMB No. 1545-0123</div>
						<div class="styTY" style="padding-top:2mm;height:14mm;">20<span class="styTYColor">20</span></div>
					</div>					
				</div>
					<!--End header-->
					<!--Begin Name/EIN-->
					<div style="width:187mm;height:9mm;">
						<div class="sty1120FSchM1M2_headerTableCell" style="width:135mm;">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty1120FSchM1M2_headerTableCell" 
							style="width:52mm;border-right-width:0px;padding-left:1mm;">
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
					<div class="styBB" style="width:187mm;height:8mm;border-top-width:1px">
						<div class="styPartName" style="width:24mm;height:5mm;padding-top:0.7mm;margin-top:1.3mm;margin-bottom:1.3mm">							Schedule M-1</div>
						<div class="stypartDesc" style="width:150mm;padding-top:0.5mm;padding-left:1mm;font-weight:normal">
							<b>Reconciliation of Income (Loss) per Books With Income per Return<br/>
							Note.</b> The corporation may be required to file Schedule M-3 (see instructions).
						</div>
					</div>
					<!--Begin Sch M-1 Table-->
					<div class="styBB" style="width:187mm">
						<!--Left Side (Lines 1 - 6)-->
						<div class="styBB" style="width:93.6mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;">
							<!--Line 1-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox">1</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Net income (loss) per books</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossPerBooksAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 2-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox">2</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Federal income tax per books</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxPerBooksAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 3-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox">3</div>
							<div class="styLNDesc" style="width:53.3mm;font-size:7pt">
							<span style="float:left;">Excess of capital losses over capital gains</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessCapLossesOverCapGainsAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 4-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox" style="height:4.25mm">4</div>
							<div class="styLNDesc" style="width:53.3mm;height:4.25mm">Income subject to tax not recorded on </div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:4.25mm"/>
							<div class="sty1120FSchM1M2_styLNLeftNumBox" style="height:4.25mm"/>
							<div class="styLNDesc" style="width:35.3mm;float:left;clear:none;height:4.25mm">books this year (itemize):</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:15.5mm;height:4.25mm"/>
							<div style="width:2.5mm;float:left;clear:none;height:4.25mm"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:4.25mm"/>
							<div class="sty1120FSchM1M2_styLNLeftNumBox"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableIncmNotRecOnBksAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;float:left;clear:none;height:4.25mm"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:4.25mm"/>
							<div class="sty1120FSchM1M2_styLNLeftNumBox" style="clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;"/>
							<div style="width:2.5mm;float:left;clear:none;height:4.25mm"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;height:4.25mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableIncmNotRecOnBksAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 5-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox" style="height:8mm">5</div>
							<div class="styLNDesc" style="width:53.3mm">
							Expenses recorded on books this year not deducted on this return (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 5a-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox" style="padding-left:3mm">a</div>
							<div class="styLNDesc" style="width:24.8mm">
								Depreciation<span class="sty1120FSchM1M2DotLn" style="padding-left:3.5mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:26mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepreciationExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<!--Line 5b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">b</div>
							<div class="styLNDesc" style="height:8mm;width:24.8mm">
								Charitable contributions<span class="sty1120FSchM1M2DotLn" style="padding-left:3mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:26mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableContriExpnssAmt"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:9mm;border-right-width:0"/>
							<!--Line 5c-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm;">c</div>
							<div class="styLNDesc" style="height:8mm;width:24.8mm">
								Travel and entertainment<span class="sty1120FSchM1M2DotLn" style="padding-left:1.8mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:26mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TravelEntertainmentAmt"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 5d-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">d</div>
							<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:25.8mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExpensesNotDeductedAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExpensesNotDeductedAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 6-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:5mm;clear:left">6</div>
							<div class="styLNDesc" style="width:53.3mm;height:5mm">
							<span style="float:left;">Add lines 1 through 5</span>
							<!-- Dotted Line -->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;border-bottom-width:0;height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeExpensesSubtotalAmt"/>
								</xsl:call-template>
							</div>
							<!--End Left Side (Lines 1 - 6)-->
						</div>
						<!--Right Side (Lines 7 - 10)-->
						<div class="styBB" style="width:93.4mm;float:left;clear:none;border-left-width:0;border-bottom-width:0px;">
							<!--Line 7-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:8mm">7</div>
							<div class="styLNDesc" style="width:53.3mm">
							Income recorded on books this year not included on this return (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 7a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">a</div>
							<div style="width:53.3mm;height:8mm;float:left;clear:none;">							
								<div class="styLNDesc" style="height:8mm;width:25mm">
								  Tax-exempt interest<span class="sty1120FSchM1M2DotLn" style="padding-left:9.8mm;font-weight:normal">$</span>
								</div>
								<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:25.8mm;padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
									</xsl:call-template>
								</div>
								<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 7b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">b</div>
							<div style="width:53.3mm;height:4mm;float:left;clear:none;">							
								<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
								<div class="sty1120FSchM1M2ItemUnderline" style="width:25.8mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherInterestAmt"/>
									</xsl:call-template>
								</div>
								<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotIncmRecordedNotIncludedAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotIncmRecordedNotIncludedAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 8-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;height:8.5mm">8</div>
							<div class="styLNDesc" style="width:53.3mm;height:8.5mm">
							Deductions on this return not charged against book income this year (itemize):</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:8.5mm">
								<span style="width:1px"/>
							</div>
							<!--Line 8a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">a</div>
							<div style="width:53.3mm;height:4mm;float:left;clear:none;">							
								<div class="styLNDesc" style="width:25.1mm">
								  Depreciation<span class="sty1120FSchM1M2DotLn" style="padding-left:3.5mm;font-weight:normal">$</span>
								</div>
								<div class="sty1120FSchM1M2ItemUnderline" style="width:25.7mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DepreciationDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<!--Line 8b-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:8mm">b</div>
							<div style="width:53.3mm;height:4mm;float:left;clear:none;">		
							<div class="styLNDesc" style="height:8mm;width:25.1mm">
							  Charitable contributions<span class="sty1120FSchM1M2DotLn" style="padding-left:3mm;font-weight:normal">$</span>
							</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="height:8mm;width:25.7mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDedAmt"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;width:2.5mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="height:8mm;border-right-width:0"/>
							<!--Line 8c-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm">c</div>
							<div style="width:53.3mm;height:4mm;float:left;clear:none;">									
								<div class="styLNDesc" style="width:25mm">Other (itemize): </div>
								<div class="sty1120FSchM1M2ItemUnderline" style="width:25.8mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsNotChargedAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsNotChargedAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 9-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">9</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Add lines 7 and 8</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeDeductionsSubtotalAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 10-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0;height:5.5mm;border-bottom-width:0">10</div>
							<div class="styLNDesc" style="width:53.3mm;height:5.5mm;border-bottom-width:0">
							<span style="float:left;">Income—line 6 less line 9</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;border-bottom-width:0">....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" 
							style="border-right-width:0;border-bottom-width:0;height:5.5mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeAmt"/>
								</xsl:call-template>
							</div>
							<!--End Right Side (Lines 7 - 10)-->
						</div>
						<!--End Sch M-1 Table-->
					</div>
					<!--END Schedule M-1-->
					<!--BEGIN Schedule M-2-->
					<!--Schedule M-2 Header-->
					<div class="styBB" style="width:187mm;height:8mm;">
						<div class="styPartName" style="width:24mm;height:5mm;padding-top:0.7mm;margin-top:1.3mm;margin-bottom:1.3mm">
						Schedule M-2</div>
						<div class="styPartDesc" style="width:150mm;padding-top:2mm">
							Analysis of Unappropriated Retained Earnings per Books
						</div>
					</div>
					<!--Begin Schedule M-2 Table-->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<!--Left Side (Lines 1 - 4)-->
						<div class="styBB" style="width:93.6mm;float:left;clear:none;border-right-width:1px;border-bottom-width:0px;">
							<!--Line 1-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">1</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Balance at beginning of year</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BeginningYearBalanceAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 2-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">2</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Net income (loss) per books</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">...</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/M2NetIncomeLossPerBooksAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 3-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">3</div>
							<div class="styLNDesc" style="width:36.3mm">Other increases (itemize):</div>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:14.5mm"/>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncreasesAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0;height:5mm"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style="border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm"/>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncreasesAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 4-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox">4</div>
							<div class="styLNDesc" style="width:53.3mm;height:4mm">
							<span style="float:left;">Add lines 1, 2, and 3</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="width:34mm;border-right-width:0;border-bottom-width:0;height:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceIncomeOtherIncreasesAmt"/>
								</xsl:call-template>
							</div>
							<!--End Left Side (Lines 1 - 4)-->
						</div>
						<!--Right Side (Lines 5 - 8)-->
						<div class="styBB" style="width:93.4mm;float:left;clear:none;border-left-width:0;border-bottom-width:0px;">
							<!--Line 5a-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">5</div>
							<div class="styLNDesc" style="width:19.2mm;float:left;clear:none">Distributions:</div>
							<div class="styLNDesc" style="width:34.1mm">
								<b>a</b> Cash
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="width:34mm;border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CashDistributionAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 5b-->
							<div class="styLNLeftNumBox" style="width:6mm;height:4mm;padding-right:1.5mm"/>
							<div style="width:19.2mm;height:4mm;float:left;clear:none"></div>
							<div class="styLNDesc" style="width:34.1mm">
							<!--Dotted Line-->
								<b>b</b> Stock<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StockDistributionAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 5c-->
							<div class="styLNLeftNumBox" style="width:6mm;height:4mm;padding-left:1.5mm"/>
							<div style="width:19.2mm;height:4mm;float:left;clear:none"/>
							<div class="styLNDesc" style="width:34.1mm">
							<!--Dotted Line-->
								<b>c</b> Property							
								<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">....</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PropertyDistributionAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 6-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm">6</div>
							<div style="width:53.3mm;height:4mm;float:left;clear:none;">		
								<div class="styLNDesc" style="width:37.1mm">Other decreases (itemize):</div>
								<div class="sty1120FSchM1M2ItemUnderline" style="width:13.5mm"/>
								<div style="width:2.6mm;height:4mm;float:left;clear:none"/>
							</div>
							<div class="sty1120FSchM1M2LNAmountBoxShaded" style=";border-right-width:0"/>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm"/>
							<div class="sty1120FSchM1M2ItemUnderline" style="width:50.8mm;text-align:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherDecreasesAmt"/>
								</xsl:call-template>
							</div>
							<div style="width:2.5mm;height:4mm;float:left;clear:none"/>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherDecreasesAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 7-->
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:1.5mm;clear:left">7</div>
							<div class="styLNDesc" style="width:53.3mm">
							<span style="float:left;">Add lines 5 and 6</span>
							<!-- Dotted Line -->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.......</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DistributionsOtherDecreasesAmt"/>
								</xsl:call-template>
							</div>
							<!--Line 8-->
							<div class="sty1120FSchM1M2_styLNLeftNumBox">8</div>
							<div class="styLNDesc" style="width:53.3mm;height:4mm">
							<span style="float:left;">Balance at end of year (line 4 less line 7)</span>
							</div>
							<div class="sty1120FSchM1M2LNAmountBox" style="border-right-width:0px;border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EndYearBalanceAmt"/>
								</xsl:call-template>
							</div>
							<!--End Right Side (Lines 5 - 8)-->
						</div>
						<!--End Schedule M-2 Table-->
					</div>
					<!--Begin Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm;font-size:6.5pt;">
						<div style="width:102mm;" class="styGenericDiv">
							<b>For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.</b>
						</div>
						<div style="width:25mm;text-align:center;" class="styGenericDiv">Cat. No. 49678K</div>
						<div style="float:right;" class="styGenericDiv">
							<b>Schedules M-1 and M-2 (Form 1120-F) 2020</b>
						</div>
					</div>
					<br/>
					<br/>
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