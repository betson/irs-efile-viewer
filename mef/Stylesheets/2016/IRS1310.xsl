<?xml version="1.0" encoding="UTF-8"?>

<!-- Last modified on 10/22/2014 by Harold Nadel for IBM Defect 41685 Data Display for Form 1310 -->
<!-- Last modified on 10/22/2014 by Harold Nadel for IBM Defect 41686 PDF Compare for Form 1310 -->
<!-- Last modified on 05/28/2015 by Harold Nadel for WR # 123023 changes for IE11-->
<!-- Last modified on 02/13/2017 by Harold Nadel for KISAM #02833161 added back InCareOfNm variable so that the filer name displays correctly. -->
<!--                                           Defect # 60719 -->
<!-- Last modified on -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1310Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1310"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
				<meta name="Description" content="IRS Form 1310"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1310Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1310">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:23mm;">
            Form<span class="styFormNumber"> 1310</span><br/>(Rev. August 2014)
							<div class="styAgency" style="padding-top:1mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">Statement of Person Claiming<br/>
Refund Due a Deceased Taxpayer</div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:3mm;"><br/>
								<img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>Information about Form 1310 is available at www.irs.gov/form1310.
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:0mm;"><br/><br/>
								<img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>See instructions below and on back.
							</div> 
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;">
							<div class="styOMB" style="height:8mm;padding-top:2mm">OMB No. 1545-0074</div>
							<div class="stySequence" style="padding-top:2mm">Attachment<br/>Sequence No. <b>87</b>
							<!--<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;padding-top:1mm;">Attachment<br/>
            Sequence No. <span class="styBoldText">87</span>-->
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div style="padding:2mm 0mm;font-size:9pt;">Tax year decedent was due a refund:</div>
						<div style="padding:1mm 0mm;font-size:8pt;">Calendar year 
						<span style="width:15mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxYr"/>
							</xsl:call-template>
						</span>
						, or other tax year beginning 
						<span style="width:15mm;">
							<xsl:if test="$FormData/RefundDueTaxPeriod">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodBeginDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodBeginDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodBeginDt"/>
								</xsl:call-template>
							</xsl:if>
						</span>, 20
						<span style="width:10mm"/>, and ending
						<span style="width:20mm;">
							<xsl:if test="$FormData/RefundDueTaxPeriod">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodEndDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodEndDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/RefundDueTaxPeriod/RefundDueTaxPeriodEndDt"/>
								</xsl:call-template>
							</xsl:if>
						</span>, 20
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:auto;">
						<div class="styGenericDiv" style="width:15mm;height:20mm;float:left;font-weight:bold;font-size:9pt;text-align:center;padding:13mm 0mm;">Please<br/>print<br/>or<br/>type</div>
						<div class="styGenericDiv" style="width:171mm;height:9mm;border-left:1px solid black;border-bottom:1px solid black;padding-left:2mm;">
							<div class="styNameBox" style="width:78mm;height:9mm;font-size:7pt;">
								<div>Name of decedent</div><br/>
								<span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DecedentNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameBox" style="width:40mm;height:9mm;font-size:7pt;padding-left:2mm;">
								<div>Date of death</div><br/>
								<span>
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$FormData/DeathDt"/>
									</xsl:call-template> /
									<xsl:call-template name="PopulateDay">
										<xsl:with-param name="TargetNode" select="$FormData/DeathDt"/>
									</xsl:call-template> /
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/DeathDt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:50mm;height:9mm;padding-left:1mm;font-size:7pt;">
								<div style="font-weight:bold;">Decedent&#8217;s social security number</div>
								<span style="width:27mm;text-align:left;font-weight:normal;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/DecedentSSN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:171mm;height:9mm;border-left:1px solid black;border-bottom:1px solid black;padding-left:2mm;">
							<div class="styNameBox" style="width:118mm;height:9mm;font-size:7pt;">
								<div>Name of person claiming refund</div><br/>
								<span>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
									    <!-- <xsl:call-template name="PopulateText"> -->
										 <xsl:with-param name="TargetNode">InCareOfNm</xsl:with-param>
										<!-- <xsl:with-param name="TargetNode" select="$FormData/PersonNameControlTxt"/> -->
									</xsl:call-template>
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Header - Name Control of Person Claiming Refund</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/PersonNameControlTxt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:50mm;height:9mm;padding-left:1mm;font-size:7pt;">
								<div style="font-weight:bold;">Your social security number</div>
								<span style="width:27mm;text-align:left;font-weight:normal;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantSSN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:171mm;height:auto;border-left:1px solid black;border-bottom:1px solid black;padding-left:2mm;">
							<span class="styNameBox" style="width:138mm;height:auto;font-size:7pt;">
								<span> Home address (number and street). If you have a P.O. box, see instructions.</span><br/>
								<span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/RefundClaimantUSAddress/AddressLine2Txt!=''">
										<br/>
										<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantUSAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</span>
							<span class="styNameBox" style="width:30mm;height:auto;font-size:7pt;border-right:none;padding-left:2mm;">Apt. no.</span>
						</div>
						<div class="styGenericDiv" style="width:171mm;height:8mm;border-left:none;padding-left:15mm;">
							<div class="styNameBox" style="width:168mm;height:8mm;font-size:7pt;border-right:none;border-left:1px solid black;padding-left:2mm;">
								<div>City, town or post office, state, and ZIP code. If you have a foreign address, see instructions.</div> <br/>
								<span>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantUSAddress"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Part I -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black;border-bottom:1px solid black;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part I</div>
						<div class="styPartDesc">Check the box that applies to you.  <span style="font-weight:normal">Check only one box.</span> Be sure to complete Part III below.</div>
					</div>
					<!-- Part I, Line A -->
					<div class="styGenericDiv" style="width:187mm;padding-top:1mm;font-size:8pt;">
						<span class="styLNLeftLtrBox">A</span>
						<div class="styGenericDiv">
						<input type="checkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
							<xsl:with-param name="BackupName">FormDataSurvivingSpouseInd</xsl:with-param>
						</xsl:call-template></input></div>
						<label>
						  <xsl:call-template name="PopulateLabel">
						  <xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
						  <xsl:with-param name="BackupName">FormDataSurvivingSpouseInd</xsl:with-param>
						  </xsl:call-template>
							<span style="line-height:4mm;">Surviving spouse requesting reissuance of a refund check (see instructions).</span>
						</label>
					</div>
					<!-- Part I, Line B -->
					<div class="styGenericDiv" style="width:190mm;clear:all;height:auto;font-size:8pt;">
						<span class="styLNLeftLtrBox">B</span>
						<div class="styGenericDiv" ><input type="checkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/CourtOrPersonalRepInd"/>
							<xsl:with-param name="BackupName">FormDataCourtOrPersonalRepInd</xsl:with-param>
						</xsl:call-template></input></div>
						<label>
						  <xsl:call-template name="PopulateLabel">
						  <xsl:with-param name="TargetNode" select="$FormData/CourtOrPersonalRepInd"/>
						  <xsl:with-param name="BackupName">FormDataCourtOrPersonalRepInd</xsl:with-param>
						  </xsl:call-template>
							<div class="styGenericDiv" style="line-height:4mm;width:175mm;">Court-appointed or certified personal representative (defined below). Attach a court certificate showing your appointment, <br/> unless previously filed (see instructions).</div>
						</label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/CertificatePreviouslyFiledCd"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/CertificatePreviouslyFiledCd"/>
							<xsl:with-param name="Desc">Certificate Previously Filed Code</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Part I, Line C -->
					<div class="styGenericDiv" style="width:187mm;padding-bottom:1mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="clear:left;">C</div>
						<div class="styGenericDiv"><input type="checkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/OtherPersonClaimingRefundInd"/>
							<xsl:with-param name="BackupName">FormDataOtherPersonClaimingRefundInd</xsl:with-param>
						</xsl:call-template></input>
						
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part I Line C - Valid Proof Of Death Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ValidProofOfDeathInd"/>
							</xsl:call-template>
						
						</div>
						<label>
						  <xsl:call-template name="PopulateLabel">
						  <xsl:with-param name="TargetNode" select="$FormData/OtherPersonClaimingRefundInd"/>
						  <xsl:with-param name="BackupName">FormDataOtherPersonClaimingRefundInd</xsl:with-param>
						  </xsl:call-template>
							<span style="line-height:4mm;">Person, <span style="font-weight:bold;">other</span> than A or B, claiming refund for the decedent&#8221;s estate (see instructions). Also, complete Part II.</span>
						</label>
						</div>
							<!-- Part I END -->
							<!-- Part II -->
						<div class="styBB" style="width:187mm;border-top:1px solid black;padding:1mm 0mm;">
							<div class="styPartName" style="font-family:sans-serif;">Part II</div>
							<div class="styPartDesc">Complete this part only if you checked the box on line C above.</div>
						</div>
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNDesc" style="width:157mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;">Yes</div>
							<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;">No</div>
					</div>
					<!-- Part II, Line 1 -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">1</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">Did the decedent leave a will?<span style="letter-spacing:3mm;">..........................</span></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentHasWillInd"/>
						</xsl:call-template></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentHasWillInd"/>
						</xsl:call-template></div>
					</div>
					<!-- Part II, Line 2a -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">2a</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">Has a court appointed a personal representative for the estate of the decedent?<span style="letter-spacing:3mm;">.......</span></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/CourtAppointedRepInd"/>
						</xsl:call-template></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/CourtAppointedRepInd"/>
						</xsl:call-template></div>
					</div>
					<!-- Part II, Line 2b -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;text-align:right;padding-right:1.5mm;">b</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">If you answered <span style="font-weight:bold;">"No" </span> to 2a, will one be appointed?<span style="letter-spacing:3mm;">..................</span></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/RepresentativeToBeAppointedInd"/>
						</xsl:call-template></div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/RepresentativeToBeAppointedInd"/>
						</xsl:call-template></div>
					</div>
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;"/>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;">If you answered <span style="font-weight:bold;">"Yes" </span> to 2a or 2b, the personal representative must file for the refund.</div>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNRightNumBox" style="width:15mm;height:4.5mm;background-color:lightgrey;"/>
					</div>
					<!-- Part II, Line 3 -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:8mm">3</div>
						<div class="styLNDesc" style="width:150mm;height:8mm;">As the person claiming the refund for the decedent's estate, will you pay out the refund according to the laws of the state where the decedent was a legal resident?<span style="letter-spacing:3mm;">................</span></div>
						<div class="styLNRightNumBox" style="width:15mm;height:8mm;font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/PaymentAccordingToStateLawInd"/>
						</xsl:call-template></div>
						<div class="styLNRightNumBox" style="width:15mm;height:8mm;font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/PaymentAccordingToStateLawInd"/>
						</xsl:call-template></div>
					</div>
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;"/>
						<div class="styLNDesc" style="width:180mm;">If you answered <span style="font-weight:bold;">"No"</span> to 3, a refund cannot be made until you submit a court certificate showing your appointment <br/> as personal representative or other evidence that you are entitled under state law to receive the refund.</div>
						<div class="styLNRightNumBox" style="width:30mm;border:none;"/>
					</div>
					<!-- Part III -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part III</div>
						<div class="styPartDesc">Signature and verification. All filers must complete this part.</div>
					</div>
					<div style="width:187mm;font-size:8pt;height:16mm;">
						I request a refund of taxes overpaid by or on behalf of the decedent. Under penalties of perjury, I declare that I have examined this claim, and to the best of my knowledge and belief, it is true, correct, and complete.
					</div>
					<div style="width:187mm;font-size:8pt;font-weight:bold;">
						<!-- <span style="width:150mm;"><img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>Signature of person claiming refund</span> -->
						<span style="width:150mm;">Signature of person claiming refund  <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/></span>
						<span style="width:37mm;">Date  <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantSignatureDt"/>
						</xsl:call-template>-<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantSignatureDt"/>
						</xsl:call-template>-<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/RefundClaimantSignatureDt"/>
						</xsl:call-template>
						</span>
					</div>
					<!-- capturing the page bottom info -->
					<div class="pageEnd" style="width:187mm; font-size:7pt; border-top:1mm solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Privacy Act and Paperwork Reduction Act Notice, see page 2.</b>
						</div>
						<div style="float:right">
						<span style="width:2.5mm"/>
						Cat. No. 11566B
						<span style="width:10mm"/>
						Form <b style="font-size:9pt">1310</b> (Rev. 8-2014)
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Name Control of Person Claiming Refund</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PersonNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$FormData/CertificatePreviouslyFiledCd"/>
						<xsl:with-param name="Desc">Certificate Previously Filed Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$FormData/ValidProofOfDeathInd"/>
						<xsl:with-param name="Desc">Part I Line C - Valid Proof Of Death Indicator</xsl:with-param>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>