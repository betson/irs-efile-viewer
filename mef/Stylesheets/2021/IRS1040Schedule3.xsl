<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 08/24/2021 -->
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
								20<span class="styTYColor">21</span>
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
						<div class="styLNDesc" style="width:138mm;font-size:7.8pt;">
							Foreign tax credit. Attach Form 1116 if required 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">................</span>
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
						<div class="styLNDesc" style="font-size:7.8pt">
							Credit for child and dependent care expenses from Form 2441, line 11. Attach Form 2441 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.</span>
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
						<div class="styLNDesc" style="font-size:7.8pt;">
							Education credits from Form 8863, line 19
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..................</span>
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
						<div class="styLNDesc" style="font-size:7.8pt">
							Retirement savings contributions credit. Attach Form 8880 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">............</span>
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
						<div class="styLNDesc" style="font-size:7.8pt">
							Residential energy credits. Attach Form 5695 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.................</span>
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
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other nonrefundable credits: 
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							General business credit. Attach Form 3800
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAllowedAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.......</span>		
						</div>
						<div class="styLNRightNumBox">6a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAllowedAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Credit for prior year minimum tax. Attach Form 8801
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/MinAMTCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/MinAMTCrAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 6c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">c</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Adoption credit. Attach Form 8839
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AdoptionCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..........</span>		
						</div>
						<div class="styLNRightNumBox">6c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdoptionCreditAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 6d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;font-size:8pt">
							Credit for the elderly or disabled. Attach Schedule R
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForElderlyOrDisabledAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">6d</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForElderlyOrDisabledAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">
						</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					<!-- Line 6e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Alternative motor vehicle credit. Attach Form 8910
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox">6e</div>
						<div class="styLNAmountBox" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/PersonalUsePartOfCreditAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>																																								
					<!-- Line 6f -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">f</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Qualified plug-in motor vehicle credit. Attach Form 8936
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPersnlUsePrtCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..</span>		
						</div>
						<div class="styLNRightNumBox">6f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPersnlUsePrtCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6g -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">g</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Mortgage interest credit. Attach Form 8396
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/MortgageInterestCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.......</span>		
						</div>
						<div class="styLNRightNumBox">6g</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MortgageInterestCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6h -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">h</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							District of Columbia first-time homebuyer credit. Attach Form 8859
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCurrentYearCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">6h</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DCHmByrCurrentYearCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 6i -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">i</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Qualified electric vehicle credit. Attach Form 8834
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox">6i</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6j -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">j</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Alternative fuel vehicle refueling property credit. Attach Form 8911
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPersonalUsePartOfCrAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">6j</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPersonalUsePartOfCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 6k -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">k</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Credit to holders of tax credit bonds. Attach Form 8912
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAllowableCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">...</span>		
						</div>
						<div class="styLNRightNumBox">6k</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAllowableCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6l -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">l</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Amount on Form 8978, line 14. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotRptgYrTxIncreaseDecreaseAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox">6l</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotRptgYrTxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 6z -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">z</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other nonrefundable credits. List type and amount
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:.5mm"/>
							<span style="width:20mm;border-bottom:1px solid black;">
								<xsl:if test="count($FormData/OtherNonrefundableCreditsGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 6z - Other Nonrefundable Credits Text</xsl:with-param>
										<xsl:with-param name="TargetNode"
											select="$FormData/OtherNonrefundableCreditsGrp/OtherNonrefundableCreditsTxt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 6z - Other Nonrefundable Credits Amount</xsl:with-param>
										<xsl:with-param name="TargetNode"
											select="$FormData/OtherNonrefundableCreditsGrp/OtherNonrefundableCreditsAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/OtherNonrefundableCreditsGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 6z - Other Nonrefundable Credits Groups </xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/OtherNonrefundableCreditsGrp"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<br/>
							<span style="width:95mm;border-bottom:1px solid black;"></span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">6z</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotOthNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="font-size:8pt">
							Total other nonrefundable credits. Add lines 6a through 6z
							<span class="sty1040Sch3DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/OtherCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="font-size:8pt">
							Add lines 1 through 5 and 7. Enter here and on Form 1040, 1040-SR, or 1040-NR, line 20
							<span class="sty1040Sch3DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<span style="width:146mm"/><span style="font-size:10pt;font-style:italic">(continued on page 2)</span>
					<!-- Page 1 Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see	your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71480G</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 3 (Form 1040) 2021
						</span>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;font-size:7pt;font-family:Verdana;">Schedule 3 (Form 1040) 2021
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt">2</span></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Other Payments and Refundable Credits</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">9</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Net premium tax credit. Attach Form 8962 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode"
									select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
									select="$FormData/ReconciledPremiumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="font-size:8pt">
							Amount paid with request for extension to file (see instructions)
							<span class="sty1040Sch3DotLn">...........</span>
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
						<div class="styLNDesc" style="font-size:8pt">
							Excess social security and tier 1 RRTA tax withheld
							<span class="sty1040Sch3DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
									select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:.75mm;">12</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Credit for federal tax on fuels. Attach Form 4136 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">...............</span>
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
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other payments or refundable credits: 
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 13a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Form 2439
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxPaidByRICOrREITAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..................</span>		
						</div>
						<div class="styLNRightNumBox">13a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxPaidByRICOrREITAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>				
					<!-- Line 13b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Qualified sick and family leave credits from Schedule(s) H and <br/>Form(s) 7202 for leave taken before April 1, 2021
							<span class="sty1040Sch3DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">13b</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/TotalRfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>		
					<!-- Line 13c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="padding-top:3px">c</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Health coverage tax credit from Form 8885
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HealthCoverageTaxCreditAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">.......</span>		
						</div>
						<div class="styLNRightNumBox">13c</div>
						<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/HealthCoverageTaxCreditAmt"/>
						</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 13d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;padding-top:1mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;font-size:8pt">
							Credit for repayment of amounts included in income from earlier years
							<span class="sty1040Sch3DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.4mm;padding-top:4.4mm">13d</div>
						<div class="styLNAmountBox" style="height:8.4mm;padding-top:4.4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8.4mm;background-color:lightgrey;">
						</div>
						<div class="styLNAmountBoxNBB" style="height:8.4mm;"></div>
					</div>		
					<!-- Line 13e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Reserved for future use
							<span class="sty1040Sch3DotLn">...............</span>		
						</div>
						<div class="styLNRightNumBox">13e</div>
						<div class="styLNAmountBox" style="background-color:lightgrey" >
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/DeferralSelfAndHsldEmplmnTxAmt"/>
							</xsl:call-template>-->						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 13f -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">f</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Net section 965 inclusions
							<span class="sty1040Sch3DotLn">..............</span>		
						</div>
						<div class="styLNRightNumBox">13f</div>
						<div class="styLNAmountBox" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/NetSection965TaxLiabilityAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 13g -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">g</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Credit for child and dependent care expenses from Form 2441, line 10. Attach Form 2441
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RfdblCrForChildAndDepdCareAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch3DotLn">..............</span>		
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">13g</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/RfdblCrForChildAndDepdCareAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 13h -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">h</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Qualified sick and family leave credits from Schedule(s) H and <br/>Form(s) 7202 for leave taken after March 31, 2021
							<span class="sty1040Sch3DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">13h</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 13z -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">z</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other payments or refundable credits. List type and amount
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:.5mm"/>
							<span style="width:5mm;border-bottom:1px solid black;">
							</span>
							<br/>
							<span style="width:95mm;border-bottom:1px solid black;">
								<xsl:if test="count($FormData/OthPymtOrRefundableCrGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 13z - Other Payment Or Refundable Credits Group</xsl:with-param>
										<xsl:with-param name="TargetNode"
											select="$FormData/OthPymtOrRefundableCrGrp/OthPymtOrRefundableCrCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 13z - Other Payment Or Refundable Credits Amount</xsl:with-param>
										<xsl:with-param name="TargetNode"
											select="$FormData/OthPymtOrRefundableCrGrp/OthPymtOrRefundableCrAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/OthPymtOrRefundableCrGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 13z - Other Payment Or Refundable Credits Group </xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/OthPymtOrRefundableCrGrp"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">13z</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/TotOthPymtOrRefundableCrAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="font-size:8pt">
							Total Other payments or refundable credits. Add lines 13a through 13z
							<span class="sty1040Sch3DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/OtherPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>																																								
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="font-size:8pt">
							Add lines 9 through 12 and 14. Enter here and on Form 1040, 1040-SR, or 1040-NR, line 31
						</div>
						<div class="styLNRightNumBoxNBB">15</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see
							your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71480G</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 3 (Form 1040) 2021
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
						<br/>
						<br/>
						<xsl:if test="count($FormData/OtherNonrefundableCreditsGrp) &gt; 1">
						  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<br/><br/><br/>
							<span class="styRepeatingDataTitle">Line 6z - Other Nonrefundable Credits Group </span>
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Nonrefundable Credits Text
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Nonrefundable Credits Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherNonrefundableCreditsGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherNonrefundableCreditsTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherNonrefundableCreditsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						  </table>
						</xsl:if>
						<xsl:if test="count($FormData/OthPymtOrRefundableCrGrp) &gt; 1">
						  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<br/><br/><br/>
							<span class="styRepeatingDataTitle">Line 13z - Other Payment Or Refundable Credits Group </span>
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Payment Or Refundable Credit Code
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Payment Or Refundable Credit Amount 
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OthPymtOrRefundableCrGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OthPymtOrRefundableCrCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OthPymtOrRefundableCrAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						  </table>
						</xsl:if>
					</table>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
