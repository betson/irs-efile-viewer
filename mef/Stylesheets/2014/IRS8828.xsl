<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8828Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8828Data" select="$RtnDoc/IRS8828"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="StaticTextAfter"/>
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
					<xsl:otherwise>padding-top:6px;</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$AmountBoxStyle">
					<xsl:value-of select="$AmountBoxStyle"/>
				</xsl:if>
			</xsl:attribute>
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
					<xsl:value-of select="$StaticTextAfter"/>
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
						<xsl:with-param name="RootElement" select="local-name($Form8828Data)"/>
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
				<meta name="Description" content="IRS Form 8828"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8828Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8828">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8828</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8828Data"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. March 2010)</span><br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Recapture of Federal Mortgage Subsidy
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:80mm;height:5mm;">
											<br/><br/><br/>
											<img src="{$ImagePath}/8828_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040.
											<span style="width:2mm;"/>
											<img src="{$ImagePath}/8828_Bullet_Sm.gif" alt="SmallBullet"/> 
											See separate instructions.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22mm;">
							<div class="styOMB" style="font-size:7pt;height:50%;padding-top:7px;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:50%;padding-top:9px;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">64</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:102mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:85mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Social security number <span class="styNormalText">(as shown on page 1 of your tax return)</span>
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
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Description of Home Subject to Federally Subsidized Debt
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">1</div>
							<div class="styIRS8828LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:100%;">
									Address of property (number and street, city or town, state, and ZIP code)
								</div>
								<div class="styIRS8828LNDesc" style="width:100%;height:7mm;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyPropertyAddress"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">2</div>
							<div class="styIRS8828LNDesc" style="width:181mm;height:100%;">
								Check the box that describes the type of federal subsidy you had on the loan for your home.
							</div>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox">a</div>
							<div class="styIRS8828LNDesc" style="width:181mm;height:100%;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyTaxExemptBondInd"/>
										<xsl:with-param name="BackupName">Form8828DataMortgSbsdyTaxExemptBondInd</xsl:with-param>
									</xsl:call-template>
								</label>
								<input class="styCkbox" type="checkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyTaxExemptBondInd"/>
										<xsl:with-param name="BackupName">Form8828DataMortgSbsdyTaxExemptBondInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								Mortgage loan from the proceeds of a tax-exempt bond
							</div>
						</div>
						<!-- (2b) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox">b</div>
							<div class="styIRS8828LNDesc" style="width:181mm;height:100%;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyMortgageCrCertInd"/>
										<xsl:with-param name="BackupName">Form8828DataMortgSbsdyMortgageCrCertInd</xsl:with-param>
									</xsl:call-template>
								</label>
								<input class="styCkbox" type="checkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyMortgageCrCertInd"/>
										<xsl:with-param name="BackupName">Form8828DataMortgSbsdyMortgageCrCertInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								Mortgage credit certificate
								<br/>
								<b>Note.</b> If neither box applies, you are not subject to recapture tax on the sale or other disposition of your home. <b>Do not</b><br/>
								complete this form.
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">3</div>
							<div class="styIRS8828LNDesc" style="width:60mm;height:100%;">
								Name of the bond or certificate issuer
							</div>
							<div class="styIRS8828LNDesc" style="width:120mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
								<div class="styIRS8828LNDesc" style="width:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:15%;height:100%;padding-left:0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerStateCd"/>
										</xsl:call-template>
									</div>
									<div class="styIRS8828LNDesc" style="width:45%;height:100%;text-align:left;word-wrap:break-word;">
										<span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerSubdivNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS8828LNDesc" style="width:40%;height:100%;text-align:left;word-wrap:break-word;">
										<span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerAgencyNm"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
								<div class="styIRS8828LNDesc" style="width:100%;border-top-width:1px;border-color:black;border-style:dotted;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:15%;height:100%;padding:0px 0px 0px 0px;text-align:center;">
										State
									</div>
									<div class="styIRS8828LNDesc" style="width:45%;height:100%;padding:0px 0px 0px 0px;text-align:center;">
										Political subdivision (city, county, etc.)
									</div>
									<div class="styIRS8828LNDesc" style="width:40%;height:100%;padding:0px 0px 0px 0px;text-align:center;">
										Agency, if any
									</div>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">4</div>
							<div class="styIRS8828LNDesc" style="width:70mm;height:100%;">
								Name and address of original lending institution
							</div>
							<div class="styIRS8828LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;border-bottom-width:1px;border-style:dotted;border-color:black;float:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLendingInstnNm"/>
								</xsl:call-template>
								<xsl:if test="$Form8828Data/MortgSbsdyOrigLendingInstnNm and $Form8828Data/MortgSbsdyOrigLendingInstnAddr">
									<br/>
								</xsl:if>
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLendingInstnAddr"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">5</div>
							<div class="styIRS8828LNDesc" style="width:110mm;height:100%;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Date of closing of the original loan
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<div class="styIRS8828LNDesc" style="width:70mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:100%;padding:0px 0px 0px 0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOriginalLoanClsDt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="width:100%;border-top-width:1px;border-color:black;border-style:dotted;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Month</div>
									<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Day</div>
									<div class="styIRS8828LNDesc" style="width:34%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Year</div>
								</div>
							</div>
						</div>
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;"/>
							<div class="styIRS8828LNDesc" style="width:180mm;height:100%;">
								<br/>
								<b>Note.</b> If the date of closing of the loan was before January 1, 1991, recapture tax does not apply. <b>Do not</b> complete this form. If
								you (1) checked the box on line 2b (mortgage credit certificate), (2) refinanced your home, and (3) received a reissued
								mortgage credit certificate, see <b>Refinancing your home</b> on page 1 of the instructions.
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">6</div>
							<div class="styIRS8828LNDesc" style="width:110mm;height:100%;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Date of sale or other disposition of your interest in the home
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:70mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:100%;padding:0px 0px 0px 0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySaleOrDisposClsDt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="width:100%;border-top-width:1px;border-color:black;border-style:dotted;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Month</div>
									<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Day</div>
									<div class="styIRS8828LNDesc" style="width:34%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Year</div>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">7</div>
							<div class="styIRS8828LNDesc" style="width:150mm;height:100%;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Number of years and full months between original closing date (line 5) and date of sale or disposition (line 6):
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:30mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:100%;padding:0px 0px 0px 0px;text-align:center;">
									<div class="styIRS8828LNDesc" style="width:45%;height:100%;padding:0px 0px 0px 0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigClsElapsYearCnt"/>
										</xsl:call-template>
									</div>
									<div class="styIRS8828LNDesc" style="width:55%;height:100%;padding:0px 0px 0px 0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigClsElapsMnthCnt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styIRS8828LNDesc" style="width:100%;border-top-width:1px;border-color:black;border-style:dotted;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:45%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Years</div>
									<div class="styIRS8828LNDesc" style="width:55%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Full months</div>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">8</div>
							<div class="styIRS8828LNDesc" style="width:180.5mm;height:100%;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:100%;height:auto;">
									Date of full repayment of the original loan including a refinancing other than one for which a replacement mortgage credit
								</div>
								<div class="styIRS8828LNDesc" style="width:100%;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:110mm;height:100%;">
										certificate was issued (see instructions)
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
										</span>
									</div>
									<div class="styIRS8828LNDesc" style="width:70mm;height:100%;padding:0px 0px 0px 0px;float:right;">
										<div class="styIRS8828LNDesc" style="width:100%;padding:0px 0px 0px 0px;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLoanPaymentDt"/>
											</xsl:call-template>
										</div>
										<div class="styIRS8828LNDesc" style="width:100%;border-top-width:1px;border-color:black;border-style:dotted;padding:0px 0px 0px 0px;">
											<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Month</div>
											<div class="styIRS8828LNDesc" style="width:33%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Day</div>
											<div class="styIRS8828LNDesc" style="width:34%;height:100%;padding:0px 0px 0px 0px;text-align:center;">Year</div>
										</div>
									</div>
								</div>								
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Computation of Recapture Tax
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">9</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Sales price of your interest in the home sold or disposed of (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySalesPriceIntHomeAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">10</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Expenses of sale. Include sales commissions, advertising, legal fees, etc.
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyExpnssFromHmSaleAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">11</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Amount realized. Subtract line 10 from line 9
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySaleOfHmRealizedAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">12</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Adjusted basis of your interest in the home sold or disposed of (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyAdjustedBasisInHmAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">13</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Gain or (loss) from sale or disposition. Subtract line 12 from line 11. If a loss, <b>stop</b> here and<br/>
									attach this form to your Form 1040. You <b>do not</b> owe recapture tax
									<xsl:if test="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd">
										<span style="width:5px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Qualifying Subordinate Mortgage Loan Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd"/>
										</xsl:call-template>
									</xsl:if>
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
										<xsl:if test="not($Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd)">
											<span style="width:11px"/>.
										</xsl:if>
									</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt"/>
										<xsl:with-param name="Number">13</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">14</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Multiply line 13 by 50% (.50)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainLossAdjHmSaleAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">15</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Modified adjusted gross income (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyModifiedAGIAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">16</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Adjusted qualifying income (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyAdjustedQlfyIncmAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">17</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Subtract line 16 from line 15. If zero or less, <b>stop</b> here and attach this form to your Form 1040.<br/>
									You <b>do not</b> owe recapture tax
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
									</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyIncomeBasisAmt"/>
										<xsl:with-param name="Number">17</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">18</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Income percentage. If the amount on line 17 is $5,000 or more, enter &#8220;100.&#8221; Otherwise, divide<br/>
									the amount on line 17 by $5,000 and enter the result as a percentage. Round to the nearest<br/>
									whole percentage
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:21px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
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
							<div class="styIRS8828LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styLNAmountBox" style="width:29mm;height:5mm;border-right-width:0px;float:right;text-align:right;padding-right:2px;padding-top:6px;font-size:6pt;color:darkblue;">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyIncomePercentageRt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="float:right;padding:3px 0px 0px 0px;border-right-width:0px;height:5mm;">18</div>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">19</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Federally subsidized amount (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyFederallySbsdzdAmt"/>
								<xsl:with-param name="Number">19</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">20</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Holding period percentage (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<div class="styLNAmountBox" style="width:29mm;height:5mm;border-right-width:0px;float:right;text-align:right;padding-right:2px;padding-top:6px;font-size:6pt;color:darkblue;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyHoldingPeriodRt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="float:right;padding:3px 0px 0px 0px;border-right-width:0px;height:5mm;">20</div>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (21) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">21</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Multiply line 19 by the percentage on line 20
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyFedSbsdzdAdjAmt"/>
								<xsl:with-param name="Number">21</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">22</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Recapture amount. Multiply line 21 by the percentage on line 18
								</div>
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyRecaptureAmt"/>
								<xsl:with-param name="Number">22</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS8828LineItem">
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">23</div>
							<div class="styIRS8828LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:auto;height:100%;">
									Tax. Enter the <b>smaller</b> of line 14 or line 22. Also, include this amount on the line for total tax on<br/>
									Form 1040. For details, see the Instructions for Form 1040
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
									</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyRecaptureTaxAmt"/>
										<xsl:with-param name="Number">23</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see Form 1040 instructions.
							</span>
						</div>
						<div style="float:right;font-size:7pt;">
							Cat. No. 13049F
							<span style="width:80px;"/>
							Form<span class="styBoldText"> 8828 </span>(Rev. 3-2010)
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
					<xsl:variable name="TableWidth">120</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8828Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 13 - Qualifying Subordinate Mortgage Loan Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>