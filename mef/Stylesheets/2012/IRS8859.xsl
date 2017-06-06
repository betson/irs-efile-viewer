<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8859Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8859"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
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
				<meta name="Description" content="IRS Form 8859"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8859Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8859">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:21mm;">
						<div class="styFNBox" style="width:28mm;height:22mm;">
							<div style="padding-top:1mm;height:12mm;">
            Form <span class="styFormNumber">8859<br/>
								</span>
							</div>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div style="padding-top:1mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:127.6mm;height:22mm;">
							<div style="padding-top:2mm;" class="styMainTitle">
							District of Columbia First-Time<br/>
							Homebuyer Credit</div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Information about Form 8859 and its instructions is at
								<i>www.irs.gov/form8859</i>.<br />
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Attach to Form 1040 or Form 1040NR.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:22mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">20<span class="styTYColor">12</span></div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">106</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:139mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
								<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Your social security number<br/>
							<span style="width: 40mm; text-align: center;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Note Line -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<span style="font-weight:bold;line-height:5mm;">Before You Begin:</span>
						<li>The District of Columbia first-time homebuyer credit has expired for homes purchased after 2011. In 2012, you can only claim a carryforward of the unused credit from 	2011.</li>
						<li>Figure the amounts of any of the following credits you are claiming: Adoption credit, mortgage interest credit, qualified plug-in electric 
						vehicle credit, alternative motor vehicle credit, qualified plug-in electric drive motor vehicle credit, and credit for the 
						elderly or disabled.</li>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part I</div>
						<div class="styPartDesc">General Information</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- Line A -->
					<div class="styBB" style="width:187mm;height:10mm;">
						<span style="font-weight:bold;padding-right:3mm;height:100%;float:left;">A</span> Address of home qualifying for the credit (if different from the address shown on the return) <br/>
						<xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="$FormData/HomeQualifyingForCreditAddress"/>
						</xsl:call-template>
					</div>
					<!-- Line B-D -->
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:32mm;height:10mm;padding:4px 10px 1px 10px;font-weight:bold;font-size:6pt;">
							Information from <br/>settlement statement<br/>or deed
						</div>
						<div class="styGenericDiv" style="width:5mm;height:10mm;border-right:1px solid black;padding:6px 1mm 1px 0px;">
							<img src="{$ImagePath}/8859_Bullet_Lg.gif" width="9" height="26" alt="Bullet"/>
						</div>
						<div class="styGenericDiv" style="width:32mm;height:10mm;border-right:1px solid black;padding:1px 1mm 1px 0px;">
							<span style="padding-left:1mm;padding-right:1mm;font-weight:bold;">B</span> Lot number<br/>
							<span style="width:100%;text-align:center;padding-top:3mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/LotNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:32mm;height:10mm;border-right:1px solid black;padding:1px 1mm 1px 0px;">
							<span style="padding-left:1mm;padding-right:1mm;font-weight:bold;">C</span> Square number<br/>
							<span style="width:100%;text-align:center;padding-top:3mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SquareNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:85mm;height:10mm;padding:1px 1mm 1px 0px;">
							<span style="padding-left:1mm;padding-right:1mm;font-weight:bold;">D</span> Settlement or closing date<br/>
							<span style="width:100%;text-align:center;padding-top:3mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/ClosingDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part II</div>
						<div class="styPartDesc">Tentative Credit</div>
					</div>
					<!-- END PART II TITLE -->
					
					<div class="styBB" style="width:187mm;">
						<!-- Line 1 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc">
								Enter $5,000 ($2,500 if married filing separately). If the purchase price of the home was less <br/>
								than $5,000, enter the purchase price (see instructions if married filing separately). If someone <br/>
								other than a spouse also held an interest in the home, enter only your share of the <br/>
								<span class="styGenericDiv">$5,000 (or, if smaller, your share of the purchase price) (see instructions)</span>
								<span class="styIRS8859Dots">..........</span>
							</div>
							<div class="styLNRightNumBox"><br/><br/><br/>1</div>
							<div class="styLNAmountBox">
								<br/><br/><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrMaximumAllowableAmt"/>
								</xsl:call-template>
								<span style="width:0px;"/>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:98.1mm;">
								<span class="styGenericDiv">Enter your modified adjusted gross income (see instructions)</span>
								<span class="styIRS8859Dots">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="padding-right:2px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrModifiedAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Spacer -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:98.1mm;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Line 3 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:98.1mm;">
								Is line 2 more than $70,000 ($110,000 if married filing jointly)?
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;"/>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:98.1mm;">
								<span style="width:8mm;font-weight:bold;">No.</span> Skip lines 3 through 5 and enter the amount from line 1 on line 6.
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;"/>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:98.1mm;height:8mm;">
								<span style="width:8mm;font-weight:bold;">Yes.</span> Subtract $70,000 ($110,000 if married filing jointly) from the <br/>
								<span class="styGenericDiv" style="padding-left:8.6mm;">amount on line 2 and enter the result</span>
								<span class="styIRS8859Dots">..........</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox" style="padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrMAGILessMaximumAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;width:7.9mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
						</div>
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="height:8mm;">
								Divide line 3 by $20,000 and enter the result as a decimal (rounded to at least three places). <b>Do</b><br/>
								<span class="styGenericDiv"><b>not</b> enter more than 1.000</span>
								<span class="styIRS8859Dots">..........................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox" style="color:darkblue;">
								<span style="float:left;padding-left:16mm;">x</span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditAllowedRt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc">
								<span class="styGenericDiv">Multiply line 1 by line 4</span>
								<span class="styIRS8859Dots">............................</span>
							</div>
							<div class="styLNRightNumBox">5</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCalculatedHomeCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc">
								<span class="styGenericDiv">Subtract line 5 from line 1. This is your <b>tentative credit</b></span>
								<span class="styIRS8859Dots">.................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;">6</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrTentativeCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part III</div>
						<div class="styPartDesc">Credit Carryforward From 2011</div>
					</div>
					<!-- END PART III TITLE -->
					<!-- Spacer -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc"> 
							<span class="styGenericDiv">
								Enter the amount from line 10 of your 2011 Form 8859 
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCarryforwardPYAmt"/>
								</xsl:call-template>
							</span>
							<span style="float:right;letter-spacing:3mm;font-weight:bold;padding-right:3mm;">................</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCarryforwardPYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
						<div class="styPartName" style="font-family:sans-serif;">Part IV</div>
						<div class="styPartDesc">Tax Liability Limit</div>
					</div>
					<!-- END PART IV TITLE -->
					<!-- Line 8 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Limitation based on tax liability. Enter the amount from the Tax Liability Limit Worksheet in the <br/>
							<span class="styGenericDiv">instructions</span>
							<span class="styIRS8859Dots">...............................</span>
						</div>
						<div class="styLNRightNumBox"><br/>8</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxLiabLmtFromCrLmtWrkshtAmt"/>
							</xsl:call-template>
							<span style="width:0px;"/>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<b>Current year credit.</b> Enter the <b>smaller</b> of line 7 or line 8. Also include this amount on Form 1040, <br/>
							line 53, or Form 1040NR, line 50. Check box <b>c</b> on that line and enter "8859" in the space next to <br/>
							<span class="styGenericDiv">that box</span>
							<span class="styIRS8859Dots">................................</span>
						</div>
						<div class="styLNRightNumBox"><br/><br/><br/>9</div>
						<div class="styLNAmountBox">
							<br/><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCurrentYearCreditAmt"/>
							</xsl:call-template>
							<span style="width:0px;"/>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<span class="styGenericDiv"><b>Credit carryforward to 2013.</b> Subtract line 9 from line 7</span>
							<span class="styIRS8859Dots">................</span>
						</div>
						<div class="styLNRightNumBoxNBB">10</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCfwdNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:2px solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No. 24779G
						<span style="width:10mm"/>
						Form <b style="font-size:9pt">8859</b> (2012)
						</div>
					</div>
					<!--END Page Footer-->
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
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
