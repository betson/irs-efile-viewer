<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;"> <!ENTITY mdash "&#8212;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8038CPStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8038CP" />
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
				<meta name="Description" content="IRS Form 8038-CP" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8038CPStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8038CP">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:34mm;height:17mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:15pt;">8038-CP</span> 
							<div class="" style="padding-top:.5mm;font-size:7pt;">
								(Rev. January 2022)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
									<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styAgency" style="padding-top:0.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:124mm;height:17mm;">
							<span class="styFMT" style="font-size:13pt;">Return for Credit Payments <br />
							to Issuers of Qualified Bonds</span>
							<br />
							<span style="font-weight:bold;padding-top:1.5mm;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8038CP</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:17mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:7mm;border-bottom-width:0px;">OMB No. 1545-0047</div>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Information on Entity That Is To Receive Payment
							<span style="float:right;font-weight:normal;font-size;7pt;font-family:Arial;">
								Check if <strong>Amended Return</strong> (see instructions) &#9658; 
								<input type="checkbox" class="styCkboxNM" style="margin-top:1px;margin-bottom:1px;margin-left:8px;" alt="Amended Return Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">IRS8038CPAmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Entity Receiving Payment -->
					<xsl:variable name="EntitySame" select="$FormData/ReportingAuthorityGrp/ReceiverAndIssuerSameEntityCd"/>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBoxSD">1</span>
							Name of entity that is to receive payment of the credit <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/EntityReceivingPaymentGrp/BusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBoxSD">2</span> 
							<strong>Employer identification number (EIN)</strong><br />
							<xsl:choose>
								<xsl:when test="$EntitySame"><xsl:call-template name="PopulateReturnHeaderFilerTIN"/></xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/EIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:157mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBoxSD">3</span>
							Number and street (or P.O. box no. if mail is not delivered to street address) <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
										<br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/EntityReceivingPaymentGrp/USAddress/AddressLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:30mm;min-height:4mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							Room/suite<br />
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:187mm;min-height:7mm;padding:0.5mm;">
							<span class="sty8038CPNumBoxSD">4</span>
							City, town, or post office; state; and ZIP code <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/USAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBoxSD">5</span>
							<span style="font-family:Arial;">
							Name and title of designated contact person whom the IRS may contact for more information</span> <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonNm"/>
									</xsl:call-template>
									<span style="float:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonTitleTxt"/>
										</xsl:call-template>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/ContactPersonNm"/>
									</xsl:call-template>
									<span style="float:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/ContactPersonTitleTxt"/>
										</xsl:call-template>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBoxSD">6</span> 
							<span style="font-family:Arial;">
							Telephone number of contact person shown on line 5 </span><br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonPhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/EntityReceivingPaymentGrp/ContactPersonPhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Reporting Authority</div>
					</div>
					<div class="styStdDiv" style="">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBoxSD">7</span>
							Issuer's name (if same as line 1, enter "SAME" and skip lines 8, 9, 11, 15, and 16) <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ReceiverAndIssuerSameEntityCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBoxSD">8</span> 
							EIN<br />
							<xsl:choose>
								<xsl:when test="$EntitySame">&nbsp;</xsl:when>
								<xsl:otherwise><xsl:call-template name="PopulateReturnHeaderFilerTIN"/></xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:100mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBoxSD">9</span>
							<span style="font-family:Arial;">
							Number and street (or P.O. box no. if mail is not delivered to street address) </span><br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									&nbsp;
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
										<br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:17mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;border-right:1px solid black;">
							Room/suite<br />
							<xsl:if test="not($EntitySame) and $RtnHdrData/Filer//AddressLine2Txt"><br /></xsl:if>
							&nbsp;
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0mm 1mm;">
							<span class="sty8038CPNumBox">10</span> 
							Report number (see instructions) <br />
							<span style="border:1px solid black;width:16mm;text-align:center;margin-left:8mm;margin-top:1px;border-bottom-width:0px;">
								<xsl:if test="not($EntitySame) and $RtnHdrData/Filer//AddressLine2Txt">
									<xsl:attribute name="style">border:1px solid black;width:16mm;text-align:center;margin-left:8mm;margin-top:1px;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ReportNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBox">11</span>
							City, town, or post office; state; and ZIP code <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									&nbsp;
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBox">12</span> 
							Date of issue (MM/DD/YYYY) <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/BondIssueDt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBox">13</span>
							Name of issue <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/BondIssueNm"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBox">14</span> 
							CUSIP number (see instructions) <br />
							<xsl:choose>
								<xsl:when test="$FormData/ReportingAuthorityGrp/MissingCUSIPReasonCd">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/MissingCUSIPReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/CUSIPNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="float:left;width:117mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							<span class="sty8038CPNumBox">15</span>
							<span style="font-family:Arial;">
							Name and title of officer or other person whom the IRS may contact for more information</span> <br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									&nbsp;
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonNm"/>
									</xsl:call-template>
									<span style="float:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonTitleTxt"/>
										</xsl:call-template>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="float:left;width:70mm;min-height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<span class="sty8038CPNumBox">16</span> 
							<span style="font-family:Arial;">
							Telephone number of contact person shown on line 15 </span><br />
							<xsl:choose>
								<xsl:when test="$EntitySame">
									&nbsp;
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/ContactPersonPhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">17a</div>
						<div class="styLNDesc" style="width:103mm;height:auto;">
							Check applicable box <span style="font-family:Arial Narrow;">(see instructions)</span> &#9658; 
							<input type="checkbox" class="styCkboxNM" style="" alt="Variable rate bond">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/VariableRateBondInd"/>
									<xsl:with-param name="BackupName">IRS8038CPVariableRateBondInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Variable rate bond 
							<input type="checkbox" class="styCkboxNM" style="margin-left:11px;" alt="Fixed rate bond">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/FixedRateBondInd"/>
									<xsl:with-param name="BackupName">IRS8038CPFixedRateBondInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Fixed rate bond
						</div>
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:2.2mm;">b</div>
						<div class="styLNDesc" style="width:29mm;">
							Enter the issue price &#9658;
						</div>
						<div class="styLNRightNumBox" style="height:4.6mm;">17b</div>
						<div class="styLNAmountBox" style="height:4.6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/IssuePriceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:4.6mm;">
							Enter code number for type of bonds (see instructions)
							<span class="sty8038CPDotLn" style="float:none;margin-left:1px;">...........</span>
							<span style="width:16mm;min-height:3mm;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ReportingAuthorityGrp/BondTypeCd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Payment of Credit 
							<span style="font-weight:normal;">(For specified tax credit bonds with multiple maturities, see instructions.)</span>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc">
							Interest payment date to which this payment of credit relates (MM/DD/YYYY)
							<span style="width:40mm; min-height:3mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/InterestPaymentDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 19a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19a</div>
						<div class="styLNDesc">
							Interest payable to bondholders on the interest payment date. See instructions
							<span class="sty8038CPDotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">19a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestPayableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="font-family:Arial;">
							For specified tax credit bonds only, enter the applicable credit rate determined under sec. 54A(b)(3)
							<span style="width:16mm;min-height:3mm;border-bottom:1px solid black;text-align:right;font-family:Verdana;margin-left:4mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/Section54Ab3CreditRt"/>
								</xsl:call-template> 
							</span> %
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 19a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							For specified tax credit bonds only, complete Schedule A and enter amount from Schedule A, line 3
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEligibleInterestCmptAmt"/>
							</xsl:call-template>
							<span class="sty8038CPDotLn">..</span>
						</div>
						<div class="styLNRightNumBox">19c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEligibleInterestCmptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							Amount of credit allowed for the interest payment date (complete only line 20a, 20b, 20c, 20d, 20e, or 20f)
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 20a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Build America bonds. Multiply line 19a by 35% (0.35)
							<span class="sty8038CPDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">20a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BuildAmericaBondCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Recovery zone economic development bonds. Multiply line 19a by 45% (0.45)
							<span class="sty8038CPDotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">20b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RcvryZoneEconomicDevBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							New clean renewable energy bonds, enter the smaller of lines 19a or 19c
							<span class="sty8038CPDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">20c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NewCleanRenewableEgyBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Qualified energy conservation bonds, enter the smaller of lines 19a or 19c
							<span class="sty8038CPDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">20d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedEnergyCnsrvBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc">
							Qualified zone academy bonds, enter the smaller of lines 19a or 19c
							<span class="sty8038CPDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">20e</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedZoneAcademyBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc">
							Qualified school construction bonds, enter the smaller of lines 19a or 19c
							<span class="sty8038CPDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">20f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedSchoolConstrBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc">
							Adjustment to previous credit payments (complete line 21a OR 21b only)
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 21a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Net increase to previous payments
							<span class="sty8038CPDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">21a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreasePreviousPaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Net decrease to previous payments
							<span class="sty8038CPDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">21b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetDecreasePreviousPaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:4.6mm;">
							Enter explanation code for lines 21a or 21b (see instructions)
							<span class="sty8038CPDotLn" style="float:none;margin-left:1px;">..........</span>
							<span style="width:16mm;min-height:3mm;border:1px solid black;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseExplnCdTxt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseExplnCdTxt"/>
										</xsl:call-template> 
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseExplnCd"/>
										</xsl:call-template> 
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 21c - Net Increase/Decrease Short Description</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseShortDesc"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 21c - Net Increase/Decrease Description</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="font-family:Arial;">
							Amount of credit payment requested. Combine either line 20a, 20b, 20c, 20d, 20e, or 20f with line 21a or line 21b
							<span class="sty8038CPDotLn" style="font-family:Verdana;">...</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditPaymentRequestedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23a</div>
						<div class="styLNDesc" style="width:148mm;">
							Has there been a change to the debt service schedule most recently filed with the IRS? 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleChangeInd"/>
							</xsl:call-template>
							<span class="sty8038CPDotLn">........</span>
						</div>
						<div class="styGenericDiv" style="width:30mm;text-align:center;font-weight:bold;padding-top:2px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleChangeInd"/>
							</xsl:call-template>
							Yes 
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Debt Service Schedule Change Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleChangeInd"/>
									<xsl:with-param name="BackupName">IRS8038CPDebtServiceScheduleChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Debt Service Schedule Change No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleChangeInd"/>
									<xsl:with-param name="BackupName">IRS8038CPDebtServiceScheduleChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Line 23b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							If "Yes", enter the explanation code and attach the revised debt service schedule (see instructions)
							<span class="sty8038CPDotLn" style="float:none;margin-left:1px;">.</span>
							<span style="width:16mm;min-height:3mm;border:1px solid black;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleExplnCdTxt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleExplnCdTxt"/>
										</xsl:call-template> 
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleExplnCd"/>
										</xsl:call-template> 
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 23b - Debt Service Schedule Explanation</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleShortDesc"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 23b - Debt Service Schedule Explanation</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleDesc"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 24a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24a</div>
						<div class="styLNDesc" style="width:148mm;">
							Have you paid or will you pay all the interest from line 19a on or before the date from line 18? See instructions
							<span class="sty8038CPDotLn">..</span>
						</div>
						<div class="styGenericDiv" style="width:30mm;text-align:center;font-weight:bold;padding-top:2px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/InterestPaidBeforePaymentDtInd"/>
							</xsl:call-template>
							Yes 
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Interest Paid Before Payment Date Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InterestPaidBeforePaymentDtInd"/>
									<xsl:with-param name="BackupName">IRS8038CPInterestPaidBeforePaymentDtInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Interest Paid Before Payment Date No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InterestPaidBeforePaymentDtInd"/>
									<xsl:with-param name="BackupName">IRS8038CPInterestPaidBeforePaymentDtInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Line 24b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							If "No", enter the explanation code (see instructions)
							<span class="sty8038CPDotLn" style="float:none;margin-left:6px;">...............</span>
							<span style="width:16mm;min-height:3mm;border:1px solid black;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtExplnCdTxt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtExplnCdTxt"/>
										</xsl:call-template> 
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtExplnCd"/>
										</xsl:call-template> 
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 24b - Interest Not Paid Before Payment Date Explanation</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtShortDesc"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III, Line 24b - Interest Not Paid Before Payment Date Explanation</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtDesc"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:148mm;">
							Is this return submitted for the final interest payment date for the bonds?
							<span class="sty8038CPDotLn">.............</span>
						</div>
						<div class="styGenericDiv" style="width:30mm;text-align:center;font-weight:bold;padding-top:2px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FinalInterestPaymentDtInd"/>
							</xsl:call-template>
							Yes 
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Final Interest Payment Date Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalInterestPaymentDtInd"/>
									<xsl:with-param name="BackupName">IRS8038CPFinalInterestPaymentDtInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
							<input type="checkbox" class="styCkboxNM" style="margin-right:4mm;" alt="Final Interest Payment Date No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalInterestPaymentDtInd"/>
									<xsl:with-param name="BackupName">IRS8038CPFinalInterestPaymentDtInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Direct Deposit -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styGenericDiv" style="height:12mm;width:20mm;padding-top:0.5mm;font-size:12pt;font-weight:bold;border-right:1px solid black;">
							Direct Deposit
						</div>
						<div class="styGenericDiv" style="height:12mm;width:127mm;">
							<div class="styGenericDiv" style="width:100%">
								<div class="styLNLeftNumBox">26</div>
								<div class="styLNDesc" style="width:110mm;">Enter direct deposit information below: </div>
							</div>
							<div class="styGenericDiv" style="width:100%">
								<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
								<div class="styLNDesc" style="width:27mm;">Routing number </div>
								<div class="styLNDesc" style="border:1px solid black;text-align:center;width:40mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
									</xsl:call-template>
								</div>
								<div class="styLNLeftNumBox" style="padding-left:1mm;">&#9658; b</div>
								<div class="styLNDesc" style="width:40mm;padding-top:0px;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									</xsl:call-template>
									Type: 
									<input type="checkbox" class="styCkboxNM" style="" alt="Checking">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									Checking
									<input type="checkbox" class="styCkboxNM" style="margin-left:6px;" alt="Savings">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									Savings
								</div>
							</div>
							<div class="styGenericDiv" style="width:100%">
								<div class="styLNLeftNumBox" style="padding-left:4.2mm;height:auto;">c</div>
								<div class="styLNDesc" style="width:27mm;height:auto;padding-bottom:0px;">Account number </div>
								<div class="styLNDesc" style="border:1px solid black;text-align:center;width:80mm;border-bottom-width:0px;padding-bottom:0px;height:auto;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styGenericDiv" style="height:12mm;width:40mm;border-left:1px solid black;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:24.5mm;font-size:10pt;font-weight:bold;padding-top:5mm;border-right:1px solid black;">
							Signature <br /> and <br /> Consent
						</div>
						<div class="styGenericDiv" style="width:166mm;font-size:6pt;padding:0.5mm;margin-bottom:1mm;">
							Under penalties of perjury, I declare that I have examined this return, and accompanying schedules and statements, and to the best of my knowledge 
							and belief, they are true, correct, and complete. I further declare that I authorize the IRS to send the requested refundable credit payment to the entity 
							identified in Part I, and I consent to the disclosure of the issuer's return information, as necessary to process the refundable credit payment, to the 
							designated contact person(s) listed above in Parts I and II, as applicable.<br />
						</div>
						<div class="styGenericDiv" style="width:166mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/8038CP_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:72mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;">
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/IssuerSignatureGrp/PersonNm"/>
									</xsl:call-template>
								</span>
								<span>Signature of issuer</span>
							</div>
							<div class="styGenericDiv" style="width:16mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;">
									<br />
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/IssuerSignatureGrp/SignatureDt"/>
									</xsl:call-template>
								</span>
								<span>Date</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/8038CP_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:65mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;">
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/IssuerSignatureGrp/PersonTitleTxt"/>
									</xsl:call-template>
								</span>
								<span>Type or print name and title</span>
							</div>
						</div>
					</div>
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:20mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<strong>For Paperwork Reduction Act Notice, see the separate instructions.</strong>
						<span style="margin-left:10mm;">Cat. No. 52810E</span>
						<span style="float:right;">Form <strong>8038-CP</strong> (Rev. 1-2022)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description <xsl:value-of select="position()"/></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 21c - Net Increase/Decrease Short Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseShortDesc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 21c - Net Increase/Decrease Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NetIncreaseDecreaseGrp/NetIncreaseDecreaseDesc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 23b - Debt Service Schedule Explanation</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleShortDesc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 23b - Debt Service Schedule Explanation</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/DebtServiceScheduleExplnGrp/DebtServiceScheduleDesc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 24b - Interest Not Paid Before Payment Date Explanation</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtShortDesc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 24b - Interest Not Paid Before Payment Date Explanation</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IntNotPaidBfrPymtDtExplnGrp/IntNotPaidBfrPymtDtDesc"/>
						</xsl:call-template>
					</table>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
