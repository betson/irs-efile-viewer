<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8885Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8885Data" select="$RtnDoc/IRS8885"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateBulletSpan) -->
	<xsl:template name="PopulateBulletSpan">
		<xsl:attribute name="style">width:100%;height:auto;padding-top:0.8mm;</xsl:attribute>
		<img src="{$ImagePath}/8885_Round_Bullet.gif" alt="Round Bullet"/>
		<span style="width:4px;"/>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateMonthCheckbox) -->
	<xsl:template name="PopulateMonthCheckbox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="Label"/>
		<span style="width:25mm;height:auto;">
			<input type="checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName">
						<xsl:value-of select="$BackupName"/>
					</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:1.5mm;"/>
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName">
						<xsl:value-of select="$BackupName"/>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="$Label"/>
			</label>
		</span>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8885Data)"/>
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
				<meta name="Description" content="IRS Form 8885"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8885Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8885" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8885</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8885Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								<br/>
								Health Coverage Tax Credit
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;">
											<br/>
											<br/>
											<br/>
											<img src="{$ImagePath}/8885_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040, Form 1040NR, Form 1040-SS, or Form 1040-PR.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">11</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">134</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name of recipient (if both spouses are recipients, complete a separate form for each spouse)<br/>
							<xsl:choose>
								<xsl:when test="$Form8885Data/PersonName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8885Data/PersonName"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Recipient's social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form8885Data/RecipientsSSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styTBB" style="width:187mm">
						<div class="styIRS8885LineItem">
							<div class="styIRS8885LNDesc" style="width:100%;padding-left:0px;font-size:8.5pt;">
								<b>Note.</b> See the instructions for line 7 if you received advance (monthly) payments and you are <b>only</b> filing Form
								8885 to claim the additional credit as reported on your Form 1099-H. You will need to include this amount on
								line 7.
							</div>
							<div class="styIRS8885LNDesc" style="width:100%;padding-left:0px;font-size:9pt;">
								<b>
									<span class="styItalicText">Before you begin: </span>
								</b>See <b>Definitions and Special Rules</b> in the instructions.
							</div>
						</div>
					</div>
					<div class="styTBB" style="width:187mm">
						<div class="styIRS8885LineItem" style="padding-top:1.5mm;padding-bottom:1mm;">
							<div class="styIRS8885CleanDiv" style="height:100%;width:auto;">
								<img src="{$ImagePath}/8885_Caution.gif" alt="Caution"/>
							</div>
							<div class="styIRS8885LNDesc" style="width:auto;height:100%;padding-top:6.5mm;">
								<b>Do not </b>complete this form if you can be claimed as a dependent on someone else's 2011 tax return.
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Complete This Part To See if You Are Eligible To Take This Credit
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8885LineItem">
							<div class="styIRS8885LNLeftNumBox">1</div>
							<div class="styIRS8885LNDesc" style="width:181mm;height:100%;">
								Check the boxes below for each month in 2011 that <b>all</b> of the following statements were <b>true</b> on the <b>first day</b> of that month.<br/>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were an eligible trade adjustment assistance (TAA) recipient, alternative TAA (ATAA) recipient, reemployment TAA<br/>
									(RTAA) recipient, or Pension Benefit Guaranty Corporation (PBGC) pension payee; or you were a qualified family member<br/>
									of an individual who fell under one of the categories listed above when he or she passed away or with whom you finalized<br/>
									a divorce.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You and/or your family member(s) were covered by a qualified health insurance plan for which you paid the entire premiums, <br/>
									or your portion of the premiums, directly to your health plan or to "U.S. Treasury–HCTC."
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in Medicare Part A, B, or C, or you were enrolled in Medicare but your family member(s)<br/>
									qualified for the HCTC.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in Medicaid or the Children's Health Insurance Program (CHIP).
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> enrolled in the Federal Employees Health Benefits Program (FEHBP) or eligible to receive benefits under<br/>
									the U.S. military health system (TRICARE).
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You were <b>not</b> imprisoned under federal, state, or local authority.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									Your employer <b>did not</b> pay 50% or more of the cost of coverage.
								</span>
								<span>
									<xsl:call-template name="PopulateBulletSpan"/>
									You <b>did not</b> receive a 65% COBRA premium reduction from your former employer or COBRA administrator.
								</span>
								<span style="width:100%;height:5mm;"/>
								<span style="width:2mm;"/>
								<!-- January -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJanuaryInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJanuaryInd</xsl:with-param>
									<xsl:with-param name="Label">January</xsl:with-param>
								</xsl:call-template>
								<!-- February -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrFebruaryInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrFebruaryInd</xsl:with-param>
									<xsl:with-param name="Label">February</xsl:with-param>
								</xsl:call-template>
								<!-- March -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrMarchInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrMarchInd</xsl:with-param>
									<xsl:with-param name="Label">March</xsl:with-param>
								</xsl:call-template>
								<!-- April -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrAprilInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrAprilInd</xsl:with-param>
									<xsl:with-param name="Label">April</xsl:with-param>
								</xsl:call-template>
								<!-- May -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrMayInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrMayInd</xsl:with-param>
									<xsl:with-param name="Label">May</xsl:with-param>
								</xsl:call-template>
								<!-- June -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJuneInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJuneInd</xsl:with-param>
									<xsl:with-param name="Label">June</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="width:100%;"/>
								<span style="width:2mm;"/>
								<!-- July -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrJulyInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrJulyInd</xsl:with-param>
									<xsl:with-param name="Label">July</xsl:with-param>
								</xsl:call-template>
								<!-- August -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrAugustInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrAugustInd</xsl:with-param>
									<xsl:with-param name="Label">August</xsl:with-param>
								</xsl:call-template>
								<!-- September -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrSeptemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrSeptemberInd</xsl:with-param>
									<xsl:with-param name="Label">September</xsl:with-param>
								</xsl:call-template>
								<!-- October -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrOctoberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrOctoberInd</xsl:with-param>
									<xsl:with-param name="Label">October</xsl:with-param>
								</xsl:call-template>
								<!-- November -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrNovemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrNovemberInd</xsl:with-param>
									<xsl:with-param name="Label">November</xsl:with-param>
								</xsl:call-template>
								<!-- December -->
								<xsl:call-template name="PopulateMonthCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCvrTaxCrDecemberInd"/>
									<xsl:with-param name="BackupName">IRS8885HealthCvrTaxCrDecemberInd</xsl:with-param>
									<xsl:with-param name="Label">December</xsl:with-param>
								</xsl:call-template>
								<span style="width:100%;height:2mm;"/>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Health Coverage Tax Credit
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;font-size:8pt;">
						<!-- (Column Headers) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="padding-bottom:0mm;height:8.6mm;width:187mm;">
							<div class="styIRS8885LNLeftNumBox" style="height:8mm;padding-top:2mm;width:6mm">2</div>
							<div class="styGenericDiv" style="padding-bottom:0mm;padding-left:2mm;padding-right:2mm;padding-top:1mm;width:104.5mm;height:8mm;">
							Enter in each column the amount paid directly to your health plan for qualified health insurance
							coverage for the months checked on line 1 that are included
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0;height:8.6mm"/>
							<div class="styLNAmountBox" style="height:8.6mm;width:34mm">
								<div align="center">Column A</div> 
								<div align="center"></div><div align="center">January and February</div>
							</div>
							<div class="styLNAmountBox" style="height:8.6mm;width:34mm">
								<div align="center">Column B </div><div align="center"> March - December</div>
							</div>
						</div>
						<!-- (2) //////////////////////////////////////////////////-->
						<div class="styIRS8885LineItem" style="height:19mm;padding-top:0mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:17mm;width:6mm"></div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-right:2mm;width:104.5mm;height:19mm;">
								under the heading for the column (see instructions). <b>Do not</b> include on line
								2 any qualified health insurance premiums paid to "U.S. Treasury–HCTC"
								or any insurance premiums on coverage that was actually paid for with a
								National Emergency Grant. Also, <b>do not</b> include any advance (monthly)
								payments or reimbursement credits you received shown on Form 1099-H, box 1
								<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:19mm;padding-top:15mm;padding-bottom:0">2</div>
							<div class="styLNAmountBox" style="height:19mm;padding-top:15mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrJanAndFeb/HealthPlanPaidAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:19mm;width:34mm;padding-bottom:0;padding-top:15mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrMarchToDec/HealthPlanPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (Caution) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm;height:15mm;">
							<div class="styLNLeftNumBoxSD" style="width:6mm"/>
							<div class="styGenericDiv" style="padding-left:2mm;width:20mm;">
								<img src="{$ImagePath}/8885_Caution.gif" alt="Caution"/>
							</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-top:2mm;width:84.5mm;">
								<span class="styItalicText">
									You <b>must</b> attach the required documents listed in the instructions for any
									amounts included on line 2. If you do not attach the required documents,
									your credit will be disallowed.
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:18mm;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:18mm;width:34mm;padding-bottom:0;border-bottom-width:0">
							</div>
							<div class="styLNAmountBox" style="height:18mm;width:34mm;padding-bottom:0;border-bottom-width:0">
							</div>
						</div>
						<!--(3) /////////////////////////////////////////////////// -->
						<div class="styGenericDiv" style="height:16mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:16mm;width:6mm">3</div>
							<div class="styGenericDiv" style="padding-left:2mm;width:104.5mm;padding-right:1mm;">
								Enter in each column the total amount of any Archer MSA or health savings
								accounts distributions used to pay for qualified health insurance coverage
								for the months checked on line 1 that are included under the heading for
								the column
								<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
											<span style="width:8px"/>.
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:16mm;padding-top:12mm;padding-bottom:0">3</div>
							<div class="styLNAmountBox" style="height:16mm;padding-top:12mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrJanAndFeb/HealthPlanPaidWithMSAOrHSAAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:16mm;padding-top:12mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrMarchToDec/HealthPlanPaidWithMSAOrHSAAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (4) //////////////////////////////////////////////////// -->
						<div class="styGenericDiv" style="height:8mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;width:6mm">4</div>
							<div class="styGenericDiv" style="padding-left:2mm;width:104.5mm;height:8mm">
								Subtract line 3 from line 2. If zero or less, enter -0-. If you entered -0- in
								both columns, <b>stop</b>; you cannot take the credit
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
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;padding-bottom:0">4</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrJanAndFeb/HealthPlanPaidLessMSAAndNEGAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrMarchToDec/HealthPlanPaidLessMSAAndNEGAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (5) ///////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="height:5mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5mm;width:6mm;padding-top:0.5mm">5</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-top:0.5mm;width:104.5mm;height:5mm">
								Applicable percentage
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
											
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0;padding-top:1mm;padding-bottom:0">5</div>
							<div class="styLNAmountBox" style="height:5mm;width:34mm;padding-top:1mm;padding-bottom:0">
								.80	
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:34mm;padding-top:1mm;padding-bottom:0">
								.725
							</div>
							
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="height:8mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;width:6mm">6</div>
							<div class="styGenericDiv" style="padding-left:2mm;width:104.5mm;height:8mm">
								Multiply the amount on line 4 in each column by the applicable percentage
								shown on line 5 for that column
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
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;padding-bottom:0">6</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrJanAndFeb/HealthPlanPaidApplicablePctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-bottom:0;width:34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCrMarchToDec/HealthPlanPaidApplicablePctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--(7) //////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="height:22mm;width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:18mm;width:6mm">7</div>
							<div class="styGenericDiv" style="padding-left:2mm;padding-right:1mm;width:138.6mm;height:20mm">
								<b>Health Coverage Tax Credit.</b> If you received an advance (monthly) payment for any month in 2011, 
								add the amount reported in the box to the left of box 8 of your Form 1099-H to the
								total of any amount on line 6 and enter it here. If you received an advance (monthly) 
								payment for any month not checked on line 1, see the instructions for line 7 for more details.
								Otherwise, add the amounts on line 6. Enter the result here and on Form 1040, line 71 
								(check box d); Form 1040NR, line 67 (check box d); Form1040-SS, line 9; or Form 1040-PR, line 9.
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
											<span style="width:11px"/>.
										</span>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;padding-top:18mm;padding-bottom:0;border-bottom-width:0">7</div>
							<div class="styLNAmountBox" style="padding-top:18mm;padding-bottom:0;height:22mm;width:34mm;border-bottom-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8885Data/HealthCoverageTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see your tax return instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8885</span> (2011)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 34641D
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8885Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
