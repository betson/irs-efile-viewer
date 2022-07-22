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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
						<div class="styFNBox" style="width:31mm;height:16mm;border-right-width:2px;">
							<div >
								Form<span class="styFormNumber">  5405</span>
							</div>
							<span class="styAgency">(Rev. December 2015)</span>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5405Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" >Department of the Treasury</span>
							<br/>
							<span class="styAgency" >Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:3mm;">
								Repayment of the First-Time<br/> Homebuyer Credit 
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;border-left-width:2px;">
											<br/>
											<br/><br></br>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040, Form 1040NR, or Form 1040X.
											<br/>
											<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 5405 and its separate instructions is at <i>www.irs.gov/form5405</i>.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:16.75mm;">
							<div class="styOMB" style="height:6mm;font-size:7pt;padding-top:2mm;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:2mm;padding-top:4mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">58</span>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name shown on return<br/><br></br>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5405Data/PersonNm"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/><br></br>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5405Data/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- END Page Header -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Disposition or Change in Use of Main Home for Which the Credit Was Claimed
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:8mm;">
							<div class="styIRS5405LNLeftNumBox" style="height:12mm;">1</div>
							<div class="styIRS5405CleanDiv" style="width:151mm;height:auto;padding:0px 0px 0px 0px;height:12mm;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;height:12mm;">
									<div class="styIRS5405LNDesc" style="width:auto;height:12mm;">
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
							<div class="styIRS5405LNDesc" style="width:30mm;height:3.5mm;padding-left:0px;padding-top:1px;float:right;">
								<span style="width:100%;height:3.5mm;"/>
								<span style="border-color:black;border-style:solid;border-width:0px 0px 1px 0px;height:4mm;width:100%;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/ChangeOfMainHomeDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="height:8mm;">2</div>
							<div class="styIRS5405CleanDiv" style="width:177mm;height:8mm;;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:8mm;;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:8mm;;">
										If you meet the following conditions, check here
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;height:8mm;;text-align:right;float:right;padding:0px 10px 0px 0px;">
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
						<div class="styIRS5405LineItem" style="height:12mm;">
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
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox">3</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Check the box below that applies to you. See the instructions for the definition of “related person.”
									</div>
								</div>
							</div>
						</div>
						<!-- (3a) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:7mm;">
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
									in Part III below). Go to Part II below. 
								</div>
							</div>
						</div>
						<!-- (3b) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:style:4mm;">
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
									figured in Part III below). No repayment of the credit is required. Stop here.
								</div>
							</div>
						</div>
						<!-- (3c) ////////////////////////////////////////////////////-->
						
						<div class="styIRS5405LineItem" style="height:8mm;padding-top:2mm;">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;height:8mm;">c</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;height:6mm;">
								<div class="styIRS5405LNDesc" style="width:auto;height:1mm;">
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
								<div class="styIRS5405LNDesc" style="width:auto;height:12mm;padding-left:11mm;">
									I sold the home to a related person OR I gave the home to someone other than my spouse (or ex-spouse as part of my divorce settlement). Go to Part II below.
								</div>
							</div>
						</div>
						<!-- (3d) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:9mm;padding-top:2mm;">
							<div class="styIRS5405LNLeftNumBox" style="padding-right:0px;height:12mm;">d</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;padding:0px 0px 0px 0px;height:12mm;">
								<div class="styIRS5405LNDesc" style="width:auto;height:12mm;;">
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
								<div class="styIRS5405LNDesc" style="width:auto;height:12mm;">
									I converted the entire home to a rental or business use OR I still own the home but no longer use it as my main home. Go <br/>
									 to Part II below.
								</div>
							</div>
						</div>
						<!-- (3e) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:11mm;">
							<div class="styIRS5405LNLeftNumBox" style="height:7mm;">e</div>
							<div class="styIRS5405CleanDiv" style="width:181mm;height:auto;">
								<div class="styIRS5405LNDesc" style="width:auto;">
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
								<div class="styIRS5405LNDesc" style="width:auto;height:8mm;">
									I transferred the home to my spouse (or ex-spouse as part of my divorce settlement). The full name of my ex-spouse is
									<img src="{$ImagePath}/5405_Bullet_Sm.gif" alt="SmallBullet"/>
									<br/>
									<span style="border-color:black;border-width:0px 0px 1px 0px;border-style:solid;height:3.75mm;width:100%;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5405Data/DispositionChangeMainHome/HomeTransferredToSpouseGrp/SpouseOrExNm"/>
										</xsl:call-template>
									<br/>
									The responsibility for repayment of the credit is transferred to your spouse or ex-spouse. Stop here.</span>
								</div>
							</div>
						</div>
						<!-- (3f) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-left:4.3mm;">f</div>
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
						<!-- (3g) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem">
							<div class="styIRS5405LNLeftNumBox" style="padding-left:4mm;">g</div>
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
									My home was destroyed, condemned, or sold under threat of condemnation and I did not have a gain (see instructions).
								</div>
							</div>
						</div>
						<!-- (3h) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:8.5mm;">
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
									The taxpayer who claimed the credit died in 2015. No repayment of the credit is required of the deceased taxpayer. If you<br/>
									are filing a joint return for 2015 with the deceased taxpayer, see instructions. Otherwise, stop here.
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																							 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Repayment of the Credit 
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (4) ////////////////////////////////////////////////////-->
					
					
					<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						<div class="styIRS5405LineItem" style="height:4mm;">
							<div class="styIRS5405LNLeftNumBox">4</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Enter the amount of the credit you claimed on Form 5405 for a prior year. See instructions 
										if you filed a joint return for the year you claimed the credit or you checked the box on line 3f or 3g
										<!--Dotted Line-->
										<span class="styBoldText">
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
						
						
						
							
						</div> 
						
						<div style="float:right;">
					
						<div class="styIRS5695LineItem" style="font-size:4pt;float:right;">
						
					</div>
					<div class="styIRS5695LineItem" style="float:right;">
					
					
					
					
						
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrCrClaimedAmt"/>
							</xsl:call-template>
						</div>
					</div>	</div>
						
							<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:4mm;">
							<div class="styIRS5405LNLeftNumBox">5</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										If you purchased the home in 2008, enter the amount of the credit you repaid with your 2010, 2011, 2012, 2013, and 2014 tax returns.
										Otherwise, enter -0-
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
										
										
										</span>
									</div>
								</div>
							</div>
							
						</div>
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="padding-top:1mm;">
						5</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrCrRepaidPYRetAmt"/>
							</xsl:call-template>
						</div>	</div>
						
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
					
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS5405LineItem" style="height:2mm;">
							<div class="styIRS5405LNLeftNumBox">6</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										Subtract line 5 from line 4. If you checked the box on line 3f or 3g, see instructions. 
										If you checked the box on line 3a, go to line 7. Otherwise, skip line 7 and go to line 8
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
										</span>
									</div>
								</div>
							</div>
							
						</div>
				
				<div style="float:right;">
						<div class="styLNRightNumBox" style="height:4mm;">6</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrNetCrClaimedAmt"/>
							</xsl:call-template>
						</div></div>
						
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
				
						<!-- Line 7 -->
						<div class="styIRS5405LineItem" style="padding-top:1mm;height:1mm;">
							<div class="styIRS5405LNLeftNumBox">7</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;">
										Enter the gain on disposition of your main home (from line 15 below)
									</div>
									<div class="styIRS5405LNDesc" style="width:auto;text-align:right;">
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
										</span>
									</div>
								</div>
							</div>
							
						</div>
						
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="height:4mm;">7</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/GainOnSaleOfMainHomeAmt"/>
							</xsl:call-template>
						</div></div>
						
						
						
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						<!-- Line 8 -->
						<div class="styIRS5405LineItem" style="padding-top:1mm;height:1mm;">
							<div class="styIRS5405LNLeftNumBox">8</div>
							<div class="styIRS5405CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										<b>Amount of the credit to be repaid.</b> See Instructions
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
										</span>
									</div>
								</div>
							</div>
							
						</div>
						
						
							<div style="float:right;">
						<div class="styLNRightNumBox" style="height:4mm;">8</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrRepaymentAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 8 Note -->
						<div class="styIRS5405LineItem" style="padding-top:.5mm;">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405CleanDiv" style="width:180mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5405LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5405LNDesc" style="width:auto;height:100%;">
										<b>Next: </b>Enter the amount from line 8 on your 2015 Form 1040, line 60b, or Form 1040NR, line 59b.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Form 5405 Gain or (Loss) Worksheet
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- Note -->
						<div class="styIRS5405LineItem" style="height:15mm;">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405LNDesc" style="width:180mm;">
								<b>Note:</b> Complete this part only if your home was destroyed or you sold your home to someone who is not related to you (including a
								sale through condemnation or under threat of condemnation). See Pub. 523, Selling Your Home, for information on what to enter on
								lines 9, 10, and 12. But if you sold your home through condemnation, see chapter 1 in Pub. 544, Sales and Other Dispositions of
								Assets, for information on what to enter on lines 9 and 10.
							</div>
						</div>
						<!-- Line 9 -->
						
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						
						<div class="styIRS5405LineItem" style="height:1mm;" >
							<div class="styIRS5405LNLeftNumBox">9</div>
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
							
							
							
							
							
							
							
						</div>
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="height:3.5mm;">9</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/SellingPriceOfHomeProcAwardAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 10 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						
						<div class="styIRS5405LineItem" style="height:4mm;">
							<div class="styIRS5405LNLeftNumBox">10</div>
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
							
						</div>
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="height:3.5mm;">10</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/SellingOfHomeExpensesAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 11 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						<div class="styIRS5405LineItem" style="height:1mm;" >
							<div class="styIRS5405LNLeftNumBox">11</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 10 from line 9. This is the amount realized on the sale of the home</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
						
						</div>
						
						
						
						
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="height:3.5mm;">11</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/MortgSbsdySaleOfHmRealizedAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 12 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						<div class="styIRS5405LineItem" style="height:2mm;">
							<div class="styIRS5405LNLeftNumBox">12</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Adjusted basis of home sold (from line 13 of Worksheet 1 in Pub. 523)</span>
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
								</span>
							</div>
							
						</div>
						
						<div style="float:right;">
						<div class="styLNRightNumBox" style="height:3.3mm;">12</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/AdjustedBasisOfHomeSoldAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 13 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						<div class="styIRS5405LineItem" style="height:4mm;">
							<div class="styIRS5405LNLeftNumBox">13</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
							Enter the first-time homebuyer credit claimed on Form 5405 <b>minus</b> the amount of the credit you
								repaid<br/>
								<span class="styGenericDiv">with your 2010, 2011, 2012, 2013, and 2014 tax returns</span>
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
									
									
								</span>
							</div>
						</div>

