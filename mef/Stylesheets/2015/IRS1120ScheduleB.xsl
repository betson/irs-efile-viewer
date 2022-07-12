<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120ScheduleBStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120ScheduleB" select="$RtnDoc/IRS1120ScheduleB"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120ScheduleB)"/>
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
				<meta name="Description" content="IRS Form 1120 Schedule B"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				    <!--  Updated 06/27/2014 WT: Per UWR 112237 for R9.5_D3   -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120ScheduleBStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1120ScheduleB">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:18.5mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:9pt;font-family:arial;">SCHEDULE B<br/>
								<span style="font-size:9pt;">(Form 1120)</span>
								<br/>
								<!--General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleB"/>
								</xsl:call-template>
							</span>
							<div style="line-height:120%;padding-top:1.5mm;">
								<span class="styAgency">(Rev. December 2014)</span>
								<br/>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:18.5mm;padding-top:2mm;">
							<div class="styMainTitle" style="height:8mm;">Additional Information for Schedule M-3 Filers
							</div>
							<div class="styFST" style="height:2mm;">
								<img src="{$ImagePath}/1120SchB_Bullet_Title.gif" alt="Bullet"/> Attach to Form 1120.<br/>
								<img src="{$ImagePath}/1120SchB_Bullet_Title.gif" alt="Bullet"/> See instructions on page 2.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:18.5mm;border-left-width:2px">
							<div class="styOMB" style="height:2mm;border-bottom-width: 0px;padding-top:7.5mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:120mm;height:9mm;font-size:7pt;font-weight:normal;">
						  Name
						  <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/FilerBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form1120ScheduleB/FilerBusinessName/BusinessNameLine2Txt!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/FilerBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:65mm;height:9mm;font-size:7pt;text-align:left;padding-left:2mm;font-weight:normal;">
						  Employer identification number (EIN)
						    <br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form1120ScheduleB/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:158mm;"/>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">Yes</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">No</div>
					</div>
					<!-- L1 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							Do the amounts reported on Schedule M-3 (Form 1120), Part II, lines 9 or 10, column (d), reflect allocations to this
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L1 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							corporation from a partnership of income, gain, loss, deduction, or credit that are disproportionate to this corporation’s 
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L1 R3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								capital contribution to the partnership or its ratio for sharing other items of the partnership?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">.........</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/AllocationReflectCorpPrtshpInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/AllocationReflectCorpPrtshpInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L2 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation sell, exchange, or transfer any interest in an intangible asset to
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L2 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								a related person as defined in section 267(b)?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">........................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpSellIntIntngblAstToPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpSellIntIntngblAstToPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L3 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation acquire any interest in an intangible asset from a related person
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L3 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								as defined in section 267(b)?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">.............................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpAcqIntrestIntngblAssetInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpAcqIntrestIntngblAssetInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L4a R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">4a</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							During the tax year, did the corporation enter into a cost-sharing agreement with any related foreign party on whose
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L4a R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							behalf the corporation did not file Form 5471, Information Return of U.S.
							Persons With Respect To Certain Foreign
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L4a R3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								Corporations?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">..................................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpEnterCostSharingAgrmtInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpEnterCostSharingAgrmtInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L4b R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, was the corporation a participant in a cost-sharing arrangement with any related foreign
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L4b R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								party on whose behalf the corporation did not file Form 5471?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">...................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpPartcpCostSharingAgrmtInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpPartcpCostSharingAgrmtInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L5 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation make any change in an accounting principle for financial accounting
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L5 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								purposes? See instructions for the definition of change in accounting principle
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">..............</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/ChangeInAccountingPrincipleInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/ChangeInAccountingPrincipleInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L6 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation make any change in a method of accounting for U.S. income tax
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L6 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								purposes?
						   </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">...................................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L7 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation own any voluntary employees’ beneficiary association (VEBA)
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L7 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								trusts that were used to hold funds designated for employee benefits?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/VoluntaryEmplBenefAssocTrInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/VoluntaryEmplBenefAssocTrInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L8 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							At any time during the tax year, did the corporation use an allocation method for indirect costs capitalized to self-
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L8 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								constructed assets that varied from its financial method of accounting?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;border-bottom-width: 1px; ">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpUseVariedAllocnMthdCostInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;border-bottom-width: 1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpUseVariedAllocnMthdCostInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Blank Line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
					</div>
					<!-- L9 R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
						   At any time during the tax year, did the corporation treat for tax purposes indirect costs, as defined in Regulations 
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L9 R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
						  section 1.263A-1(e)(3)(ii)(F), (G), and (H), as mixed-service costs, as defined in Regulations section 1.263A-
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L9 R3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								1(e)(4)(ii)(C)?
							</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">..................................</span>
							</span>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/TreatIndrCostAsMxdSrvcCostInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/TreatIndrCostAsMxdSrvcCostInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10 -->
					<!-- Blank Line -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L10R1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">10</div>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
						  Did the corporation, under section 118 or 362(c) and the related regulations, take a return filing position characterizing 
						</div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!-- L10R2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
						  any amount as a contribution to the capital of the corporation during the tax year by any non-shareholders? Amounts  
					    </div>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						<div class="styShadingCell" style="height:4mm;width:10mm;"/>
					</div>
					<!--L10R3 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:158mm;height:4mm;">
							<span style="float:left;">
								so characterized may include, without limitation, incentives, inducements, money, and property
							</span>
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span class="styDotLn">........</span>
							</span>
							<!--Dotted Line-->
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;border-bottom-width: 0px; ">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpSectTakeContriNonShrInd "/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120ScheduleBLNYesNoBox" style="height:4mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleB/CorpSectTakeContriNonShrInd "/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10 -->
					<!-- Page End -->
					<div style="width:187mm;">
						<div class="stySmallText" style="width:110mm;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
						</div>
						<div class="stySmallText" style="width:25mm;">Cat. No. 49737Q</div>
						<div class="stySmallText" style="width:51mm;text-align:right;">
							<span class="styBoldText">Schedule B (Form 1120) (Rev. 12-2014)</span>
						</div>
					</div>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleB"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- JMI: Additional Data Table-->
					<!-- Separated Data for 6b -->
					<xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleB/ForeignCountryCode) &gt; 10)">
						<br/>
						<br/>
						<span class="styTopSectionLine" style="font-size:7pt;">
							<b>Form 1120 Schedule N, Line 6b:</b>
						</span>
						<br/>
						<div class="styTopSectionLine" style="font-size:7pt;">
							<div class="styTopSectionLineLbl" style="float:left">
								<b>If "Yes," enter the name of the foreign country:</b>
							</div>
							<div class="styExplanationLine" style="float:left">
								<br/>
								<xsl:for-each select="$Form1120ScheduleB/ForeignCountryCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="position() != last()">,<span style="width:4px;"/>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
					<br/>
					<br/>
					<!-- /Separated Data for 6b -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>