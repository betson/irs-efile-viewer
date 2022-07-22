<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5405Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5405Data" select="$RtnDoc/IRS5405"/>
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
						<xsl:with-param name="RootElement" select="local-name($Form5405Data)"/>
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
				<meta name="Description" content="IRS Form 5405"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5405Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5405" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  5405</span>
							</div>
							<span class="styAgency">(Rev. December 2011)</span>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5405Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								First-Time Homebuyer Credit and<br/>
								Repayment of the Credit
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;">
											<br/><br/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to your 2010 or 2011 Form 1040, Form 1040NR, or Form 1040X.
											<br/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/> 
											See separate instructions.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22mm;">
							<div class="styOMB" style="height:50%;font-size:7pt;padding-top:3mm;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:50%;padding-top:3.5mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">58</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNDesc" style="width:100%;height:auto;padding-left:12mm;">
								<b>Note.</b> Skip this page and complete page 2 if you are only filing this form to (1) report a disposition or change in use of your main<br/>
								home for which you claimed the credit in 2008, 2009, or 2010, or (2) repay the credit.
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5405Data/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							General Information
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (A) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">A</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Address of home qualifying for the credit (if different from the address shown on page 1 of Form 1040 or Form 1040X)
									</div>
								</div>
							</div>
						</div>
						<div class="styIRS5405LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS5405CleanDiv" style="width:100%;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 3px;word-wrap:break-word;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeQualifyingForCreditAddress"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (B) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">B</div>
							<div class="styIRS5405CleanDiv" style="width:151mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Date purchased (MM/DD/YYYY) (see instructions)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405LNDesc" style="width:30mm;height:100%;padding-left:0px;padding-top:1px;float:right;">
								<span style="border-color:black;border-style:solid;border-width:0px 0px 1px 0px;height:100%;width:100%;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form5405Data/AssetOwnershipPurchasedDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styIRS5405LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										<b>Note.</b> If the date purchased is before May 1, 2011, go to line D. Otherwise, go to line C.
									</div>
								</div>
							</div>
						</div>
						<!-- (C) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS5405LNLeftNumBox">C</div>
							<div class="styIRS5405LNDesc" style="width:181mm;">
								If the date purchased is after April 30, 2011, and before July 1, 2011, did you enter into a binding contract before<br/>
								May 1, 2011, to purchase the home before July 1, 2011? 
								<xsl:if test="$Form5405Data/BindingContractBeforeCutOffInd/@referenceDocumentName">
									<span style="width:4px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
											<xsl:with-param name="BackupName">IRS5405BindingContractBeforeCutOffInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
										<xsl:with-param name="BackupName">IRS5405BindingContractBeforeCutOffInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes. </b>Go to line D. See instructions for documentation to be attached.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
											<xsl:with-param name="BackupName">IRS5405BindingContractBeforeCutOffInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5405Data/BindingContractBeforeCutOffInd"/>
										<xsl:with-param name="BackupName">IRS5405BindingContractBeforeCutOffInd</xsl:with-param>
									</xsl:call-template>
									<b>No. </b>You cannot claim the credit. Do not file Form 5405.
								</label>
							</div>
						</div>
						<!-- (D) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS5405LNLeftNumBox">D</div>
							<div class="styIRS5405LNDesc" style="width:181mm;">
								Were you (or your spouse if married) on qualified official extended duty outside the United States for at least 90 days during the<br/>
								period beginning after December 31, 2008, and ending before May 1, 2010, as a member of the uniformed services or Foreign<br/>
								Service, or an employee of the intelligence community? See instructions.
								<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
											<xsl:with-param name="BackupName">IRS5405HomePurchaseMilitaryExtDutyInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
										<xsl:with-param name="BackupName">IRS5405HomePurchaseMilitaryExtDutyInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes. </b>Go to line E.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
											<xsl:with-param name="BackupName">IRS5405HomePurchaseMilitaryExtDutyInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseMilitaryExtDutyInd"/>
										<xsl:with-param name="BackupName">IRS5405HomePurchaseMilitaryExtDutyInd</xsl:with-param>
									</xsl:call-template>
									<b>No. </b>You cannot claim the credit. Do not file Form 5405.
								</label>
							</div>
						</div>
						<!-- (E) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS5405LNLeftNumBox">E</div>
							<div class="styIRS5405LNDesc" style="width:181mm;">
								Did you purchase the home from a related person or a person related to your spouse (see instructions)?<br/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
											<xsl:with-param name="BackupName">IRS5405HomePurchaseFromRelativeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
										<xsl:with-param name="BackupName">IRS5405HomePurchaseFromRelativeInd</xsl:with-param>
									</xsl:call-template>
									<b>No. </b>Go to line F.<br/>
								</label>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
											<xsl:with-param name="BackupName">IRS5405HomePurchaseFromRelativeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchaseFromRelativeInd"/>
										<xsl:with-param name="BackupName">IRS5405HomePurchaseFromRelativeInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes. </b>You cannot claim the credit. Do not file Form 5405.
								</label>
							</div>
						</div>
						<!-- (F) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">F</div>
							<div class="styIRS5405CleanDiv" style="width:177mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										If you are choosing to claim the credit on your 2010 return, check 
										here (see instructions)
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:0px"/>.
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
											<span style="width:7px"/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405LNDesc" style="width:4mm;height:100%;padding-left:0px;padding-top:1mm;float:right;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HmByrCrClaimedYrBfrPurchaseInd"/>
										<xsl:with-param name="BackupName">IRS5405HmByrCrClaimedYrBfrPurchaseInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5405Data/HmByrCrClaimedYrBfrPurchaseInd"/>
										<xsl:with-param name="BackupName">IRS5405HmByrCrClaimedYrBfrPurchaseInd</xsl:with-param>
									</xsl:call-template>
								</label>
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
							Credit
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">1</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the purchase price of the new home (see instructions)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomePurchasePriceAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">2</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Multiply line 1 by 10% (.10) and enter the result here
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">2</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HmByrCrPrchsPriceAllwblePctAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">3</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:95%;height:100%;">
									If you qualify for the credit as (check the applicable box):<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHomeBuyerInd"/>
											<xsl:with-param name="BackupName">IRS5405FirstTimeHomeBuyerInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHomeBuyerInd"/>
											<xsl:with-param name="BackupName">IRS5405FirstTimeHomeBuyerInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px;"/>
										A first-time homebuyer, enter $8,000 ($4,000 if married filing separately). A first-time<br/>
										homebuyer is an individual (and that individual’s spouse if married) who has not owned another<br/>
										main home during the 3-year period ending on the purchase date and meets other requirements<br/>
										discussed in the instructions.<br/>
									</label>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/LongTermResidentHomeBuyerInd"/>
											<xsl:with-param name="BackupName">IRS5405LongTermResidentHomeBuyerInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/LongTermResidentHomeBuyerInd"/>
											<xsl:with-param name="BackupName">IRS5405LongTermResidentHomeBuyerInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px;"/>
										A long-time resident, enter $6,500 ($3,250 if married filing separately). A long-time resident is<br/>
										an individual (and that individual’s spouse if married) who has owned and used the same home as<br/>
										that individual’s main home for any 5-consecutive-year period during the 8-year period ending on<br/>
										the purchase date of the new main home and meets other requirements discussed in the<br/>
										instructions. See instructions for documentation to be attached.
									</label>
									<xsl:if test="$Form5405Data/LongTermResidentHomeBuyerInd/@referenceDocumentName">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form5405Data/LongTermResidentHomeBuyerInd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div class="styIRS5405CleanDiv" style="width:5%;height:100%;">
									<img src="{$ImagePath}/5405_Bracket_Lg.gif" alt="Large Bracket"/>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:16mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">3</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/AssetOwnershipShareAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:17.5mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">4</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the smaller of line 2 or line 3. But: <b>(a)</b> if married filing separately, enter the smaller of line 3 or<br/>
										your share of the amount on line 2 (see instructions); or <b>(b)</b> if someone other than your spouse also<br/>
										purchased an interest in the home, enter the smaller of your share of the amount on line 3 or your<br/>
										share of the amount on line 2 (see instructions)
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
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:11mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">4</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerCrMaxAllwblAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">5</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter your modified adjusted gross income (see instructions)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">5</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerModifiedAGIAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">6</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter $125,000 ($225,000 if married filing jointly)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">6</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerCreditIncomeLimitAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">7</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Is line 5 more than line 6?<br/>
										<b>No.</b> Skip lines 7 and 8. Enter -0- on line 9 and go to line 10.<br/>
										<b>Yes.</b> Subtract line 6 from line 5 and enter the result. If the result is $20,000 or more, stop here.<br/>
										You cannot take the credit. Otherwise, go to line 8
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
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:11mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerMAGILessMaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">8</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Divide line 7 by $20,000 and enter the result as a decimal (rounded to at least three places)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerCreditAllowedRt"/>
										<xsl:with-param name="PopulateAsText" select="true()"/>
										<xsl:with-param name="AmountBoxStyle">color:darkblue;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">9</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Multiply line 4 by line 8
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerCreditAdjAllwbleAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">10</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Subtract line 9 from line 4 and enter the result. This is your credit. Also enter this amount on your<br/>
										2010 or 2011 Form 1040, line 67, or the appropriate line in the “Payments” section of Form 1040X
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">10</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/HomeBuyerCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS5405LineItem">
							<div class="styIRS5405CleanDiv" style="width:5%;height:100%;">
								<img src="{$ImagePath}/5405_Caution.gif" alt="Caution"/> 
							</div>
							<div class="styIRS5405LNDesc" style="width:90%;height:100%;padding-top:2mm;">
								You must attach a copy of the properly executed settlement statement (or similar documentation) used to<br/>
								complete the purchase (see instructions).
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
							<span class="styBoldText" style="font-size:8pt;">5405</span> (Rev. 12-2011)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 11880I
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 5405 (Rev. 12-2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNDesc" style="width:100%;height:auto;padding-left:12mm;">
								<b>Note.</b> Skip this page if you are not filing this form to (1) report a disposition or change in use of your main home for which you<br/>
								claimed the credit in 2008, 2009, or 2010, or (2) repay the credit.
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5405Data/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Disposition or Change in Use of Main Home for Which the Credit Was Claimed
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">11</div>
							<div class="styIRS5405CleanDiv" style="width:151mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the date you disposed of, or ceased using as your main home, the home for which you claimed the<br/>
										credit (MM/DD/YYYY) (see instructions)
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:6px"/>.
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
											<span style="width:5px"/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405LNDesc" style="width:30mm;height:100%;padding-left:0px;padding-top:1px;float:right;">
								<span style="width:100%;height:4mm;"/>
								<span style="border-color:black;border-style:solid;border-width:0px 0px 1px 0px;height:4mm;width:100%;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/ChangeOfMainHomeDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">12</div>
							<div class="styIRS5405CleanDiv" style="width:177mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										If you meet the following conditions, check here
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405LNDesc" style="width:4mm;height:100%;padding-left:0px;padding-top:1px;float:right;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldMilitaryExtDutyInd"/>
										<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeSoldMilitaryExtDutyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldMilitaryExtDutyInd"/>
										<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeSoldMilitaryExtDutyInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding-left:8mm;">
										I (or my spouse if married) am, or was, a member of the uniformed services or Foreign Service, or an employee of the<br/>
										intelligence community. I sold the home, or it ceased to be my main home, in connection with Government orders for<br/>
										qualified official extended duty service. No repayment of the credit is required (see instructions). Stop here.
									</div>
								</div>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">13</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Check the box below that applies to you. See the instructions for the definition of “related person.”
									</div>
								</div>
							</div>
						</div>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">a</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToUnrltPrsnWithGainInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToUnrltPrsnWithGainInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToUnrltPrsnWithGainInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToUnrltPrsnWithGainInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									I sold (including through foreclosure) the home to a person who is not related to me and had a gain on the sale (as figured<br/>
									in Part V below).
								</div>
							</div>
						</div>
						<!-- (13b) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToUnrltPrsnNoGainInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToUnrltPrsnNoGainInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToUnrltPrsnNoGainInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToUnrltPrsnNoGainInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									I sold (including through foreclosure) the home to a person who is not related to me and did not have a gain on the sale (as<br/>
									figured in Part V below). No repayment of the credit is required. Stop here.
								</div>
							</div>
						</div>
						<!-- (13c) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">c</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToRelatedPersonInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToRelatedPersonInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeSoldToRelatedPersonInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeSoldToRelatedPersonInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									I sold the home to a related person OR I gifted the home to someone (other than my spouse (or ex-spouse as part of my divorce settlement)). Go to Part IV below.
								</div>
							</div>
						</div>
						<!-- (13d) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">d</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeConvertedToBusinessUseInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeConvertedToBusinessUseInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeConvertedToBusinessUseInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeConvertedToBusinessUseInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									I converted the entire home to a rental or business use OR I still own the home but no longer use it as my main home. Go<br/>
									to Part IV below.
								</div>
							</div>
						</div>
						<!-- (13e) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">e</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeTransferredToSpouseGrp/HomeTransferredToSpouseOrExInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeTransferredToSpouseGrpHomeTransferredToSpouseOrExInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeTransferredToSpouseGrp/HomeTransferredToSpouseOrExInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeTransferredToSpouseGrpHomeTransferredToSpouseOrExInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									I transferred the home to my spouse (or ex-spouse as part of my divorce settlement). The full name of my ex-spouse is<span style="width:4px;"/><img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/> <br/>
									<span style="border-color:black;border-width:0px 0px 1px 0px;border-style:solid;height:4mm;width:100%;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeTransferredToSpouseGrp/SpouseOrExName"/>
										</xsl:call-template>
									</span>
									The responsibility for repayment of the credit is transferred to your spouse or ex-spouse. Stop here.
								</div>
							</div>
						</div>
						<!-- (13f) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">f</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeDestrCondemnNewHomeInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeDestrCondemnNewHomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeDestrCondemnNewHomeInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeDestrCondemnNewHomeInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									My home was destroyed, condemned, or sold under threat of condemnation and had a gain (see instructions).
								</div>
							</div>
						</div>
						<!-- (13g) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">g</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeDestrCondemnNoNewHomeInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeDestrCondemnNoNewHomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeDestrCondemnNoNewHomeInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeDestrCondemnNoNewHomeInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									My home was destroyed, condemned, or sold under threat of condemnation and did not have a gain (see instructions).
								</div>
							</div>
						</div>
						<!-- (13h) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;">h</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeBuyerCrTaxpayerDeceasedInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeBuyerCrTaxpayerDeceasedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeBuyerCrTaxpayerDeceasedInd"/>
											<xsl:with-param name="BackupName">Form5405DataDispositionChangeMainHomeHomeHomeBuyerCrTaxpayerDeceasedInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
									The taxpayer who claimed the credit died in 2011. No repayment of the credit is required of the deceased taxpayer. If you<br/>
									are filing a joint return for 2011 with the deceased taxpayer, see instructions. Otherwise, stop here.
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Repayment of Credit Claimed for 2008, 2009, 2010
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">14</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the amount of the credit you claimed on Form 5405 for 2008, 2009, or 2010. See instructions <br/>
										<span class="styGenericDiv">if you filed a joint return for the year you claimed the credit or you checked the box on line 13f or 13g.</span>
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;padding-right:10px;">.</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3.7mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS5405CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">14</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrCrClaimedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">15</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										If you purchased the home in 2008, enter the amount of the credit you repaid with your 2010 return. 
										<span class="styGenericDiv">Otherwise, enter -0-.</span>
										<span class="styBoldText" style="float:right;padding-right:10px;">
											.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">3.7mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<div class="styIRS5405CleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrCrRepaidPYRetAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">16</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Subtract line 15 from line 14. If you checked the box on line 13f or 13g, see instructions. 
										<span class="styGenericDiv">If you checked the box on line 13a, go to line 17. Otherwise, skip line 17 and go to line 18.</span>
										<span class="styBoldText" style="float:right;padding-right:10px;">
											.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">3.7mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<div class="styIRS5405CleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrNetCrClaimedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 17 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">17</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the gain on disposition of your main home (as figured in Part V below)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS5405CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/GainOnSaleOfMainHomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">18</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Amount of the credit to be repaid. If you checked the box on line 13a, enter the smaller of line 16 or 17. <br/>
										If you checked the box on line 13c or 13d, enter the amount from line 16. If you checked the box on line <br/>
										<span class="styGenericDiv">13f or 13g, see instructions.</span>
										<span class="styBoldText" style="float:right;padding-right:10px;">
											.
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
								</div>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">7mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<div class="styIRS5405CleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">18</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrRepaymentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 18 Note -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405CleanDiv" style="width:180mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										<b>Next: </b>Enter the amount from line 18 on your 2011 Form 1040, line 59b, or Form 1040NR, line 58b.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part V																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Form 5405 Gain or (Loss) Worksheet
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- Note -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405LNDesc" style="width:180mm;">
								<b>Note:</b> Use only if your home was destroyed or you sold your home to someone who is <b>not</b> related to you <br/>
								(including a sale through condemnation or under threat of condemnation). See Pub. 523, Selling Your Home, for information on <br/>
								what to enter on lines 19, 20, and 22. But if you sold your home through condemnation, see chapter 1 in Pub. 544, Sales and <br/>
								Other Dispositions of Assets, for information on what to enter on lines 19 and 20.
							</div>
						</div>
						<!-- Line 19 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">19</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Selling price of home, insurance proceeds, or gross condemnation award</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">.
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
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">19</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/SellingPriceOfHomeProcAwardAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">20</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								Selling expenses (including commissions, advertising and legal fees, and seller-paid loan charges) or <br/>
								<span class="styGenericDiv">expenses in getting the condemnation award</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">.
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
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">4.4mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">20</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/SellingOfHomeExpensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">21</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 20 from line 19. This is the amount realized on the sale of the home</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">21</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/MortgSbsdySaleOfHmRealizedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">22</div>
							<div class="styIRS5405LNDesc" style="width:107mm;">
								<span class="styGenericDiv">Adjusted basis of home sold (from line 13 of Worksheet 1 in Pub. 523)</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">
									.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">22</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/AdjustedBasisOfHomeSoldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">23</div>
							<div class="styIRS5405LNDesc" style="width:107mm;">
								Enter the first-time homebuyer credit claimed on Form 5405 minus the amount<br/>
								<span class="styGenericDiv">you repaid with your 2010 tax return.</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">
									.
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
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">4.4mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">23</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrNetCrRpdPYRetAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">9.4mm</xsl:with-param>
									<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">24</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 23 from line 22. This is the adjusted basis for purposes of repaying the credit</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">
									.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">24</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/AdjustedBasisForRepymtCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">25</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 24 from line 21</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">
									.
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
							<div class="styIRS5405CleanDiv" style="width:37mm;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Number">25</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form5405Data/GainOnSaleOfMainHomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405LNDesc" style="width:180mm;">
								&#8226; If line 25 is more than -0-, you have a gain. If the home was destroyed or you sold the home through <br/>
								condemnation or under thread of condemnation, check the box on line 13f. Otherwise, check the box on <br/>
								line 13a. Enter the gain on line 17 and complete the rest of Part IV. <br/>
								&#8226; If line 25 is -0- or less, check the box on line 13b of Form 5405. However, if your home was destroyed <br/>
								or you sold the home through condemnation or the thread of condemnation, check the box on line 13g instead. <br/>
								You do not have to repay the credit.
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">5405</span> (Rev. 12-2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
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
							<xsl:with-param name="TargetNode" select="$Form5405Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