<div style="float:right;">
						<div class="styLNRightNumBox" style="height:3.3mm;">13</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/FirstTimeHmByrNetCrRpdPYRetAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 14 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						<div class="styIRS5405LineItem" style="height:1mm;">
							<div class="styIRS5405LNLeftNumBox">14</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 13 from line 12. This is the adjusted basis for purposes of repaying the credit</span>
								<span class="styBoldText" style="float:right;padding-right:10px;">
									.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							
						</div>
						
						<div style="float:right">
						<div class="styLNRightNumBox" style="height:3.3mm;">14</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/AdjustedBasisForRepymtCrAmt"/>
							</xsl:call-template>
						</div></div>
						<!-- Line 15 -->
						<div class="styIRS5695LineItem" style="height:1mm;font-size:4pt;float:right;">
						<div class="styLNLeftNumBox" style="height:1mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:1mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:5mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="width:29mm;height:5mm;font-size:4pt;"/>
					</div>
						
						<div class="styIRS5405LineItem" >
							<div class="styIRS5405LNLeftNumBox">15</div>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								<span class="styGenericDiv">Subtract line 14 from line 11</span>
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
						
						<div style="float:right">
						<div class="styLNRightNumBox" style="height:3.3mm;">15</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5405Data/GainOrLossFromWorksheetAmt"/>
							</xsl:call-template>
						</div></div>
						
						<div class="styIRS5405LineItem" style="height:28mm;">
							<div class="styIRS5405LNLeftNumBox"/>
							<div class="styIRS5405LNDesc" style="width:144mm;">
								&#8226; If line 15 is more than -0-, you have a gain. Check the box on line 3a and complete Part II. <b>However</b>,
								check the box on line 3f (instead of the box on line 3a) if your home was destroyed or you sold the home
								through condemnation or under threat of condemnation. Then complete Part II if you purchased the
								home in 2008 or you purchased the home after 2008 and the event occurred in 2013.<br/>
								<br/>
								&#8226; If line 15 is -0- or less, check the box on line 3b of Form 5405. However, if your home was destroyed
								or you sold the home through condemnation or under threat of condemnation, check the box on line 3g
								instead. You do not have to repay the credit.
							</div>
						</div>
					</div>
					
					
					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see your tax return instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">5405</span> (Rev. 12-2015)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 11880I
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
