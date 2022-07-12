<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 11/09/2015 -->
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
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				padding:3px 0px 0px 0px;
				border-right-width:0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>	
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;text-align:right;padding-right:2px;font-size:6pt;
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
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
								<br/>
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
						<div class="styIRS8828LineItem" style="height:15mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">1</div>
							<div class="styIRS8828LNDesc" style="width:181mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:187mm">
									Address of property (number and street, city or town, state, and ZIP code)
								</div>
								<div class="styIRS8828LNDesc" style="width:187mm;height:7mm;">
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
							<div class="styIRS8828LNDesc" style="width:181mm;">
								Check the box that describes the type of federal subsidy you had on the loan for your home.
							</div>
						</div>
						<!-- (2a) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem">
							<div class="styIRS8828LNLeftNumBox">a</div>
							<div class="styIRS8828LNDesc" style="width:181mm;">
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
						<div class="styIRS8828LineItem" style="height:10mm">
							<div class="styIRS8828LNLeftNumBox">b</div>
							<div class="styIRS8828LNDesc" style="width:181mm;">
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
								<b>Note.</b> If neither box applies, you are not subject to recapture tax on the sale or other disposition of your home.
								<b>Do not</b><br/>complete this form. 
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:auto; width:187mm">
							<br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">3</div>
							<div class="styIRS8828LNDesc" style="width:60mm;">
								Name of the bond or certificate issuer
							</div>
							<div class="styIRS8828LNDesc" style="width:120mm;height:auto;padding:0px 0px 0px 0px;">
								<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
								<div class="styIRS8828LNDesc" style="width:120mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:17mm;height:auto;padding-left:0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerStateCd"/>
										</xsl:call-template>
									</div>
									<div class="styIRS8828LNDesc" style="width:56mm;height:auto;text-align:left;word-wrap:break-word;">
										<span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerSubdivName"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS8828LNDesc" style="width:47mm;height:auto;text-align:left;word-wrap:break-word;">
										<span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyCertIssuerAgencyName"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
								<div class="styIRS8828LNDesc" style="width:110mm;border-top-width:1px;border-color:black;border-style:dotted;
								  padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:17mm;padding:0px 0px 0px 0px;text-align:center;">
										State
									</div>
									<div class="styIRS8828LNDesc" style="width:66mm;padding:0px 0px 0px 15px;text-align:left;">
										Political subdivision (city, county, etc.)
									</div>
									<div class="styIRS8828LNDesc" style="width:25mm;padding:0px 0px 0px 15px;text-align:left;">
										Agency, if any
									</div>
								</div>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:12mm;">
							<br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">4</div>
							<div class="styIRS8828LNDesc" style="width:70mm;height:auto;">
								Name and address of original lending institution
							</div>
							<div class="styIRS8828LNDesc" style="width:110mm;height:auto;padding:0px 0px 0px 0px;border-bottom-width:1px;
							  border-style:dotted;border-color:black;float:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLendingInstnName"/>
								</xsl:call-template>
								<br/>
								<xsl:if test="$Form8828Data/MortgSbsdyOrigLendingInstnNm and $Form8828Data/MortgSbsdyOrigLendingInstnAddr">
									<br/>
								</xsl:if>
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLendingInstnAddr"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:3mm">
							<br/><br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">5</div>
							<div class="styIRS8828LNDesc" style="width:110mm;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:50mm;">
									Date of closing of the original loan
								</div>
								<div class="styIRS8828LNDesc" style="width:60mm;text-align:right;float:right;padding:0px 0px 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">...............</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOriginalLoanClsDt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="width:70mm;border-top-width:1px;border-color:black;border-style:dotted;
								  padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Month</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Day</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Year</div>
								</div>
							</div>
						</div>
						<div class="styIRS8828LineItem" style="height:20mm">
							<br/><br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;"/>
							<div class="styIRS8828LNDesc" style="width:180mm;">
								<br/><br/>
								<b>Note.</b> If the date of closing of the loan was before January 1, 1991, recapture tax does not apply. 
								<b>Do not</b> complete this form. If you (1) checked the box on line 2b (mortgage credit certificate), 
								(2) refinanced your home, and (3) received a reissued mortgage credit certificate, see <b>Refinancing your home</b>
								 on page 1 of the instructions.
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:10mm">
							<br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">6</div>
							<div class="styIRS8828LNDesc" style="width:110mm;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:80mm;">
									Date of sale or other disposition of your interest in the home
								</div>
								<div class="styIRS8828LNDesc" style="width:30mm;text-align:right;float:right;padding:0px 0px 0px 5px;">
									<!--Dotted Line-->
									<span class="styDotLn">.......</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySaleOrDisposClsDt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="width:70mm;border-top-width:1px;border-color:black;border-style:dotted;
								  padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Month</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Day</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Year</div>
								</div>
							</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:10mm;">
							<br/>
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">7</div>
							<div class="styIRS8828LNDesc" style="width:142mm;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:142mm;">
									Number of years and full months between original closing date (line 5) and date of sale or disposition (line 6):
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:30mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:30mm;padding:0px 0px 0px 0px;text-align:center;">
									<div class="styIRS8828LNDesc" style="width:20mm;padding:0px 0px 0px 0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigClsElapsYearCnt"/>
										</xsl:call-template>
									</div>
									<div class="styIRS8828LNDesc" style="width:10mm;padding:0px 0px 0px 0px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigClsElapsMnthCnt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styIRS8828LNDesc" style="width:40mm;border-top-width:1px;border-color:black;border-style:dotted;
								  padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:20mm;padding:0px 0px 0px 0px;text-align:center;">Years</div>
									<div class="styIRS8828LNDesc" style="width:20mm;padding:0px 0px 0px 0px;text-align:center;">Full months</div>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:12mm;">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">8</div>
							<div class="styIRS8828LNDesc" style="width:180.5mm;padding-left:0px;">
								<div class="styIRS8828LNDesc" style="width:180.5mm;">
									Date of full repayment of the original loan including a refinancing other than one for which a replacement mortgage credit
								</div>
								<div class="styIRS8828LNDesc" style="width:53mm;">
									certificate was issued (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:127mm;text-align:right;float:right;padding:0px 0px 0px 5px;">
									<span class="styDotLn">.............</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS8828LNDesc" style="width:70mm;padding:0px 0px 0px 0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyOrigLoanPaymentDt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="width:70mm;border-top-width:1px;border-color:black;
								  border-style:dotted;padding:0px 0px 0px 0px;">
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Month</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Day</div>
									<div class="styIRS8828LNDesc" style="width:23mm;padding:0px 0px 0px 0px;text-align:center;">Year</div>
								</div>
							</div>
						</div>								
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;height:4mm" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Computation of Recapture Tax
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm;">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:5px">9</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:100mm;padding-top:1.5mm;">
									Sales price of your interest in the home sold or disposed of (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:44mm;text-align:right;float:right;padding:5px 0px 0px 5px;">
									<!--Dotted Line-->
									<span class="styDotLn">...........</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySalesPriceIntHomeAmt"/>
								<xsl:with-param name="Number">9</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:5px">10</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:95mm;padding-top:1.5mm;">
									Expenses of sale. Include sales commissions, advertising, legal fees, etc.
								</div>
								<div class="styIRS8828LNDesc" style="width:49mm;text-align:right;float:right;padding:5px 0px 0px 9px;">
									<!--Dotted Line-->
									<span class="styDotLn">............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyExpnssFromHmSaleAmt"/>
								<xsl:with-param name="Number">10</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:5px">11</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:60mm;padding-top:1.5mm">
									Amount realized. Subtract line 10 from line 9
								</div>
								<div class="styIRS8828LNDesc" style="width:84mm;text-align:right;float:right;padding:5px 0px 0px 6px;">
									<!--Dotted Line-->
									<span class="styDotLn">.....................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdySaleOfHmRealizedAmt"/>
								<xsl:with-param name="Number">11</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:8mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">12</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:105mm;padding-top:4mm">
									Adjusted basis of your interest in the home sold or disposed of (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:39mm;text-align:right;float:right;padding:15px 0px 0px 2px;">
									<!--Dotted Line-->
									<span class="styDotLn">..........</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyAdjustedBasisInHmAmt"/>
								<xsl:with-param name="Number">12</xsl:with-param>
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:7mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">13</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:144mm;">
									Gain or (loss) from sale or disposition. Subtract line 12 from line 11. If a loss, <b>stop</b> here and<br/>
									attach this form to your Form 1040. You <b>do not</b> owe recapture tax
									<xsl:if test="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd">
										<span style="width:5px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Qualifying Subordinate Mortgage Loan Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width:5px;"/>
									<!--Dotted Line-->
									<span style="float:right;">
										<xsl:if test="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd">
											<span class="styDotLn">............</span>
										</xsl:if>
										<xsl:if test="not($Form8828Data/MortgSbsdyGainOrLossHmSaleAmt/@qlfySubordMortgageLoanCd)">
											<span class="styDotLn">.............</span>
										</xsl:if>
									</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:7mm;width:37mm;float:right;padding:0px 0px 0px 0px">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainOrLossHmSaleAmt"/>
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="Height">7mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:10px</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:10px</xsl:with-param>
									</xsl:call-template>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:8mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">14</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:40mm;padding-top:4mm">
									Multiply line 13 by 50% (.50)
								</div>
								<div class="styIRS8828LNDesc" style="width:104mm;text-align:right;float:right;padding:15px 3mm 0px 13px;">
									<!--Dotted Line-->
									<span class="styDotLn">.........................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyGainLossAdjHmSaleAmt"/>
								<xsl:with-param name="Number">14</xsl:with-param>
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:5px">15</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:3px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:70mm;">
									Modified adjusted gross income (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:74mm;text-align:right;float:right;padding:0px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">..................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyModifiedAGIAmt"/>
								<xsl:with-param name="Number">15</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:8mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">16</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:60mm;padding-top:4mm">
									Adjusted qualifying income (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:84mm;text-align:right;float:right;padding:15px 3mm 0px 8px;">
									<!--Dotted Line-->
									<span class="styDotLn">....................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyAdjustedQlfyIncmAmt"/>
								<xsl:with-param name="Number">16</xsl:with-param>
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:10mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">17</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:144mm;padding-top:4mm">
									Subtract line 16 from line 15. If zero or less, <b>stop</b> here and attach this form to your Form 1040.<br/>
									You <b>do not</b> owe recapture tax
								</div>
								<div class="styIRS8828LNDesc" style="width:100mm;text-align:right;float:right;padding:10px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">.........................</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyIncomeBasisAmt"/>
										<xsl:with-param name="Number">17</xsl:with-param>
										<xsl:with-param name="Height">8mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:10mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:2px">18</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:144mm;padding-top:.5mm">
									Income percentage. If the amount on line 17 is $5,000 or more, enter &#8220;100.&#8221; Otherwise, divide<br/>
									the amount on line 17 by $5,000 and enter the result as a percentage. Round to the nearest<br/>
									whole percentage
								</div>
								<div class="styIRS8828LNDesc" style="width:118mm;text-align:right;float:right;padding:8px 3mm 0px 8px;">
									<!--Dotted Line-->
									<span class="styDotLn">.............................</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styLNRightNumBox" style="padding:3px 0px 0px 0px;border-right-width:0px;
									  height:5mm;">18</div>
									<div class="styLNAmountBox" style="width:29mm;height:5mm;border-right-width:0px;float:right;
									  text-align:right;padding-right:2px;padding-top:6px;font-size:6pt;color:darkblue;">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyIncomePercentageRt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">19</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:2px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:65mm;">
									Federally subsidized amount (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:79mm;text-align:right;float:right;padding:2px 3mm 0px 5px;">
									<!--Dotted Line-->
									<span class="styDotLn">...................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyFederallySbsdzdAmt"/>
								<xsl:with-param name="Number">19</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:5px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:5mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;">20</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:2px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:60mm;">
									Holding period percentage (see instructions)
								</div>
								<div class="styIRS8828LNDesc" style="width:82mm;text-align:right;float:right;padding:2px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">....................</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNRightNumBox" style="padding:3px 0px 0px 0px;border-right-width:0px;
								  height:5mm;">20</div>
								<div class="styLNAmountBox" style="width:29mm;height:5mm;border-right-width:0px;
								  float:right;text-align:right;padding-right:2px;padding-top:6px;font-size:6pt;color:darkblue;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyHoldingPeriodRt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (21) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:8mm">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">21</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:60mm;padding-top:4mm;">
									Multiply line 19 by the percentage on line 20
								</div>
								<div class="styIRS8828LNDesc" style="width:84mm;text-align:right;float:right;padding:15px 3mm 0px 8px;">
									<!--Dotted Line-->
									<span class="styDotLn">....................</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyFedSbsdzdAdjAmt"/>
								<xsl:with-param name="Number">21</xsl:with-param>
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:8mm;">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">22</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:85mm;padding-top:4mm">
									Recapture amount. Multiply line 21 by the percentage on line 18
								</div>
								<div class="styIRS8828LNDesc" style="width:59mm;text-align:right;float:right;padding:15px 3mm 0px 8px;">
									<!--Dotted Line-->
									<span class="styDotLn">..............</span>
								</div>
							</div>
							<xsl:call-template name="CreateBox">
								<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyRecaptureAmt"/>
								<xsl:with-param name="Number">22</xsl:with-param>
								<xsl:with-param name="Height">8mm</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">padding-top:15px</xsl:with-param>
								<xsl:with-param name="AmountBoxStyle">padding-top:15px</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS8828LineItem" style="height:10mm;">
							<div class="styIRS8828LNLeftNumBox" style="padding-left:0px; padding-right:5px;padding-top:15px">23</div>
							<div class="styIRS8828LNDesc" style="width:144mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="width:144mm;padding-top:4mm;">
									Tax. Enter the <b>smaller</b> of line 14 or line 22. Also, include this amount on the line for total tax on<br/>
									Form 1040. For details, see the Instructions for Form 1040
								</div>
								<div class="styIRS8828LNDesc" style="width:64mm;text-align:right;float:right;padding:9px 3mm 0px 0px;">
									<!--Dotted Line-->
									<span class="styDotLn">................</span>
								</div>
							</div>
							<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;
										  padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS8828LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form8828Data/MortgSbsdyRecaptureTaxAmt"/>
										<xsl:with-param name="Number">23</xsl:with-param>
										<xsl:with-param name="Height">7mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">padding-top:13px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">padding-top:15px;border-bottom-width:0px</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:0mm;">
						<div style="float:left">
							<b>For Paperwork Reduction Act Notice, see Form 1040 instructions.</b>
						</div>
						<div style="float:right;font-size:7pt;">
							Cat. No. 13049F
							<span style="width:70px;"/>
							Form<span style="width:2px;"/><span class="styBoldText"> 8828 </span><span style="width:3px;"/>(Rev. 3-2010)
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