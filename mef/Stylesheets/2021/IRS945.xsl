<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS945Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS945"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
					</xsl:with-param>
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
				<meta name="Description" content="IRS Form 945"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS945Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form945">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;height:20mm;border-bottom-width:2px">
						<div class="styFNBox" style="width:29mm;height:20mm;border-right-width:2px">Form <span class="styFormNumber">945</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="font-size:7.5pt;vertical-align:bottom;">Department of the Treasury<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm; ">
							<div class="styMainTitle" style="height:4mm;padding-top:3mm;">Annual Return of Withheld Federal Income Tax</div>
							<div class="styFBT" style="width:128mm;height:auto;padding-top:3mm;font:size:6pt;">
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/> For withholding reported on Forms 1099 and W-2G.<br/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/> For more information on income tax withholding, see Pub. 15 
									and Pub. 15-A.<br/>
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/> Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form945" title="Link to IRS.gov"><i>www.irs.gov/Form945</i> for instructions and the latest information.</a>
								<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;border-left-width:2px">
							<div class="styOMB" style="height:8mm;padding-top:2mm;">OMB No. 1545-1430 </div>
							<div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">21</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:16mm;height:40mm;text-align:center;padding-top:16mm;font-weight:bold;font-size:10pt;">
							<b>Type<br/>or<br/>Print</b>
						</div>
						<div class="styGenericDiv" style="width:141.3mm;border-right:1px solid black;border-left:1px solid black;">
							<div class="styGenericDiv" style="width:141.3mm;height:16mm;border-bottom:1px solid black;">
								<div class="styGenericDiv" style="width:91mm;height:16mm;padding-left:2mm;border-right:1px solid black;">Name (as distinguished from trade name)<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:50mm;height:16mm;padding-left:2mm;">Employer identification number (EIN)<br/>
									<br/><br/><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styGenericDiv" style="width:141.3mm;height:10mm;border-bottom:1px solid black;padding-left:2mm;">Trade name, if any<br/>
								<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styGenericDiv" style="width:141.3mm;height:10mm;padding-left:2mm;border-bottom:1px solid black;">Address (number and street)<br/>
								<xsl:if test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styGenericDiv" style="width:141.3mm;height:10mm;padding-left:2mm;">City or town, state or province, country, and ZIP or foreign postal code<br/>
								<xsl:if test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<!-- 4/7/2015 AM: Hairline between form title and filer information is at maximum width to align (width 29.5 to 29.7) -->
						<div class="styGenericDiv" style="width:29.7mm;height:30mm;padding-left:3mm;padding-top:14mm;">
							<span class="styBoldText">If address is<br/>different<br/>from prior<br/>return, check<br/>here. 
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
							<span style="width:3mm;"/>
							<input type="checkbox" alt="PriorAddress" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
									<xsl:with-param name="BackupName">IRS945PriorAddressInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
									<xsl:with-param name="BackupName">IRS945PriorAddressInd</xsl:with-param>
								</xsl:call-template>
							</label>
							</span>
						</div>
					</div>
					<!-- BEGIN LINE A -->
					<div class="styBB" style="width:187mm;padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;">A</div>
						<div class="styLNDesc" style="width:142.8mm;">
							<span style="padding-right:.5mm">If you don't have to file returns in the future, check here </span>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
							<span style="width:3mm;"/>
							<input type="checkbox" alt="FutureFilingNotRequired" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">IRS945FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">IRS945FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:3mm;"/>
							<span style="padding-right:.5mm">and enter date final payments made. </span>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
						</div>
						<div class="styGenericDiv" style="width:35mm;border-bottom:1px dashed black;float:right;">
							<span style="width:2mm;"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalPaymentDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE A -->
					<!-- BEGIN LINE 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:138.8mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="float:left;">Federal income tax withheld from pensions, annuities, IRAs, gambling winnings, etc. </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm">1</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 1 -->
					<!-- BEGIN LINE 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:138.8mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="float:left;">Backup withholding </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm">2</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 2 -->
					<!-- BEGIN LINE 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:138.8mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="float:left;">
								<b>Total taxes.</b> If $2,500 or more, this must equal line 7M below or Form 945-A, line M </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm">3</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 3 -->
					<!-- BEGIN LINE 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:138.8mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:138.8mm;">Total deposits for 2021, including overpayment applied from a prior year and overpayment applied from<br/>
							<span style="float:left;">Form 945-X </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3px;">
							<br/>4</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:8mm;padding-top:6px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:138.8mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="float:left;">
								<b>Balance due.</b> If line 3 is more than line 4, enter the difference and see the separate instructions </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm">5</div>
						<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:175mm;"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:98.8mm;">
							<span style="float:left;">
								<b>Overpayment.</b> If line 4 is more than line 3, enter the difference 
								<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
							</span>
							<span style="float:right;">$</span>
						</div>
						<div class="styGenericDiv" style="width:40mm;border-bottom:1px solid black;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 6 -->
					<!-- BEGIN LINE CHECK ONE -->
					<div class="styBB" style="width:187mm;height:7mm;padding-top:2mm;">
						<div class="styLNDesc" style="width:138.8mm;padding-left:40mm;">
							<span style="">Check one: </span>
							<span style="width:6mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="ApplyOverpaymentToNextReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">IRS945ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">IRS945ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm;"/>Apply to next return.<span style="width:6mm;"/>
								</label>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="RefundOverpayment" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">IRS945RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">IRS945RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm;"/>Send a refund.
								</label>
							</span>
						</div>
					</div>
					<!-- END LINE CHECK ONE -->
					<!-- 9/16/2014 AM: Dots and carat are placed correctly, adding extra dot to 'Semiweekly schedule' will cause line to wrap (Defect 41575) -->
					<!-- BEGIN ALL FILERS SECTION -->
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;">
							<b>• All filers:</b> If line 3 is less than $2,500, <b>don't</b> complete line 7 or Form 945-A.			  
						</div>
						<div class="styGenericDiv" style="width:182mm;float:left;padding-top:1mm;">
							<span style="float:left;padding-right:2mm;">
								<b>• Semiweekly schedule depositors:</b> Complete Form 945-A and check here </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">.................</span>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
							<div class="styGenericDiv" style="float:right;">
								<input type="checkbox" alt="SemiweeklyScheduleDepositor" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945SemiweeklyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945SemiweeklyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:182mm;float:left">
							<span style="float:left;padding-right:4mm;">
								<b>• Monthly schedule depositors:</b> Complete line 7, entries A through M, and check here</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">.............</span>
							<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
							<div class="styGenericDiv" style="float:right;">
								<input type="checkbox" alt="MonthlyScheduleDepositor" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945MonthlyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945MonthlyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
					</div>
					<!-- END ALL FILERS SECTION -->
					<!-- BEGIN LINE 7 -->
					<div class="styGenericDiv" style="width:187mm;border:2px solid black;">
						<div class="styBB" style="width:186.5mm;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:170mm;">
								<b>Monthly Summary of Federal Tax Liability.</b> (<b>Don't</b> complete if you were a semiweekly schedule depositor.)
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;height:27mm;">
							<div class="styIRS945MonthlyGrp">
								<div class="styIRS945MonthNm"/>
								<div class="styIRS945MonthAmt" style="font-size:8px;text-align:center;padding-top:.75mm;">
									<b>Tax liability for month</b>
								</div>
								<div class="styIRS945MonthNm">
									<div class="styIRS945MonthLetter">A</div>
									<div class="styIRS945Month">
										<span style="float:left;">January </span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</div>
								</div>
								<div class="styIRS945MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JANUARY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthNm">
									<div class="styIRS945MonthLetter">B</div>
									<div class="styIRS945Month">
										<span style="float:left;">February</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</div>
								</div>
								<div class="styIRS945MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'FEBRUARY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthNm">
									<div class="styIRS945MonthLetter">C</div>
									<div class="styIRS945Month">
										<span style="float:left;">March</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</div>
								</div>
								<div class="styIRS945MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MARCH']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthNm">
									<div class="styIRS945MonthLetter">D</div>
									<div class="styIRS945Month">
										<span style="float:left;">April</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
								<div class="styIRS945MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'APRIL']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthNm">
									<div class="styIRS945MonthLetter">E</div>
									<div class="styIRS945Month">
										<span style="float:left;">May</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
								<div class="styIRS945MonthAmt" style="border-bottom:0px;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MAY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</div>
							<div class="styIRS945MonthlyBGrp">
								<div class="styIRS945MonthBNm"/>
								<div class="styIRS945MonthBAmt" style="font-size:8px;text-align:center;padding-top:.75mm;">
									<b>Tax liability for month</b>
								</div>
								<div class="styIRS945MonthBNm">
									<div class="styIRS945MonthBLetter">F</div>
									<div class="styIRS945Month">
										<span style="float:left;">June</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
								<div class="styIRS945MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JUNE']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm">
									<div class="styIRS945MonthBLetter">G</div>
									<div class="styIRS945Month">
										<span style="float:left;">July</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</div>
								</div>
								<div class="styIRS945MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JULY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm">
									<div class="styIRS945MonthBLetter">H</div>
									<div class="styIRS945Month">
										<span style="float:left;">August</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</div>
								</div>
								<div class="styIRS945MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'AUGUST']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm">
									<div class="styIRS945MonthBLetter">I</div>
									<div class="styIRS945Month">
										<span style="float:left;">September</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</div>
								</div>
								<div class="styIRS945MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'SEPTEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm">
									<div class="styIRS945MonthBLetter">J</div>
									<div class="styIRS945Month">
										<span style="float:left;">October</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</div>
								</div>
								<div class="styIRS945MonthBAmt" style="border-bottom:0px;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'OCTOBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</div>
							<div class="styIRS945MonthlyBGrp" style="width:62.8mm;float:right;">
								<div class="styIRS945MonthBNm" style="width:32.8mm;"/>
								<div class="styIRS945MonthCAmt" style="width:29.5mm;font-size:8px;text-align:center;padding-top:.75mm;">
									<b>Tax liability for month</b>
								</div>
								<div class="styIRS945MonthBNm" style="width:32.8mm;">
									<div class="styIRS945MonthLetter">K</div>
									<div class="styIRS945Month">
										<span style="float:left;">November</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</div>
								</div>
								<div class="styIRS945MonthCAmt" style="width:29mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'NOVEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm" style="width:32.8mm;">
									<div class="styIRS945MonthLetter">L</div>
									<div class="styIRS945Month">
										<span style="float:left;">December</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</div>
								</div>
								<div class="styIRS945MonthCAmt" style="width:29mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'DECEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS945MonthBNm" style="height:13.5mm;padding-top:3mm; width:32.8mm;">
									<div class="styIRS945MonthLetter" style="height:10.5mm;">M</div>
									<div class="styIRS945Month">Total liability for<br/>	year (add lines <b>A</b>
										<br/>
										<span style="float:left;">through <b>L</b> )</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</div>
								</div>
								<div class="styIRS945MonthCAmt" style="width:29mm;height:13.5mm;border-bottom:0px;padding-top:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END LINE 7 -->
					<!-- 3rd party -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;">
						<div style="width:15mm;height:14mm;float:left;clear:none;border-right:1px solid black;">
							<span class="styMainTitle" style="font-size:9pt;">Third-<br/>Party<br/>Designee</span>
						</div>
						<div style="float:left;clear:none;width:172mm;padding-top:.5mm;">
							<div style="font-size:6pt;float:left;clear:none;padding-left:2mm;">Do you want to allow another person to discuss this return with the IRS? See separate instructions.
							</div>
							<div style="float:left;clear:none;padding-left:8mm;font-size:6pt;">
								<!-- Checkbox -->
								<input type="Checkbox" alt="DiscussWithThirdPartyYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">IRS945DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">IRS945DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:1mm;">Yes. </span> Complete the following.
								</label>
							</div>
							<div style="float:left;clear:none;padding-left:5mm;font-size:6pt;">
								<!-- Checkbox -->
								<input type="Checkbox" alt="DiscussWithThirdPartyNo" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										<xsl:with-param name="BackupName">IRS945DiscussWithThirdPartyNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										<xsl:with-param name="BackupName">IRS945DiscussWithThirdPartyNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:1mm;">No.</span>
								</label>
							</div>
						</div>
						<div style="height:9mm;float:left;clear:none;width:172mm;padding-top:2mm;">
							<div style="height:7mm;float:left;clear:none;width:16mm;padding-left:2mm;font-weight:bold;font-size:6pt;">Designee's name
								<span style="width:1px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="width:52mm;float:left;clear:none;padding-top:3mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									<xsl:with-param name="BackupName">IRS945ThirdPartyDesigneeNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float:left;clear:none;width:13mm;padding-left:.5mm;font-weight:bold;font-size:6pt;">Phone<br/>no.
								<span style="width:2px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="float:left;clear:none;width:29mm;padding-top:3mm;">
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										<xsl:with-param name="BackupName">IRS945ThirdPartyDesigneePhoneNum</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
									<span style="font-size:5pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
											<xsl:with-param name="BackupName">IRS945ThirdPartyDesigneeFrgnPhoneNum</xsl:with-param>
										</xsl:call-template>
									</span>
								</xsl:if>
							</div>
							<div style="height:5mm;width:24mm;padding-top:1.5mm;float:right;clear:none;">
								<div class="styLNCtrNumBox" style="float:right;width:23mm;border-top-width:1px;padding-top:1mm;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										<xsl:with-param name="BackupName">IRS945ThirdPartyDesigneePIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:right;clear:none;width:32mm;padding-left:.5mm;font-weight:bold;font-size:6pt;">Personal identification<br/>number (PIN)
								<span style="width:8mm;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
						</div>
					</div>
					<!-- Sign Here -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;">
						<div style="width:15mm;height:21mm;float:left;clear:none;border-right:1px solid black;padding-top:3.5mm;">
							<span class="styMainTitle" style="font-size:15pt;">Sign<br/>Here</span>
						</div>
						<div style="float:left;clear:none;width:172mm;padding-top:.5mm;">
							<div style="font-size:6pt;float:left;clear:none;padding-left:2mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying
							 schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based
							  on all information of which preparer has any knowledge. 
							</div>
						</div>
						<div style="height:15mm;float:left;clear:none;width:172mm;padding-top:2mm;">
							<div style="height:13mm;float:left;clear:none;width:18mm;padding-left:2mm;font-weight:bold;font-size:6pt;padding-top:9mm;">Signature
								<span style="width:2px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="width:46mm;float:left;clear:none;padding-top:9mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureOptionCd"/>
								</xsl:call-template>
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</div>
							<div style="float:left;clear:none;width:25mm;padding-left:.5mm;font-weight:bold;font-size:6pt;padding-top:6mm;">Print Your<br/> Name and Title
								<span style="width:2px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="float:left;clear:none;width:auto;padding-top:6mm;">
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
								</xsl:call-template>
								<br/>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/Title">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/Title"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div style="float:right;clear:none;width:auto;padding-right:1mm;padding-left:.5mm;font-weight:bold;font-size:6pt;padding-top:8mm;">Date
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:5px;"/>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.75mm;padding-top:2mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">Paid Preparer Use Only </span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="width:46.8mm;height:8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:46.5mm;height:8mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">Preparer's signature 
								</div>
								<div class="styLNDesc" style="width:15mm;height:8mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:18mm;height:8mm;border-right:1px solid black;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>Check 
										<input class="styCkbox" alt="SelfEmployed" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrpSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4.5px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="width:26mm;height:8mm;padding-top:0mm;padding-left:1mm;">PTIN <br/>
									<span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/STIN"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="width:126.2mm;height:6mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:5px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReasonCd</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrpFirmGrpMissingEINReasonCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:126.2mm;height:auto;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!-- 9/16/2014 AM: Font size defined as 5.5pt in order to fit Foreign Phone Number in field (Defect 41575) -->
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;font-size:5.5pt"> Phone no. 
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:125mm;float:left;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions. </span>
						</div>
						<div style="text-align:center;width:26mm;font-size:7pt;">Cat. No. 14584B </div>
						<div style="float:right;">
							<span style="width:50px;"/>Form 
							<span class="styBoldText" style="font-size:8pt;">945 </span> (2021)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
