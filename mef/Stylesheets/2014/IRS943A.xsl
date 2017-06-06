<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS943AStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form943AData" select="$RtnDoc/IRS943A"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form943AData)">
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
				<meta name="Description" content="IRS Form 943A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS943AStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form943A">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:29mm;height:21mm;">
        Form <span class="styFormNumber">943-A</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form943AData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="font-size:7.5pt;padding-bottom:1.4mm;">
			(Rev. December 2013)
		</div>
							<div class="styAgency" style="font-size:7.5pt;vertical-align:bottom;">
          Department of the Treasury<br/>
          Internal Revenue Service
        </div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm; ">
							<div class="styMainTitle" style="height:4mm;">Agricultural Employer's Record of<br/>Federal Tax Liability</div>
							<div class="styFBT" style="height:3mm;margin-top:2mm;font:size:6pt;width:128mm;">
								<img src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Bullet Image"/> Information about Form 943-A and its instructions is at <i>www.irs.gov/form943a</i>.<br/>
								<img src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Bullet Image"/> File with Form 943 or Form 943-X.        
        </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:8mm;padding-top:2mm;">
        OMB No. 1545-0035</div>
							<div class="styTaxYear" style="padding-top:0.5mm;height:10mm;">
								<!--20<span class="styTYColor">14</span>-->
								<xsl:call-template name="PopulateReturnHeaderTaxYear">
									<xsl:with-param name="TargetNode" select="TaxYr"/>
								</xsl:call-template>
							</div>
							<span style="vertical-align:bottom">Calendar Year</span>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:130mm;height:8mm;font-size:7pt;">
        Name (as shown on Form 943)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:55mm;height:8mm;font-size:7pt;padding-left:2mm;">
        Employer identification number (EIN)<br/>
							<span class="styEINFld" style="width:55mm; text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Calendar Instructions-->
					<div style="width:188mm;font-size:8pt;float:none;clear:both;">
						<div class="styLNDesc" style="height:12mm;width:187mm;border-left-width:0px;border-right-width:0px;">You must complete this form if you are required to deposit on a semiweekly schedule or if your tax liability during any month was $100,000 or more. Show tax liability here, not deposits. (The IRS gets deposit data from electronic funds transfers.) <b>DO NOT change your tax liability by adjustments reported on any Forms 943-X.</b>
						</div>
					</div>
					
					<!--January-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							January Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">JANUARY</xsl:with-param>
							<xsl:with-param name="Letter">A</xsl:with-param>
						</xsl:call-template>
					</div>
										
					<!--February-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							February Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">29</xsl:with-param>
							<xsl:with-param name="Month">FEBRUARY</xsl:with-param>
							<xsl:with-param name="Letter">B</xsl:with-param>
						</xsl:call-template>
					</div>
					
					<!--March-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							March Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">MARCH</xsl:with-param>
							<xsl:with-param name="Letter">C</xsl:with-param>
						</xsl:call-template>
					</div>				
						
					<div style="width:187mm;float:none;clear:both;">
						<div class="styLNAmountBox" style="height:4mm;width:187mm;border-left-width:0px;border-right-width:0px;"/>
					</div>
					
					<!--April-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							April Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">30</xsl:with-param>
							<xsl:with-param name="Month">APRIL</xsl:with-param>
							<xsl:with-param name="Letter">D</xsl:with-param>
						</xsl:call-template>
					</div>
					
					<!--May-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							May Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">MAY</xsl:with-param>
							<xsl:with-param name="Letter">E</xsl:with-param>
						</xsl:call-template>
					</div>
						
					<!--June-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							June Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">30</xsl:with-param>
							<xsl:with-param name="Month">JUNE</xsl:with-param>
							<xsl:with-param name="Letter">F</xsl:with-param>
						</xsl:call-template>
					</div>
					
					<div class="pageEnd" style="width:187mm;font-size:6pt;border:black solid 0px;border-top-width:1px;float:none;clear:both;">
						<div class="styGenericDiv" style="font-weight:bold">For Privacy Act and Paperwork Reduction Act Notice, see the separate Instructions for Form 943.</div>
						<div class="styGenericDiv" style="padding-left:11mm">Cat. No. 17030C</div>
						<div class="styGenericDiv" style="float:right">Form <b>943-A</b> (Rev. 12-2013)</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div style="float:left;">Form 943-A (Rev. 12-2013)<span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					
					<!--July-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							July Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">JULY</xsl:with-param>
							<xsl:with-param name="Letter">G</xsl:with-param>
						</xsl:call-template>
					</div>
						
					<!--August-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							August Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">AUGUST</xsl:with-param>
							<xsl:with-param name="Letter">H</xsl:with-param>
						</xsl:call-template>
					</div>
										
					<!--September-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							September Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">30</xsl:with-param>
							<xsl:with-param name="Month">SEPTEMBER</xsl:with-param>
							<xsl:with-param name="Letter">I</xsl:with-param>
						</xsl:call-template>
					</div>
						
					<div style="width:187mm;float:none;clear:both;">
						<div class="styLNAmountBox" style="height:4mm;width:187mm;border-left-width:0px;border-right-width:0px;"/>
					</div>
					
					<!--October-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							October Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">OCTOBER</xsl:with-param>
							<xsl:with-param name="Letter">J</xsl:with-param>
						</xsl:call-template>
					</div>
									
					<!--November-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							November Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">30</xsl:with-param>
							<xsl:with-param name="Month">NOVEMBER</xsl:with-param>
							<xsl:with-param name="Letter">K</xsl:with-param>
						</xsl:call-template>
					</div>
					
					<!--December-->
					<div class="styIRS943ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
						<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
							December Tax Liability
						</div>
						<xsl:call-template name="PopulateDays">
							<xsl:with-param name="NumDays">31</xsl:with-param>
							<xsl:with-param name="Month">DECEMBER</xsl:with-param>
							<xsl:with-param name="Letter">L</xsl:with-param>
						</xsl:call-template>
					</div>
						
					<!--FULL CALENDAR TOTAL ROW-->
					<div style="width:187mm;font-size:7pt;float:none;clear:both;">
						<div class="styLNAmountBox" style="height:4mm;width:187mm;border-left-width:0px;border-right-width:0px;font-weight:bold;text-align:left;">
							<span style="float:left;">
							  M <span style="3mm"/>Total tax liability for year (add lines A through L)
							  <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>.
									<span style="width:16px;"/>
									<img src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form943AData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Page Break-->
					<!-- Footer-->
					<div class="pageEnd" style="width:187mm;border:1px solid black; border-bottom-width:0px; border-right-width:0px; border-left-width:0px;">
						<div class="styGenericDiv" style="float:right;">Form <b>
								<span style="font-size:8pt;">943-A</span>
							</b> (Rev. 12-2013)</div>
					</div>
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
							<xsl:with-param name="TargetNode" select="$Form943AData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="PopulateDays">
		<xsl:param name="NumDays"/>
		<xsl:param name="Month"/>
		<xsl:param name="Letter"/>
		<html lang="EN-US">
			<body class="styBodyClass" >
				<div style="float:left;width:117px;border:solid black;border-width:0px 1px 0px 0px;">
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">1</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=1]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">2</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=2]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">3</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=3]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">4</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=4]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">5</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=5]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">6</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=6]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">7</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=7]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">8</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=8]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">9</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=9]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">10</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=10]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">11</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=11]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">12</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=12]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">13</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=13]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">14</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=14]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;float:left;">15</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=15]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey;padding-right:0px;padding-left:0px;padding-top:0px;padding-bottom:0px;"/>
				</div>
				<div style="float:right;width:117px;">
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">16</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=16]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">17</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=17]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">18</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=18]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">19</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=19]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">20</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=20]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">21</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=21]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">22</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=22]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">23</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=23]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">24</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=24]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">25</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=25]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">26</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=26]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">27</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=27]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">28</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=28]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">29</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=29]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					
					<xsl:if test="$NumDays = 29">
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
					</xsl:if>
					
					<xsl:if test="$NumDays = 30">
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">30</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=30]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
					</xsl:if>
					
					<xsl:if test="$NumDays = 31">
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">30</div>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=30]/TaxLiabilityAmt"/>
						</xsl:call-template>
						</div>
						<div class="styIRS943ACalNumBox" style="height:4.3mm;width:18px;">31</div>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/DailyTaxLiabilityDetail[DayNum=31]/TaxLiabilityAmt"/>
						</xsl:call-template>
						</div>
					</xsl:if>
				</div>
				<div class="styLNAmountBox" style="height:4mm;width:234px;font-weight:bold;text-align:left;border-bottom-width:0px;border-top-width:1px;border-left-width:0px;">
					<span style="float:left;">
						<xsl:value-of select="$Letter"/><span style="width:1mm"/><span style="font-size:5pt;">Total liability for month </span><img src="{$ImagePath}/943A_Bullet_Sm.gif"  alt="Bullet Image"/>
					</span>
					<span style="float:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form943AData/MonthlyTaxLiabilityGrp[MonthCd = $Month]/TotalMonthlyLiabilityAmt"/>
						</xsl:call-template>
					</span>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
