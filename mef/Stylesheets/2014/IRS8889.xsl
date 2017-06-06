<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/20/2014 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8889Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8889Data" select="$RtnDoc/IRS8889"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8889Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8889"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8889Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8889">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22.2mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;font-size:8pt;">
								Form<span class="styFormNumber">  8889</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8889Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">Health Savings Accounts (HSAs)</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:0mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:4mm;padding-left:0px;margin-top:1mm;">
										<div style="width:99%;height:4mm;float:left;">
											<img src="{$ImagePath}/8889_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 8889 and its separate instructions is available at <i>www.irs.gov/form8889</i>.
										</div>
										<div style="width:99%;height:4mm;float:left;">
											<img src="{$ImagePath}/8889_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040 or Form 1040NR.																						
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.2mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">14</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">53</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Name/SSN Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:105mm;height:9mm;font-size:7pt;">
							Name(s) shown on Form 1040 or Form 1040NR<br/>
							<xsl:choose>
								<xsl:when test="$Form8889Data/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8889Data/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:50mm;height:9mm;font-size:7pt;padding-left:2mm;font-weight:normal;">
							Social security number of HSA<br/>beneficiary. If both spouses have<br/>HSAs, see instructions
							<span style="width:2px;"/>
							<img src="{$ImagePath}/8889_Bullet_Sm.gif" alt="SmallBullet"/>
						</div>
						<div class="styEINBox" style="width:30mm;height:9mm;font-size:7pt;padding-left:2mm;padding-top:3mm;">
							<span class="styEINFld" style="width:30mm; text-align:center;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form8889Data/RecipientSSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form8889Data/RecipientSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Name/SSN Header -->
					<!-- Begin Instruction (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartDesc" style="padding-left:1mm;padding-top:2mm; padding-bottom:2mm;">
							<span class="styItalicText">
								Before you begin: 
							</span>
							<span class="styNormalText">
								Complete Form 8853, Archer MSAs and Long-Term Care Insurance Contracts, if required. 
							</span>
						</div>
					</div>
					<!-- End Instruction (Header)-->
					<!-- Begin Part I (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:5mm;padding-top:0mm;padding-bottom:2mm;width:171mm">
							HSA Contributions and Deduction. 
							<span class="styNormalText">
								See the instructions before completing this part. If you are filing jointly<br/>
								and both you and your spouse each have separate HSAs, complete a separate Part I for each spouse.
							</span>
						</div>
					</div>
					<!-- End Part I (Header)-->
					<!-- Part I (Body) -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">1</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Check the box to indicate your coverage under a high-deductible health plan (HDHP) during<br/>
									2014 (see instructions)
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
								<span style="width:3px;"/>
								<img src="{$ImagePath}/8889_Bullet_Md.gif" alt="Bullet Image"/>
							</div>
							<!--+++++++++++++++++++ Yes/No Checkboxes +++++++++++++++++++-->
							<div class="styIRS8889LNDesc" style="width:42mm;padding-left:0px;">
								<div class="styIRS8889LNDesc" style="width:22mm;padding-top:3mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPSelfOnlyCoverageInd"/>
											<xsl:with-param name="BackupName">IRS8889HDHPSelfOnlyCoverageInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPSelfOnlyCoverageInd"/>
											<xsl:with-param name="BackupName">IRS8889HDHPSelfOnlyCoverageInd</xsl:with-param>
										</xsl:call-template>
										Self-only
									</label>
								</div>
								<div class="styIRS8889LNDesc" style="width:19mm;padding-top:3mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPFamilyCoverageInd"/>
											<xsl:with-param name="BackupName">IRS8889HDHPFamilyCoverageInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPFamilyCoverageInd"/>
											<xsl:with-param name="BackupName">IRS8889HDHPFamilyCoverageInd</xsl:with-param>
										</xsl:call-template>
										Family
									</label>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1-->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">2</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									HSA contributions you made for 2014 (or those made on your behalf), including those made<br/>
									from January 1, 2015, through April 15, 2015, that were for 2014. <span class="styBoldText">Do not</span> include employer<br/>
									contributions, contributions through a cafeteria plan, or rollovers (see instructions)
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;border-top-width:1px;border-top-color:#000000;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;border-top-width:1px;border-top-color:#000000;"/>
								<div class="styLNRightNumBox" style="height:4mm;">2</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSAContributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2-->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">3</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									If you were under age 55 at the end of 2014, and on the first day of <span class="styBoldText">every</span> month during 2014,<br/>
									you were, or were considered, an eligible individual with the <span class="styBoldText">same</span> coverage, enter $3,300<br/>
									($6,550 for family coverage). <span class="styBoldText">All others,</span> see the instructions for the amount to enter
									<span style="width:1px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:12px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">3</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSALimitedAnnualDeductibleAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3-->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">4</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Enter the amount you and your employer contributed to your Archer MSAs for 2014 from Form<br/>
									8853, lines 1 and 2. If you or your spouse had family coverage under an HDHP at any time<br/>
									during 2014, also include any amount contributed to your spouse&#8221;s Archer MSAs
									<span style="width:1px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:13px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">4</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/TotalArcherMSAContributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4-->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">5</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Subtract line 4 from line 3. If zero or less, enter -0-
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:9px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">5</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/HSALimitedDeductibleAllwdAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5-->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">6</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Enter the amount from line 5. But if you and your spouse each have separate HSAs and had<br/>
									family coverage under an HDHP at any time during 2014, see the instructions for the amount to<br/>
									enter
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">6</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSAFamilyDeductibleAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6-->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">7</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									If you were age 55 or older at the end of 2014, married, and you or your spouse had family<br/>
									coverage under an HDHP at any time during 2014, enter your additional contribution amount<br/>
									(see instructions)
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">7</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSAAddnlContributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7-->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">8</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Add lines 6 and 7
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:8px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">8</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/HSALimitedGrossContributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8-->
						<!-- Begin (Line) 9 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox">9</div>
							<div class="styIRS8889LNDesc" style="width:96mm;height:4mm;">
									Employer contributions made to your HSAs for 2014
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:17px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">9</div>
							<div class="styLNAmountBox" style="width:33mm;padding-right:8px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/HSAEmployerContributionAmt"/>
								</xsl:call-template>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:4.5mm;width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 9-->
						<!-- Begin (Line) 10 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">10</div>
							<div class="styIRS8889LNDesc" style="width:96mm;height:4mm;">
									Qualified HSA funding distributions
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:19px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">10</div>
							<div class="styLNAmountBox" style="width:33mm;padding-right:8px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/HSAQualifiedFundingDistriAmt"/>
								</xsl:call-template>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;"/>
								<div class="styLNAmountBox" style="height:2mm;width:33mm;"/>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 10 -->
						<!-- Begin (Line) 11 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">11</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Add lines 9 and 10
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:18px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/TotalHSAContributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 11-->
						<!-- Begin (Line) 12 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">12</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Subtract line 11 from line 8. If zero or less, enter -0-
									<span style="width:3px"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">12</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/HSALimitedContributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 12-->
						<!-- Begin (Line) 13 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem" style="">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;padding-top:1.5mm">13</div>
							<div class="styIRS8889LNDesc" style="height:4mm;padding-top:1.5mm;width:137mm">
								<span class="styBoldText">HSA deduction.</span> Enter the <span class="styBoldText">smaller</span> 
								 of line 2 or line 12 here and on Form 1040, line 25, or Form<br/>1040NR, line 25
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:13px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
								<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">13</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/TotalHSADeductionAmt"/>
									</xsl:call-template>
								</div>
						</div>
						<div class="styIRS8889LineItem" style="">
							<div class="styIRS8889LNLeftNumBox">
								<span style="width:4mm"/>
							</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<span class="styBoldText">Caution: </span>
								<span class="styItalicText">If line 2 is more than line 13, you may have to pay an additional tax (see
									instructions).</span>
								<span style="width:3px;"/>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="background-color:lightgrey;height:2mm;width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 13-->
					</div>
					<!-- Begin Part II (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:5mm;padding-top:0mm;padding-bottom:2mm;width:171mm">
							HSA Distributions. <span class="styNormalText">If you are filing jointly and both you and your spouse each have 
							separate HSAs, complete<br/> a separate Part II for each spouse.</span>
						</div>
					</div>
					<!-- End Part II (Header)-->
					<!-- Part II (Body) -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 14a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">14a</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Total distributions you received in 2014 from all HSAs (see instructions)
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">14a</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/TotalHSADistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14a-->
						<!-- Begin (Line) 14b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:5mm;">b</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Distributions included on line 14a that you rolled over to another HSA. Also include any excess<br/>
									contributions (and the earnings on those excess contributions) included on line 14a that were<br/>
									withdrawn by the due date of your return (see instructions)
									<span style="width:1px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">14b</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSADistributionRolloverAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14b-->
						<!-- Begin (Line) 14c -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:5mm;">c</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Subtract line 14b from line 14a
									<span style="width:1px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;">14c</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSANetDistributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14c-->
						<!-- Begin (Line) 15 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">15</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Unreimbursed qualified medical expenses (see instructions)
									<span style="width:3px"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:18px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">15</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8889Data/UnreimbQualMedAndDentalExpAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 15-->
						<!-- Begin (Line) 16 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">16</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<span class="styBoldText">Taxable HSA distributions.</span> Subtract line 15 from line 14c. If zero or less, enter -0-. Also,<br/>
									include this amount in the total on Form 1040, line 21, or Form 1040NR, line 21. On the dotted<br/>
									line next to line 21, enter &#8220;HSA&#8221; and the amount
									<span style="width:9px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">16</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/TaxableHSADistributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 16-->
						<!-- Begin (Line) 17a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">17a</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSADistriAddnlPercentTaxExcInd"/>
										<xsl:with-param name="BackupName">IRS8889HSADistriAddnlPercentTaxExcInd</xsl:with-param>
									</xsl:call-template>
									If any of the distributions included on line 16 meet any of the <span class="styBoldText">Exceptions to the Additional<br/>
									20% Tax</span> (see instructions), check here
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
									<span style="width:5px"/>
									<img src="{$ImagePath}/8889_Bullet_Md.gif" alt="Bullet Image"/>
									<span style="width:7px"/>
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSADistriAddnlPercentTaxExcInd"/>
										<xsl:with-param name="BackupName">IRS8889HSADistriAddnlPercentTaxExcInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 17a-->
						<!-- Begin (Line) 17b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:5mm;">b</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<span class="styBoldText">Additional 20% tax</span> (see instructions). Enter 20% (.20) of the distributions included on line 16<br/>
									that are subject to the additional 20% tax. Also include this amount in the total on Form 1040,<br/>
									line 60, or Form 1040NR, line 59. On the dotted line next to Form 1040, line 60, or Form<br/>
									1040NR, line 59, enter &#8220;HSA&#8221; and the amount
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;">17b</div>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HSADistriAddnlPercentTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 17b-->
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:13mm;"/>                        
							Cat. No. 37621P
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8889</span> (2014)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8889 (2014)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- Begin Part III (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:5mm;padding-top:0mm;padding-bottom:2mm;width:171mm">
							Income and Additional Tax for Failure To Maintain HDHP Coverage. <span class="styNormalText">See the instructions<br/>
							before completing this part. If you are filing jointly and both you and your spouse each have separate HSAs,<br/>
							complete a separate Part III for each spouse.</span>
						</div>
					</div>
					<!-- End Part II (Header)-->
					<!-- Part II (Body) -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 18 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNDesc" style="height:4mm;width:145mm;"/>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">18</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Last-month rule
									<span style="width:9px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;">18</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPCoverageFailPartialYrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 18-->
						<!-- Begin (Line) 19 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNDesc" style="height:4mm;width:145mm;"/>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">19</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
									Qualified HSA funding distribution
									<span style="width:5px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;">19</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPCoverageFailFundDistriAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 19-->
						<!-- Begin (Line) 20 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNDesc" style="height:4mm;width:145mm;"/>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">20</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<span class="styBoldText">Total income.</span> Add lines 18 and 19. Include this amount on Form 1040, line 21, or Form<br/>
								1040NR, line 21. On the dotted line next to Form 1040, line 21, or Form 1040NR, line 21, enter<br/>
								&#8220;HSA&#8221; and the amount
									<span style="width:12px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">20</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPCoverageIncomeAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 20-->
						<!-- Begin (Line) 21 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNDesc" style="height:4mm;width:145mm;"/>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;"/>
							</span>
						</div>
						<div class="styIRS8889LineItem">
							<div class="styIRS8889LNLeftNumBox" style="padding-left:2mm;">21</div>
							<div class="styIRS8889LNDesc" style="height:4mm;width:137mm">
								<span class="styBoldText">Additional tax.</span> Multiply line 20 by 10% (.10). Include this amount in the total on Form 1040, line<br/>
								60, or Form 1040NR, line 59. On the dotted line next to Form 1040, line 60, or Form 1040NR,<br/>
								line 59, enter &#8220;HDHP&#8221; and the amount
								<span style="width:4px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:20px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<span style="padding-top:1px;">
								<div class="styLNRightNumBox" style="height:6.5mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:6.5mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;">21</div>
								<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8889Data/HDHPCoverageAddnlTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 22-->
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8889</span> (2014)
						</div>
					</div>
					<br/>
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form8889Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>