<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 12/20/2020 -->
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
								(Form 1040)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">
								Additional Credits and Payments</span>
							<br /><br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:4px;"/>Attach to Form 1040, 1040-SR, or 1040-NR.
							</span><br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:4px;"/>Go to
								<span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17mm;">
							<div class="styOMB" style="font-size:6pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">20</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">03</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name(s) shown on Form 1040, 1040-SR, or 1040-NR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>						
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Nonrefundable Credits</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">1</div>
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">2</div>
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">3</div>
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">4</div>
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">5</div>
						<div class="styLNDesc">
							Residential energy credits. Attach Form 5695 
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">6</div>
						<div class="styLNDesc">
							Other credits from Form: 
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;
								height:3mm;float:none;">a</span>
							<input type="checkbox" class="styCkboxNM" alt="Form 3800 Indicator" style="">
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
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;
								height:3mm;float:none;">b</span>
							<input type="checkbox" class="styCkboxNM" alt="Form 8801 Indicator" style="">
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
							<span class="styLNLeftLtrBoxDD" style="padding-top:0px;padding-bottom:0px;
								height:3mm;float:none;">c</span>
							<input type="checkbox" class="styCkboxNM" alt="Specific Other Credits Indicator"
								style="margin-right:1mm;">
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
									<xsl:with-param name="TargetNode" 
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement1118 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement1118Cd"/>
								</xsl:call-template>								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8396 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8834 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8839 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8859 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8910 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8911 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8912 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8936 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8978 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8978Cd"/>
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
							Add lines 1 through 6. Enter here and on Form 1040, 1040-SR, or 1040-NR,
								line 20
							<span class="sty1040Sch3DotLn">........</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalNonrefundableCreditsAmt"/>
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
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">8</div>
						<div class="styLNDesc">
							Net premium tax credit. Attach Form 8962 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode"
									select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
									select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Amount paid with request for extension to file (see instructions)
							<span class="sty1040Sch3DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Excess social security and tier 1 RRTA tax withheld
							<span class="sty1040Sch3DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
									select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:.75mm;">11</div>
						<div class="styLNDesc">
							Credit for federal tax on fuels. Attach Form 4136 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:98mm;">
							Other payments or refundable credits: 
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 12a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;">
							Form 2439
							<span class="sty1040Sch3DotLn">....................</span>		
						</div>
						<div class="styLNRightNumBox">12a</div>
						<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxPaidByRICOrREITAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>				
					<!-- Line 12b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Qualified sick and family leave credits from Schedule(s) H and Form(s) 7202
						</div>
						<div class="styLNRightNumBox">12b</div>
						<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode"
								select="$FormData/TotalRfdblCrQlfySLFMLWagesAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 12c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Health coverage tax credit from Form 8885
							<span class="sty1040Sch3DotLn">..........</span>		
						</div>
						<div class="styLNRightNumBox">12c</div>
						<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/HealthCoverageTaxCreditAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 12d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;padding-top:1mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;">
							Other:
							<span style="width:88mm;border-bottom:1px solid black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12d - Credit For Repayment 1 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12d - Credit For Repayment 1 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12d - Credit For Repayment 2 Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12d - Credit For Repayment 2 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentAmt"/>
								</xsl:call-template>							
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">12d</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditForRepaymentAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">
						</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					<!-- Line 12e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Deferral for certain Schedule H or SE filers (see instructions)
							<span class="sty1040Sch3DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox">12e</div>
						<div class="styLNAmountBox" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode"
								select="$FormData/DeferralSelfAndHsldEmplmnTxAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>																																								
					<!-- Line 12f -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">f</div>
						<div class="styLNDesc">
							Add lines 12a through 12e
							<span class="sty1040Sch3DotLn">.........................</span>		
						</div>
						<div class="styLNRightNumBox">12f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>					
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Add lines 8 through 12f. Enter here and on Form 1040, 1040-SR, or 1040-NR, line 31
							<span class="sty1040Sch3DotLn">.......</span>
						</div>
						<div class="styLNRightNumBoxNBB">13</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see
							your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71480G</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 3 (Form 1040) 2020
						</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form"
								onclick="javascript:returnToWriteInImage();"/>
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
							<xsl:with-param name="TargetNode" 
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 1118 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement1118Cd"/>
						</xsl:call-template>						
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8396 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8834 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8839 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8859 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8910 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8911 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8912 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8936 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6c - Credit Forms Statement 8978 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8978Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8 - Divorced Spouse SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8 - Divorced Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12d - Credit For Repayment 1 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 12d - Credit For Repayment 1 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/CreditRepaymentGrp[1]/CreditForRepaymentAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12d - Credit For Repayment 2 Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 12d - Credit For Repayment 2 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/CreditRepaymentGrp[2]/CreditForRepaymentAmt"/>
						</xsl:call-template>
					</table>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
