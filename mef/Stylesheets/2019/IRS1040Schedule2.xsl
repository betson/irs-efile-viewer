<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040Schedule2Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040Schedule2" />
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
				<meta name="Description" content="IRS Form 1040 Schedule 2" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule2Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040Schedule2">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:17mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:7pt;">
								<span style="font-size:10pt;">SCHEDULE 2</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template><br />
								(Form 1040 or 1040-SR)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">Additional Taxes</span>
							<br /><br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								Attach to Form 1040 or 1040-SR.
							</span><br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>Go to
								<span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17mm;">
							<div class="styOMB" style="font-size:6pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">19</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">02</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name(s) shown on Form 1040 or 1040-SR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Tax</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Alternative minimum tax. Attach Form 6251 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Excess advance premium tax credit repayment. Attach Form 8962 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Add lines 1 and 2. Enter here and include on Form 1040 or 1040-SR, line 12b
							<span class="sty1040Sch2DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Other Taxes</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Self-employment tax. Attach Schedule SE 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 4 - Exempt Self-Employment Tax Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:4.2mm;">
							Unreported social security and Medicare tax from Form: 
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">a</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form4137Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form4137Ind</xsl:with-param>
								</xsl:call-template>4137</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">b</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8919Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8919Ind</xsl:with-param>
								</xsl:call-template>8919</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
								</xsl:call-template>
							<span class="sty1040Sch2DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.2mm;">5</div>
						<div class="styLNAmountBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:7mm;">
							Additional tax on IRAs, other qualified retirement plans, and other tax-favored accounts. Attach Form <br />5329 if required
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 6 - Retirement Tax Plan Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />6</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7a</div>
						<div class="styLNDesc">
							Household employment taxes. Attach Schedule H 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">7a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Repayment of first-time homebuyer credit from Form 5405. Attach Form 5405 if required 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">7b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:auto;">
							Taxes from: 
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">a</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8959Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8959Ind</xsl:with-param>
								</xsl:call-template>Form 8959</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">b</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8960Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
									<xsl:with-param name="BackupName">F1040Sch1Form8960Ind</xsl:with-param>
								</xsl:call-template>Form 8960</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
								</xsl:call-template>
							<br />
							<strong>c</strong>
							<input type="checkbox" class="styCkboxNM" style="margin-left:2mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
									<xsl:with-param name="BackupName">F1040Sch1OtherTaxCdInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
									<xsl:with-param name="BackupName">F1040Sch1OtherTaxCdInd</xsl:with-param>
								</xsl:call-template>Instructions; enter code(s)</label>
							<span style="width:95mm;border-bottom:1px solid black;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Frm89598960OtherTaxAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.2mm;padding-top:1.5mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:8.2mm;padding-top:1.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm89598960OtherTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:98mm;">
							Section 965 net tax liability installment from Form 965-A
							<span class="sty1040Sch2DotLn">......</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965TaxInstallmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:7mm;">
							Add lines 4 through 8. These are your <strong>total other taxes. </strong> Enter here and on Form 1040 or 1040-SR, <br />line 15
							<span class="sty1040Sch2DotLn">...............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />10</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71478U</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 2 (Form 1040 or 1040-SR) 2019</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Exempt Self-Employment Tax Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6 - Retirement Tax Plan Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
						</xsl:call-template>
					</table>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
