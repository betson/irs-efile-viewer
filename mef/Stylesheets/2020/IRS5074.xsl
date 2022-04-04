<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5074Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5074Data" select="$RtnDoc/IRS5074"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateRow) -->
	<xsl:template name="PopulateRow">
		<xsl:param name="CNMI"/>
		<xsl:param name="CNMIPopulateAsText"/>
		<xsl:param name="CNMIStyle"/>
		<xsl:param name="Guam"/>
		<xsl:param name="GuamPopulateAsText"/>
		<xsl:param name="GuamStyle"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberStyle"/>
		<xsl:param name="Width">33mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:4mm;<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberStyle"><xsl:value-of select="$NumberStyle"/></xsl:if>
			</xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:4mm<xsl:value-of select="$Height"/>;
				border-right-width:0px;text-align:right;padding-right:2px;font-size:6pt;
				<xsl:choose>
					<xsl:when test="$Guam">
						<xsl:choose>
							<xsl:when test="$Guam/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:4px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:4px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$GuamStyle"><xsl:value-of select="$GuamStyle"/></xsl:if>
			</xsl:attribute>
			<xsl:if test="$Guam">
				<xsl:choose>
					<xsl:when test="$GuamPopulateAsText">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Guam"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Guam"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$Guam/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Guam"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:4mm<xsl:value-of select="$Height"/>;
				border-right-width:0px;;text-align:right;padding-right:2px;font-size:6pt;
				<xsl:choose>
					<xsl:when test="$CNMI">
						<xsl:choose>
							<xsl:when test="$CNMI/@referenceDocumentId">padding-top:3px;</xsl:when>
							<xsl:otherwise>padding-top:4px;</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>padding-top:4px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$CNMIStyle"><xsl:value-of select="$CNMIStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$CNMI">
				<xsl:choose>
					<xsl:when test="$CNMIPopulateAsText">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$CNMI"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$CNMI"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$CNMI/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$CNMI"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5074Data)"/>
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
				<meta name="Description" content="IRS Form 5074"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5074Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS5074">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						<div class="styFNBox" style="width:37.5mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm; padding-bottom:5mm;">
								Form<span class="styFormNumber">5074</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5074Data"/>
							</xsl:call-template>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:118.5mm;height:22mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="font-size:12pt;">
								Allocation of Individual Income Tax to Guam or the<br/>
								Commonwealth of the Northern Mariana Islands (CNMI)<br/>
                                 <br/>
								<span style="text-align:center;font-weight:bold;font-size:7pt;">
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
										Go to <i><a style="text-decoration:none;color:black;" href="http://IRS.gov/Form5074">www.irs.gov/Form5074.</a></i> for the latest information. 
									<br/>
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
										Attach to Form 1040 or Form 1040-SR.
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;border-left-width:2px;">
							<div class="styOMB" style="width:30mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:2mm;text-align:left;">Attachment<br/>Sequence No. 
							    <span class="styBoldText" style="font-size:9pt;">168</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:7mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on Form 1040 or Form 1040-SR<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="height:7mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
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
					<div style="width:187mm;padding-top:1mm;padding-bottom:1mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="font-size:7pt;">
							Income From Guam or the CNMI Reported on Form 1040, Form 1040-SR, or Schedule 1 (Form 1040), Part I
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;padding-bottom:1mm">
						<!-- (Headers) //////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:4mm;">
							<div class="styLNAmountBox" style="border-right-width:0px;float:right;text-align:center;width:34mm;height:4mm">
								<span class="styBoldText">CNMI</span>
							</div>
							<div class="styLNAmountBox" style="border-right-width:0px;float:right;text-align:center;width:33mm;height:4mm">
								<span class="styBoldText">Guam</span>
							</div>
							<div class="styLNRightNumBox" style="float:right;border-width:0px 0px 1px 0px;height:100%;padding:0px 3mm 0px 0px"/>
						</div>
						<!-- (1) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">1</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Wages, salaries, tips, etc
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/WagesSalariesAndTipsAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/WagesSalariesAndTipsAmt"/>
								<xsl:with-param name="Number">1</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (2) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">2</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Taxable interest
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">....................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TaxableInterestAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TaxableInterestAmt"/>
								<xsl:with-param name="Number">2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (3) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">3</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Ordinary dividends
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/OrdinaryDividendsAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/OrdinaryDividendsAmt"/>
								<xsl:with-param name="Number">3</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (4) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">4</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Taxable refunds, credits, or offsets of local Guam or CNMI income taxes
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TxblRefCrOffsetLocalIncmTaxAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TxblRefCrOffsetLocalIncmTaxAmt"/>
								<xsl:with-param name="Number">4</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (5) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">5</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Alimony received
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/AlimonyReceivedAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/AlimonyReceivedAmt"/>
								<xsl:with-param name="Number">5</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (6) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">6</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Business income or (loss)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/BusinessIncomeLossAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/BusinessIncomeLossAmt"/>
								<xsl:with-param name="Number">6</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (7) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">7</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Capital gain or (loss)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/CapitalGainLossAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/CapitalGainLossAmt"/>
								<xsl:with-param name="Number">7</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (8) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">8</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Other gains or (losses)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/OtherGainLossAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/OtherGainLossAmt"/>
								<xsl:with-param name="Number">8</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (9) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">9</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									IRA distributions (taxable amount)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TaxableIRAAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TaxableIRAAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">10</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Pensions and annuities (taxable amount)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/PensionsAnnuitiesAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/PensionsAnnuitiesAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (11) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">11</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Rental real estate, royalties, partnerships, S corporations, trusts, etc.
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/RentalRealEstateIncomeLossAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/RentalRealEstateIncomeLossAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">12</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Farm income or (loss)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/FarmIncomeLossAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/FarmIncomeLossAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">13</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Unemployment compensation
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/UnemploymentCompAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/UnemploymentCompAmt"/>
								<xsl:with-param name="Number">13</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">14</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Social security benefits (taxable amount)
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TaxableSocSecAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TaxableSocSecAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">15</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;">
									Other income. List type and amount
									<span style="width:3px;"/>
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallArrow"/> 
								</div>
								<div class="styIRS5074LNDesc" style="width:49mm;height:3mm;padding:0px 3mm 0px 0px;border-style:dotted;border-color:black;border-width:0px 0px 1px 0px;"/>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TotalOtherIncomeAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TotalOtherIncomeAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" >
							<div class="styIRS5074LNLeftNumBox">16</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;padding-bottom:0mm;">
									<b>Total income.</b> Add lines 1 through 15
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm">............</span>
										<span style="width:6px"/>
								</div>
							<div style="margin-top:1.5mm;">		
							<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallArrow"/>
							</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TotalIncomeAmt"/>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TotalIncomeAmt"/>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;padding-bottom:3mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Adjustments to Income From Guam or the CNMI Reported on Form 1040, 1040-SR or Schedule 1 (Form 1040), Part II
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (17) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">17</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Educator expenses 
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..................</span>
								</div>
							</div> 
                            <xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI"                         select="$Form5074Data/CNMIAllocationGroup/EducatorExpensesAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/EducatorExpensesAmt"/>
								<xsl:with-param name="Number">17</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (18) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem " style="height:7mm;">
							<div class="styIRS5074LNLeftNumBox">18</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 5px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									<span style="width:auto;height:auto">
									Certain business expenses of reservists, performing artists, and fee-basis
									</span>
									<span style="width:auto;height:auto;padding-right:11px;">
										<span style="float:left;width:auto;">government officials</span>
										<span style="float:right;width:auto;">
											<!--Dotted Line-->
											<span class="styDotLn">..................</span>
										</span>
									</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="Height">3.3mm</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/BusExpnsReservistsAndOthersAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/BusExpnsReservistsAndOthersAmt"/>
								<xsl:with-param name="Number">18</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (19) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">19</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Health savings account deduction
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/HealthSavingsAccountDedAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/HealthSavingsAccountDedAmt"/>
								<xsl:with-param name="Number">19</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (20) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">20</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Moving expenses
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/MovingExpenseAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/MovingExpenseAmt"/>
								<xsl:with-param name="Number">20</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (21) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">21</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Deductible part of self-employment tax
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/DeductibleSelfEmploymentTaxAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/DeductibleSelfEmploymentTaxAmt"/>
								<xsl:with-param name="Number">21</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (22) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">22</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Self-employed SEP, SIMPLE, and qualified plans
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/SelfEmpldSepSimpleQlfyPlansAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/SelfEmpldSepSimpleQlfyPlansAmt"/>
								<xsl:with-param name="Number">22</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (23) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">23</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Self-employed health insurance deduction
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/SelfEmpldHealthInsDedAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/SelfEmpldHealthInsDedAmt"/>
								<xsl:with-param name="Number">23</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (24) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">24</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Penalty on early withdrawal of savings
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/PnltyOnErlyWthdrwOfSavingsAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/PnltyOnErlyWthdrwOfSavingsAmt"/>
								<xsl:with-param name="Number">24</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (25) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">25</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									IRA deduction
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">....................</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/IRADeductionAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/IRADeductionAmt"/>
								<xsl:with-param name="Number">25</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (26) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">26</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Student loan interest deduction
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..............</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/StudentLoanInterestDedAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/StudentLoanInterestDedAmt"/>
								<xsl:with-param name="Number">26</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (27) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">27</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Tuition and fees deduction. See instructions
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TuitionAndFeesDedAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TuitionAndFeesDedAmt"/>
								<xsl:with-param name="Number">27</xsl:with-param>
							</xsl:call-template>
							</div>
						<!-- (28) ////////////////////////////////////////////////// -->	
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">28</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Charitable contributions. See instructions
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...........</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/CharitableContributionAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/CharitableContributionAmt"/>
								<xsl:with-param name="Number">28</xsl:with-param>
							</xsl:call-template>
							</div>
							<!-- (29) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">29</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									Add lines 17 through 28
									<xsl:if test="$Form5074Data/CNMIAllocationGroup/OtherDeductionsFrom1040TotAmt">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">CNMI - Other Deductions From 1040 Total Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form5074Data/CNMIAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
										</xsl:call-template>
										<span style="width:5px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form5074Data/CNMIAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$Form5074Data/GUAMAllocationGroup/OtherDeductionsFrom1040TotAmt">
										<span style="width:5px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">GUAM - Other Deductions From 1040 Total Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form5074Data/GUAMAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
										</xsl:call-template>
										<span style="width:5px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form5074Data/GUAMAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">............</span>
										<xsl:if test="not($Form5074Data/CNMIAllocationGroup/OtherDeductionsFrom1040TotAmt)">
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</xsl:if>
										<xsl:if test="not($Form5074Data/GUAMAllocationGroup/OtherDeductionsFrom1040TotAmt)">
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</xsl:if>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TotalAdjustmentsAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TotalAdjustmentsAmt"/>
								<xsl:with-param name="Number">29</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (30) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:4mm;">
							<div class="styIRS5074LNLeftNumBox">30</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;padding-bottom:0mm;">
									<span class="styBoldText">Adjusted gross income.</span> Subtract line 29 from line 16
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm">.....</span>
										<span style="width:6px"/>
							</div>
							<div style="margin-top:1.5mm;">		
							<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallArrow"/>
							</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/AdjustedGrossIncomeAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/AdjustedGrossIncomeAmt"/>
								<xsl:with-param name="Number">30</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;padding-bottom:1mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Payments of Income Tax to Guam or the CNMI
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (31) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem">
							<div class="styIRS5074LNLeftNumBox">31</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto">
									Payments on estimated tax return filed with Guam or the CNMI
								</div>
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">....</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/EstTaxPymntFldWithTerritoryAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/EstTaxPymntFldWithTerritoryAmt"/>
								<xsl:with-param name="Number">31</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (32) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:7mm;">
							<div class="styIRS5074LNLeftNumBox">32</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									<span style="width:auto;height:auto">
									Income tax withheld from your wages while employed by the U.S.
									</span>
									<span style="width:auto;height:auto;"> 
										<span style="float:left;width:auto;">Government as a civilian in Guam or the CNMI</span>
										<span style="float:right;width:auto;padding-right:11px;">
											<!--Dotted Line-->
											<span class="styDotLn">..........</span>
										</span>
									</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="Height">3.3mm</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/USGovCivIncomeTaxWithheldAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/USGovCivIncomeTaxWithheldAmt"/>
								<xsl:with-param name="Number">32</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (33) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:7mm;">
							<div class="styIRS5074LNLeftNumBox">33</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									<span style="width:auto;height:auto;">
									Income tax withheld from your wages while employed as a member of the
									</span>
									<span style="width:auto;height:auto;">
										<span style="float:left;width:auto;">U.S. Armed Forces in Guam or the CNMI</span>
										<span style="float:right;width:auto;padding-right:11px;">
											<!--Dotted Line-->
											<span class="styDotLn">...........</span>
										</span>
									</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="Height">3.3mm</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/USArmedForcesIncomeTaxWthldAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/USArmedForcesIncomeTaxWthldAmt"/>
								<xsl:with-param name="Number">33</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (34) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:7mm;">
							<div class="styIRS5074LNLeftNumBox">34</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;">
									<span style="width:auto;height:auto;">
									Income tax withheld from your wages earned in Guam or the CNMI other
									</span>
									<span style="width:auto;height:auto;">
										<span style="float:left;width:auto;">than amounts on lines 31 through 33</span>
										<span style="float:right;width:auto;padding-right:11px;">
											<!--Dotted Line-->
											<span class="styDotLn">............</span>
										</span>
									</span>
								</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="Height">3.3mm</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TerritoryIncomeTaxWithheldAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TerritoryIncomeTaxWithheldAmt"/>
								<xsl:with-param name="Number">34</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (35) ////////////////////////////////////////////////// -->
						<div class="styIRS5074LineItem" style="height:4mm;">
							<div class="styIRS5074LNLeftNumBox">35</div>
							<div class="styIRS5074LNDesc" style="width:106mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS5074LNDesc" style="width:auto;height:auto;padding:1mm 3mm">
									<span class="styBoldText">Total payments.</span> Add lines 31 through 34
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm">..........</span>
										<span style="width:6px"/>
							</div>
							<div style="margin-top:1mm;">		
							<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallArrow"/>
							</div>
							</div>
							<xsl:call-template name="PopulateRow">
								<xsl:with-param name="CNMI" select="$Form5074Data/CNMIAllocationGroup/TotalPaymentsAmt"/>
								<xsl:with-param name="Guam" select="$Form5074Data/GUAMAllocationGroup/TotalPaymentsAmt"/>
								<xsl:with-param name="Number">35</xsl:with-param>
								<xsl:with-param name="CNMIStyle">border-bottom-width:0px;border-top-width:0px;</xsl:with-param>
								<xsl:with-param name="GuamStyle">border-bottom-width:0px;border-top-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberStyle">border-bottom-width:0px;border-top-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:135mm;font-weight:bold;float:left;clear:none;">							
							For Paperwork Reduction Act Notice, see the Instructions for Form 1040 or Form 1040-SR							
						</div>						
						<div style="float:left;width:22mm;font-size:6pt;">
							Cat. No. 42243X
						</div>
						<div style="float:right;">
							<span style="width:5mm;"/>  
								Form 
							<span class="styBoldText" style="font-size:7pt;">5074</span> (2020)
						</div>
					</div>
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
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5074Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 29, CNMI - Other Deductions From 1040 Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5074Data/CNMIAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 29, GUAM - Other Deductions From 1040 Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5074Data/GUAMAllocationGroup/OtherDeductionsFrom1040TotAmt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>