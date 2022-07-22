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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form8859">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:22mm;">
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
							Carryforward of the District of Columbia <br/>
							First-Time Homebuyer Credit</div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Information about Form 8859 and its instructions is at
								<i>www.irs.gov/form8859</i>.<br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Attach to Form 1040 or Form 1040NR.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:22mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;padding-top:2mm;">20<span class="styTYColor">14</span>
							</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;padding-top:4mm;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">106</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:139mm;text-align: left; height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;text-align: left; height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Your social security number<br/>
							<span style="width: 40mm; text-align: left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Note Line -->
					<div class="styBB" style="width:187mm;padding:1mm;">
						<b>Before you begin, </b>figure the amounts of any of the following credits you are claiming: Adoption credit, mortgage interest credit, alternative motor vehicle credit, qualified plug-in electric drive motor vehicle credit, and credit for the 
						elderly or the disabled.
					</div>
					<!-- Spacer -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!-- Line 1 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<span class="styGenericDiv">
								Credit carryforward from 2013. Enter the amount from line 4 of your 2013 Form 8859 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCarryforwardPYAmt"/>
								</xsl:call-template>
							</span>
							<span style="float:right;letter-spacing:3mm;font-weight:bold;padding-right:3mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:8mm">1</div>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCarryforwardPYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							<span style="float:left;">Limitation based on tax liability. Enter the amount from the Tax Liability Limit Worksheet in the</span>
							<br/>
							<span style="float:left;">instructions below</span>
							<span class="styIRS8859Dots">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;width:8mm">
							<br/>2</div>
						<div class="styLNAmountBox" style="height:8mm;width:33mm;text-align:right;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxLiabLmtFromCrLmtWrkshtAmt"/>
							</xsl:call-template>
							<span style="width:0px;"/>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<b>Current year credit.</b> Enter the <b>smaller</b> of line 1 or line 2. Also include this amount on Form 1040, <br/>
							line 54, or Form 1040NR, line 51. Check box <b>c</b> on that line and enter "8859" in the space next to <br/>
							<span class="styGenericDiv">that box</span>
							<span class="styIRS8859Dots">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;width:8mm">
							<br/>
							<br/>3</div>
						<div class="styLNAmountBox" style="height:10mm;width:33mm;text-align:right;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCurrentYearCreditAmt"/>
							</xsl:call-template>
							<span style="width:0px;"/>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<span class="styGenericDiv">
								<b>Credit carryforward to 2015.</b> Subtract line 3 from line 1</span>
							<span class="styIRS8859Dots">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCreditCfwdNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:2px solid black;background-color:red;">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No. 24779G
						<span style="width:10mm"/>
						Form <b style="font-size:9pt">8859</b> (2014)
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
