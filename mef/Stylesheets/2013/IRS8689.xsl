<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8689Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8689Data" select="$RtnDoc/IRS8689"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="StaticTextBefore"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;
				<xsl:choose>
					<xsl:when test="$TargetNode">
						<xsl:choose>
							<xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:6px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:2px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:value-of select="$StaticTextBefore"/>
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
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:3px 0px 0px 0px;
				border-right-width:0px;
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
						<xsl:with-param name="RootElement" select="local-name($Form8689Data)"/>
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
				<meta name="Description" content="IRS Form 8689"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8689Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8689">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8689</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8689Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Allocation of Individual Income Tax<br/>
								to the U.S. Virgin Islands
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:1mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										
											<br/>
											<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040.<br/>
											<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 8689 and its instructions is available at <i>www.irs.gov/form8689</i>.
										
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">13</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">85</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on Form 1040<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
									<xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm;border-top: 1px solid black;border-bottom: 1px solid black" >
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Income From the U.S. Virgin Islands
						</div>
					</div>
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">1</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Wages, salaries, tips, etc
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/WagesSalariesAndTipsAmt"/>
								<xsl:with-param name="Number">1</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">2</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Taxable interest
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TaxableInterestAmt"/>
								<xsl:with-param name="Number">2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">3</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Ordinary dividends
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OrdinaryDividendsAmt"/>
								<xsl:with-param name="Number">3</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">4</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Taxable refunds, credits, or offsets of local U.S. Virgin Islands income taxes
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/USVITaxRefCreditsOffsetAmt"/>
								<xsl:with-param name="Number">4</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">5</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Alimony received
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/AlimonyReceivedAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">6</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Business income or (loss)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/BusinessIncomeLossAmt"/>
								<xsl:with-param name="Number">6</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">7</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Capital gain or (loss)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/CapitalGainLossAmt"/>
								<xsl:with-param name="Number">7</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">8</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Other gains or (losses)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OtherGainLossAmt"/>
								<xsl:with-param name="Number">8</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">9</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									IRA distributions (taxable amount)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/IRADistributionsAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">10</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Pensions and annuities (taxable amount)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TxblPensionAndAnnuitiesAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">11</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Rental real estate, royalties, partnerships, S corporations, trusts, etc.
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/RntlRyltsPrtshpSCorpTREtcAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">12</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Farm income or (loss)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/FarmIncomeOrLossAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">13</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Unemployment compensation
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/UnemploymentCompensationAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">14</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Social security benefits (taxable amount)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TaxableSocSecAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">15</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Other income. List type and amount
									<span style="width:5px;"/>
									<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:5px;"/> 
								</div>
								<div class="styIRS8689LNDesc" style="width:85mm;height:100%;text-align:right;padding:0px 3mm 0px 0px;border-style:dotted;border-bottom-width:1px;border-color:black;"/>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalOtherUSVIIncomeAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">16</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Add lines 1 through 15. This is your <b>total income</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>
										<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalUSVIIncomeAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black; border-bottom:1px solid black" >
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Adjusted Gross Income From the U.S. Virgin Islands
						</div>
					</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">17</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Educator expenses
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/EducatorExpenseAmt"/>
										<xsl:with-param name="Number">17</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">18</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Certain business expenses of reservists, performing artists, and<br/>
									fee-basis government officials
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:14px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
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
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/BusExpnsReservistsAndOthersAmt"/>
										<xsl:with-param name="Number">18</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">19</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Health savings account deduction
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/HealthSavingsAccountDedAmt"/>
										<xsl:with-param name="Number">19</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">20</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Moving expenses
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/MovingExpenseAmt"/>
										<xsl:with-param name="Number">20</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (21) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">21</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Deductible part of self-employment tax
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/OneHalfSelfEmploymentTaxAmt"/>
										<xsl:with-param name="Number">21</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">22</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Self-employed SEP, SIMPLE, and qualified plans
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SelfEmpldSepSimpleQlfyPlansAmt"/>
										<xsl:with-param name="Number">22</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">23</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Self-employed health insurance deduction
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SelfEmpldHealthInsDedAmt"/>
										<xsl:with-param name="Number">23</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (24) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">24</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Penalty on early withdrawal of savings
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/PnltyOnErlyWthdrwOfSavingsAmt"/>
										<xsl:with-param name="Number">24</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (25) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">25</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									IRA deduction
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/IRADeductionAmt"/>
										<xsl:with-param name="Number">25</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (26) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">26</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Student loan interest deduction
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/StudentLoanInterestDedAmt"/>
										<xsl:with-param name="Number">26</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (27) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">27</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Tuition and fees deduction
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/TuitionAndFeesDedAmt"/>
										<xsl:with-param name="Number">27</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (28) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">28</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Add lines 17 through 27
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalDedAttrblToUSVIIncomeAmt"/>
								<xsl:with-param name="Number">28</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (29) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">29</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Subtract line 28 from line 16. This is your <b>adjusted gross income</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:6px"/>
										<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsAGIAmt"/>
								<xsl:with-param name="Number">29</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;border-top:1px solid black; border-bottom:1px solid black" class="styGenericDIv">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Allocation of Tax to the U.S. Virgin Islands
						</div>
					</div>
						<!-- (30) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">30</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Enter amount from Form 1040, line 61
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/Form1040TotalTaxAmt"/>
								<xsl:with-param name="Number">30</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (31) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">31</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Enter the total of the amounts from Form 1040, lines 56, 57, 59a, 64a, 65, 66, and 71 (boxes<br/>
									c and d). Include any uncollected social security and Medicare or tier 1 RRTA tax, tax on excess<br/>
									golden parachute payments, or excise tax on insider stock compensation reported on line 60. Also<br/>
									include any amount from Form 5329, Parts III, IV, V, VI, VII, or VIII reported on Form 1040, line 58
									<span class="styBoldText">
										<span style="width:6px;"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">8.6mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsTaxAdjustmentAmt"/>
								<xsl:with-param name="Number">31</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (32) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">32</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Subtract line 31 from line 30
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/AdjustedTaxAmt"/>
								<xsl:with-param name="Number">32</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (33) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">33</div>
							<div class="styIRS8689LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Enter amount from Form 1040, line 38
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:7px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/Form1040AdjustedGrossIncomeAmt"/>
										<xsl:with-param name="Number">33</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (34) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">34</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;font-family:Arial Narrow;font-size:8pt;">
									Divide line 29 above by line 33. Enter the result as a decimal (rounded to at least 3 places). Do not enter more than 1.000
								</div>
							</div>
							<div class="styLNRightNumBox" style="padding:3px 0px 0px 0px;border-right-width:0px;height:5mm;">
								34
							</div>
							<div style="width:29mm;height:5mm;border-width:0px 0px 1px 1px;border-color:#000000;float:right;border-style:solid;">
								<span style="width:4mm;height:100%;padding-top:2px;float:left;padding-left:10px;">x</span>
								<span style="width:24mm;height:100%;border-left-width:0px;float:right;font-size:6pt;padding-top:6px;padding-right:2px;color:darkblue;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8689Data/USVIAGIDividedBy1040AGIPct"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- (35) ////////////////////////////////////////////////////-->
						<div class="styIRS8689LineItem">
							<div class="styIRS8689LNLeftNumBox">35</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Multiply line 32 by line 34. This is your <b>tax allocated to the U.S. Virgin Islands</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/VirginIslandsTaxAllocatedAmt"/>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Number">35</xsl:with-param>
							</xsl:call-template>
						</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;border-top:1px solid black; border-bottom: 1px solid black" class="styGenericDiv">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Payments of Income Tax to the U.S. Virgin Islands
						</div>
					</div>
						<!-- (36) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">36</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Income tax withheld by the U.S. Virgin Islands
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:3px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<!---<xsl:with-param name="Height">100%</xsl:with-param> -->
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/USVIWithholdingTaxAmt"/>
										<xsl:with-param name="Number">36</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (37) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm;"> 
							<div class="styIRS8689LNLeftNumBox">37</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									2013 estimated tax payments and amount applied from 2012 return
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:3px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/EstTaxAndCreditElectPymtAmt"/>
										<xsl:with-param name="Number">37</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (38) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8689LNLeftNumBox">38</div>
							<div class="styIRS8689LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Amount paid with Form 4868 (extension request)
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:3px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/PymtMadeWithExtensionAmt"/>
										<xsl:with-param name="Number">38</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (39) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">39</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Add lines 36 through 38. These are your <b>total payments</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<span style="width:6px"/>
										<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/TotalPaymentsAmt"/>
								<xsl:with-param name="Number">39</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (40) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm;border-bottom:1px solid black;">
							<div class="styIRS8689LNLeftNumBox">40</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Enter the smaller of line 35 or line 39. Include this amount in the total on Form 1040, line 72. On the<br/>dotted line next to line 72, enter "Form 8689" and show this amount
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:5px"/>.
										<span style="width:11px"/>.
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
							<div class="styIRS8689LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/SmallerAllocTaxOrTotPaymentAmt"/>
										<xsl:with-param name="Number">40</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							
						</div>
						<!-- (41) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">41</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									<b>Overpayment</b> to the U.S. Virgin Islands. If line 39 is more than line 35, subtract line 35 from line 39.
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/OverpaidToUSVIAmt"/>
								<xsl:with-param name="Number">41</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (42) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">42</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:1px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Amount of line 41 you want <b>refunded to you</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
										<img src="{$ImagePath}/8689_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/RefundAmt"/>
								<xsl:with-param name="Number">42</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (43) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">43</div>
							<div class="styIRS8689LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Amount of line 41 you want <b>applied to your 2014 estimated tax</b>
								</div>
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:7px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/AppliedToESTaxAmt"/>
										<xsl:with-param name="Number">43</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (44) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">44</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Amount you owe to the U.S. Virgin Islands. Subtract line 39 from line 35.
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
										<span style="width:7px"/>
									</span>
								</div>
							</div>
							<div class="styIRS8689LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8689Data/AmountOwedToUSVIAmt"/>
										<xsl:with-param name="Number">44</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (45) ////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styIRS8689LNLeftNumBox">45</div>
							<div class="styIRS8689LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8689LNDesc" style="width:auto;height:100%;">
									Enter the amount from line 44 that you will pay when you file your income tax return. Include this amount<br/>
									in the total of Form 1040, line 72. On the dotted line next to line 72, enter "Form 8689" and show this<br/>
									amount.
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
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:7px"/>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="Height">6mm</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8689Data/USVIPaymentAmt"/>
								<xsl:with-param name="Number">45</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					<!--</div>-->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see Form 1040 instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:20px;"/>
							Form<span class="styBoldText" style="font-size:7pt;"> 8689 </span>(2013)
						</div>
						<div style="float:right;text-align:center;width:60mm;font-size:7pt;">
							Cat. No. 64603D
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
							<xsl:with-param name="TargetNode" select="$Form8689Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line A, Child's Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8689Data/ChildNameControl"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
