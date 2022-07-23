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
	<xsl:include href="IRS1040Schedule3Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040Schedule3" />
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
				<meta name="Description" content="IRS Form 1040 Schedule 3" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule3Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040Schedule3">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:17mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:7pt;">
								<span style="font-size:10pt;">SCHEDULE 3</span>
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
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">Additional Credits and Payments</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 1040 or 1040-SR.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
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
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">03</span>
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
						<div class="styPartDesc">Nonrefundable Credits</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Foreign tax credit. Attach Form 1116 if required 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Credit for child and dependent care expenses. Attach Form 2441 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Education credits from Form 8863, line 19
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Retirement savings contributions credit. Attach Form 8880 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Residential energy credit. Attach Form 5695 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:4.4mm;">
							Other credits from Form: 
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">a</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form3800Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form3800Ind</xsl:with-param>
								</xsl:call-template>3800</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">b</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form8801Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form8801Ind</xsl:with-param>
								</xsl:call-template>8801</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">c</span>
							<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" alt="Specific Other Credits">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
									<xsl:with-param name="BackupName">F1040Sch3SpecificOtherCreditsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:48mm;border-bottom:1px solid black;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement Schedule R Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8396 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8834 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8839 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8859 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8910 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8911 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8912 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8936 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8978 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8978Cd"/>
								</xsl:call-template>
								&nbsp;
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">6</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Add lines 1 through 6. Enter here and include on Form 1040 or 1040-SR, line 13b
							<span class="sty1040Sch3DotLn">........</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Other Payments and Refundable Credits</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							2019 estimated tax payments and amount applied from 2018 return
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 8 - Divorced Spouse SSN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 8 - Divorced Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Net premium tax credit. Attach Form 8962 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Amount paid with request for extension to file (see instructions)
							<span class="sty1040Sch3DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Excess social security and tier 1 RRTA tax withheld
							<span class="sty1040Sch3DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Credit for federal tax on fuels. Attach Form 4136 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="height:4.4mm;">
							Credits from Form: 
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">a</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form2439Ind</xsl:with-param>
								</xsl:call-template>2439</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">b</span>
							<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Reserved"/>
									<xsl:with-param name="BackupName">F1040Sch3Reserved</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Reserved"/>
									<xsl:with-param name="BackupName">F1040Sch3Reserved</xsl:with-param>
								</xsl:call-template>Reserved</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Reserved"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">c</span>
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form8885Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">F1040Sch3Form8885Ind</xsl:with-param>
								</xsl:call-template>8885</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
								</xsl:call-template>
							<span style="width:1mm;height:3mm;"/>
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;height:3mm;float:none;">d</span>
							<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" alt="Other Payments">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
									<xsl:with-param name="BackupName">F1040Sch3OtherPaymentsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:26mm;border-bottom:1px solid black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 13 - Credit For Repayment 1 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 13 - Credit For Repayment 1 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 13 - Credit For Repayment 2 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 13 - Credit For Repayment 2 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentAmt"/>
								</xsl:call-template>
								&nbsp;
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">13</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Add lines 8 through 13. Enter here and on Form 1040 or 1040-SR, line 18d
							<span class="sty1040Sch3DotLn">..........</span>
						</div>
						<div class="styLNRightNumBoxNBB">14</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71478U</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 3 (Form 1040 or 1040-SR) 2019</span>
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
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement Schedule R Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8396 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8834 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8839 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8859 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8910 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8911 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8912 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8936 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8978 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8978Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8 - Divorced Spouse SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8 - Divorced Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 13 - Credit For Repayment 1 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 13 - Credit For Repayment 1 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 13 - Credit For Repayment 2 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 13 - Credit For Repayment 2 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentAmt"/>
						</xsl:call-template>
					</table>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
