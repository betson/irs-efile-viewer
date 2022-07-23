<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 09/04/2019 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8805Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8805"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 8805"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8805Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8805">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styFNBox" style="width:26.0mm;height:24mm;">
							Form <span class="styFN" style="display:inline;">8805</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">(Rev. November 2019)</span>
							<span class="styAgency" style="margin-top:.5mm;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123mm;height:24mm;">
							<span class="styFST" style="font-size:12pt;">Foreign Partner's Information Statement <br/>of Section 1446 Withholding Tax</span>
							<br/>
							<span class="styFBT">
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/> Go to <em>www.irs.gov/Form8805</em> for instructions and the latest information.</span>
							<br/>
							<span style="margin-top:1mm;">
								For partnership's calendar year <span style="min-width:8mm;"/> , or tax year beginning 
								<span style="min-width:11mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxPeriodBeginDt"/>
									</xsl:call-template>
								</span>
								and ending 
								<span style="min-width:11mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxPeriodEndDt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="styTYBox" style="width:32mm;height:24mm;">
							<div class="styOMB" style="height:8mm;padding-top:9px;">OMB No. 1545-0123</div>
							<div class="styAgency" style="text-align:center;height:10mm;padding-top:9px">
								<strong>Copy A </strong> for Internal Revenue Service <br/>Attach to Form 8804.
							</div>
						</div>
					</div>
					<!-- Begin Form -->
					<div class="styStdDiv" style="overflow:visible;">
						<!-- Left section, 1a - 4 -->
						<div style="width:93.5mm;float:left;">
							<!-- 1a -->
							<div class="styGenericDiv" style="width:59mm;border-right:1px solid black;">
								<span class="styLNLeftNumBoxSD" style="padding-top:0px;">1a</span>
								<span style="width:50mm;">
									Foreign partner's name<br/>
									<xsl:choose>
										<xsl:when test="normalize-space($FormData/Sect1446WTForeignPartnerGrp/PartnerName) != '' ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="normalize-space($FormData/Sect1446WTForeignPartnerGrp/PartnerPersonNm) != '' ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerPersonNm"/>
											</xsl:call-template>
											<br/>&#8194;
										 </xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>&#8194;
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<!-- 1b -->
							<div class="styGenericDiv" style="width:34mm;">
								<span class="styLNLeftLtrBox" style="width:4mm;padding-left:1mm;padding-top:0px;">b</span>
								U.S. identifying number<br/>
								<xsl:choose>
									<xsl:when test="normalize-space($FormData/Sect1446WTForeignPartnerGrp/MissingSSNEINReasonCd) != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/MissingSSNEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($FormData/Sect1446WTForeignPartnerGrp/PartnerSSN) != '' ">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($FormData/Sect1446WTForeignPartnerGrp/PartnerEIN) != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<!--1c -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="padding-top:0px;">c</div>
								<div style="width:85mm;">
									Address (if a foreign address, see instructions)<br/>
									<xsl:choose>
										<xsl:when test="$FormData/Sect1446WTForeignPartnerGrp/PartnerUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!-- Assume Foreign -->
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- 2 -->
							<div style="width:100%;border-top:1px solid black;min-height:8mm;">
								<div class="styLNLeftNumBoxSD" style="padding-top:0px;">2</div>
								<div style="width:85mm;">
									Account number assigned by partnership (if any) <br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/AccountNum"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 3 -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftNumBoxSD">3</div>
								<div style="width:85mm;padding-top:2px;">
									Type of partner (specify&#8212;see instructions) <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/PartnerTypeCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 4 -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftNumBoxSD" style="padding-top:0px;">4</div>
								<div style="width:85mm;">
									Country code of partner (enter two-letter code; see instructions)<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Sect1446WTForeignPartnerGrp/ForeignCountryOrUSPossessionCd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Right section, 5a - 7 -->
						<div style="width:93.5mm;float:left;border-left:1px solid black;">
							<!-- 5a -->
							<div class="styGenericDiv" style="width:50mm;border-right:1px solid black;">
								<span class="styLNLeftNumBox" style="padding-top:0px;">5a</span>
								<span style="width:40mm;">
									Name of partnership<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- 5b -->
							<div class="styGenericDiv" style="width:43mm;">
							<span style="width:43mm;">
								<span class="styLNLeftLtrBox" style="width:4mm;height:3mm;padding-left:1mm;padding-top:0px;padding-right:4mm;">b</span>
							 U.S. Employer<br/>
							 <span  class="styGenericDiv" style="padding-left:1mm;">Identification Number (EIN)</span></span>
							 <span style="width:40mm;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/PartnershipMissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PartnershipMissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/PartnershipEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							 </span>
							</div>
							<!-- 5c -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="padding-top:0px;">c</div>
								<div style="width:85mm;">
									Address (if a foreign address, see instructions)<br/>
									<xsl:choose>
										<xsl:when test="$FormData/PartnershipUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!-- Assume Foreign -->
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PartnershipForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- 6 -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftNumBox" style="padding-top:0px;">6</div>
								<div style="width:85mm;">
									Withholding agent's name. If partnership is also the withholding agent, enter "SAME" and do not complete line 7.<br/>
									<xsl:choose>
										<xsl:when test="$FormData/Section1446WithholdingAgentGrp">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Section1446WithholdingAgentGrp/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Section1446WithholdingAgentGrp/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/SameAsAboveCd"/>
											</xsl:call-template>
											<br/>&#8194;
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- 7 -->
							<div style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftNumBox" style="padding-top:0px;">7</div>
								<div style="width:85mm;">
									Withholding agent’s U.S. EIN<br/>
									<xsl:choose>
										<xsl:when test="$FormData/Section1446WithholdingAgentGrp/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Section1446WithholdingAgentGrp/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/Section1446WithholdingAgentGrp/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
					</div>
					<!-- Line 8a -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							Check if the partnership identified on line 5a owns an interest in one or more partnerships
							<!-- dots -->
							<span style="float:right;">
								<span style="letter-spacing:3.3mm;font-weight:bold;padding-right:4px;">..............</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OwnIntGreaterOnePartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8805OwnIntGreaterOnePartnershipInd</xsl:with-param>
									</xsl:call-template>
								</label>
								<input type="checkbox" alt="OwnIntGreaterOnePartnership" class="styCkboxNM">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OwnIntGreaterOnePartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8805OwnIntGreaterOnePartnershipInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!-- Line 8b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ECTIExemptInd"/>
									<xsl:with-param name="BackupName">IRS8805ECTIExemptInd</xsl:with-param>
								</xsl:call-template>Check if any of the partnership's effectively connected taxable income (ECTI) is exempt from U.S. tax for the partner identified on line 1a</label>
							<!-- dots -->
							<span style="float:right;">
								<input type="checkbox" alt="ECTIExempt" class="styCkboxNM">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ECTIExemptInd"/>
										<xsl:with-param name="BackupName">IRS8805ECTIExemptInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:140mm;">
							Partnership's ECTI allocable to partner for the tax year (see instructions)
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-right:4px;float:right;">...........</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocableECTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:140mm;height:7.2mm;">
							Total tax credit allowed to partner under section 1446 (see instructions). <strong>Individual and coporate partners:</strong>
							<br/>
							Claim this amount as a credit against your U.S. income tax on Form 1040NR, 1120-F, etc.
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-right:4px;float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;border-bottom:none;">
							<br/>10</div>
						<div class="styLNAmountBox" style="width:30mm;height:7.2mm;border-bottom:none;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch T -->
					<div class="styStdDiv" style="font-weight:bold;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
						Schedule T &#8212; Beneficiary Information (see instructions)
					</div>
					<!-- Line 11 -->
					<div style="width:93.5mm;height:21.5mm;float:left;">
						<!-- 11a -->
						<div class="styGenericDiv" style="width:100%;">
							<span class="styLNLeftNumBox" style="padding-top:0px;">11a</span>
							<span style="width:85mm;">
								Name of beneficiary<br/>
								<xsl:choose>
									<xsl:when test="$FormData/BeneficiaryInformationGrp/BeneficiaryBusinessName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/BeneficiaryBusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/BeneficiaryBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/BeneficiaryPersonNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- 11b -->
						<div class="styGenericDiv" style="width:100%;border-top:1px solid black;">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;padding-top:0px;">b</div>
							U.S. identifying number of beneficiary<br/>
							<xsl:choose>
								<xsl:when test="$FormData/BeneficiaryInformationGrp/SSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/BeneficiaryInformationGrp/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- Missing -->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/MissingSSNEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:93.5mm;height:21.5mm;float:left;border-left:1px solid black;">
						<div class="styLNLeftLtrBox" style="padding-top:0px;">c</div>
						<div style="width:85mm;">
							Address (if a foreign address, see instructions)<br/>
							<xsl:choose>
								<xsl:when test="$FormData/BeneficiaryInformationGrp/USAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/USAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- Assume Foreign -->
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/ForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:140mm;">
							Amount of ECTI on line 9 to be included in the beneficiary's gross income (see instructions)
							<span style="float:right;letter-spacing:3.3mm;font-weight:bold;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom:none;">12</div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/AllocableECTIIncldGrossIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="border-bottom:2px solid black;">13</div>
						<div class="styLNDesc" style="width:140mm;border-bottom:2px solid black;">
							Amount of tax credit on line 10 that the beneficiary is entitled to claim on its return (see instructions)
							<span style="float:right;letter-spacing:3.3mm;font-weight:bold;padding-right:2mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom:2px solid black;">13</div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom:2px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryInformationGrp/TotalAllowedTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End page and form -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:left;">
							<span class="styBoldText" style="font-size:6pt;">For Paperwork Reduction Act Notice, see separate Instructions for Forms 8804, 8805, and 8813.</span>                     
							<span style="width:4mm;"/>  
								  Cat. No. 10078E
						 </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8805</span> (Rev. 11-2019)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
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
