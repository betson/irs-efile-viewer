<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8396Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8396"/>
	<xsl:template match="/">
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 8396"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8396Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8396">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;">
							Form <span class="styFN">8396</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/><br/>
							<span class="styAgency">Department of the Treasury <br/>Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:122mm;padding-top:2mm;">
							<span class="styFMT" style="font-size:13.5pt;">Mortgage Interest Credit</span><br/>
							<span style="font-size:3pt;"><br/></span>
							<span class="styFBT">(For Holders of Qualified Mortgage Credit Certificates Issued by<br/>
							State or Local Governmental Units or Agencies)</span><br/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT" style="font-size:8pt;"> Attach to Form 1040 or 1040NR.</span>
							<span style="width:12px;"/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT" style="font-size:8pt;"> See instructions on back.</span>
						</div>
						<div class="styTYBox" style="width:33.7mm;">
							<div class="styOMB">OMB No. 1545-0074</div>
							<span class="styTaxYear">20<span class="styTYColor">11</span></span><br/>
							<span class="stySequence">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">138</span></span>
						</div>
					</div>
					<!-- Taxpayer Name/SSN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;">
							Name(s) shown on your tax return <br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:48mm;padding-left:1mm;">
							Your social security number <br/>
							<span style="font-weight:normal;width:100%;text-align:center;font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Mortgage Address -->
					<div class="styNameAddr" style="width:187mm;padding-left:0px;">
						Enter the address of your main home to which the qualified mortgage certificate relates if it is different from the address shown on your tax return.<br/>
						<span style="font-size:7pt;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/USAddressOfQlfyMortgageCert"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Certificate Info -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:78.4mm;">
							Name of Issuer of Mortgage Credit Certificate <br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MortgSbsdyCertIssuerAgencyName"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:58.4mm;padding-left:1mm;">
							Mortgage Credit Certificate Number <br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MortgageCreditCertificateNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:48mm;padding-left:1mm;font-weight:normal;">
							Issue Date <br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/MortgCrCertificateIssueDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Before You Begin -->
					<div class="styBB" style="width:187mm;">
						<b>Before you begin Part I,</b> figure the amounts of any of the following credits you are claiming: Credit for the elderly or the disabled, <br/>
						alternative motor vehicle credit, qualified plug-in electric vehicle credit, and qualified plug-in electric drive motor vehicle credit.
					</div>
					<!-- Part I Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Current Year Mortgage Interest Credit</div>
					</div>
					<!-- Line 1 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Interest paid on the certified indebtedness amount. If someone else (other than your spouse if <br/>
							<span style="float:left;">filing jointly) also held an interest in the home, enter only your share of the interest paid</span>
							<span class="styIRS8396Dots">.....</span>
						</div>
						<div class="styLNRightNumBox"><br/>1</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CertifiedMortgageIntCrPdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Enter the certificate credit rate shown on your <b>mortgage credit certificate. Do not</b> enter the <br/>
							<span style="float:left;">
								interest rate on your home mortgage 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/MortgageCreditCertificateRt"/>
								</xsl:call-template>
							</span>
							<span class="styIRS8396Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox"><br/>2</div>
						<div class="styLNAmountBox" style="color:darkblue;">
							<br/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/MortgageCreditCertificateRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							If line 2 is 20% or less, multiply line 1 by line 2. If line 2 is more than 20%, or you refinanced <br/>
							<span style="float:left;">your mortgage and received a reissued certificate, see the instructions for the amount to enter </span>
							<span class="styIRS8396Dots">...</span>
						</div>
						<div class="styLNRightNumBox"><br/>3</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgageInterestReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="font-weight:bold;">
							You must reduce your deduction for home mortgage interest on Schedule A (Form 1040) <br/>
							by the amount on line 3.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"><br/><br/><span style="width:0px;"/></div>
						<div class="styLNAmountBoxNBB"><br/><br/><span style="width:0px;"/></div>
					</div>
					<!-- Line 4 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter any 2008 credit carryforward from line 16 of your 2010 Form 8396 </span>
							<span class="styIRS8396Dots">..........</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntPrevious3YrCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter any 2009 credit carryforward from line 14 of your 2010 Form 8396 </span>
							<span class="styIRS8396Dots">..........</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntPrevious2YrCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter any 2010 credit carryforward from line 17 of your 2010 Form 8396 </span>
							<span class="styIRS8396Dots">..........</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntPYCarryforwardCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<span style="float:left;">Add lines 3 through 6 </span>
							<span class="styIRS8396Dots">...........................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntTotPreviousCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Limitation based on tax liability. Enter the amount from the Credit Limit Worksheet (see <br/>
							<span style="float:left;">instructions) </span>
							<span class="styIRS8396Dots">..............................</span>
						</div>
						<div class="styLNRightNumBox"><br/>8</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxLiabLmtFromCrLmtWrkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<b>Current year mortgage interest credit.</b> Enter the <b>smaller</b> of line 7 or line 8. Also include this <br/>
							amount in the total on Form 1040, line 53, or Form 1040NR, line 50. Check box <b>c</b> on that line and <br/>
							<span style="float:left;">enter "8396" in the space next to that box </span>
							<span class="styIRS8396Dots">....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-bottom:0px;">
							<br/><br/>
							<span style="width:100%;height:3.8mm;background-color:white;">9</span>
						</div>
						<div class="styLNAmountBoxNBB">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgageInterestCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Mortgage Interest Credit Carryforward to 2012. 
							<span style="font-weight:normal;">(Complete <b>only</b> if line 9 is less than line 7.)</span>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<span style="float:left;">Add lines 3 and 4 </span>
							<span class="styIRS8396Dots">............................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntRedPlusOldestCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter the amount from line 7 </span>
							<span class="styIRS8396Dots">........................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntTotPreviousCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter the <b>larger</b> of line 9 or line 10 </span>
							<span class="styIRS8396Dots">......................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LargerOfMortgIntCrOrCfwdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							<span style="float:left;">Subtract line 12 from line 11 </span>
							<span class="styIRS8396Dots">........................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntTentTwoYearCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							<span style="float:left;"><b>2010 credit carryforward to 2012.</b> Enter the <b>smaller</b> of line 6 or line 13 </span>
							<span class="styIRS8396Dots">..........</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntNextYears2YrCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc">
							<span style="float:left;">Subtract line 14 from line 13 </span>
							<span class="styIRS8396Dots">........................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntTent3YearCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							<span style="float:left;"><b>2009 credit carryforward to 2012.</b> Enter the <b>smaller</b> of line 5 or line 15 </span>
							<span class="styIRS8396Dots">..........</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntNextYears3YrCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							<span style="float:left;"><b>2011 credit carryforward to 2012.</b> Subtract line 9 from line 3. If zero or less, enter -0- </span>
							<span class="styIRS8396Dots">......</span>
						</div>
						<div class="styLNRightNumBoxNBB">17</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgIntNextYearsPYCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Part II -->
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="float:left;clear:none;margin-left:30mm;">Cat. No. 62502X</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8396</span> (2011)</span>
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
