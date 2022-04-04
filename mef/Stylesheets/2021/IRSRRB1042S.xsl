<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 04/27/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRSRRB1042SStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRSRRB1042S" />
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
				<meta name="Description" content="IRS Form RRB-1042S" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"
					type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRSRRB1042SStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="FormSSA1042S">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding-top:2mm;">
						<span style="float:left;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
						</span>
					</div>
					<div class="styStdDiv" style="border:1px solid black;overflow:hidden;">
						<div style="width:187mm;float:left;">
							<!-- Header Block -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="font-family:Arial;width:80.7mm;border-width:0px 0px 0px 0px;height:18mm;">
								Payer’s Name, Street Address, City, State, and ZIP Code
								<br />
								<span
									style="padding-top:1mm;font-family:Arial;font-weight:bold;font-size:9pt;">
									United States Railroad Retirement Board
									<br />
								</span>
								<span
									style="padding-top:1mm;font-family:Arial;font-weight:bold;font-size:9pt;">
									844 N Rush St Chicago IL 60611-1275
									<br />
								</span>
								<span style="padding-top:1mm;font-family:Arial;">Payer’s Federal Identifying No. 36-3314600</span>
							</div>
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="font-family:Arial;width:51.3mm;border-width:0px 1px 0px 0px;height:18mm;">
								<span style="font-weight:bold;font-size:15pt;padding-left:15mm;">2021</span>
								<br />
								<span style="padding-top:1mm;">Statement for Nonresident Alien</span>
								<br />
								<span style="padding-top:1mm;">Recipients of Payments by the</span>
								<br />
								<span style="padding-top:1mm;">Railroad Retirement Board</span>
							</div>
							<div
								style="width:55mm;height:18mm;font-weight:bold;border-width:0px 0px 0px 0px;text-align:center;background-color:lightgray">
								<span style="font-weight:bold;font-size:11pt;padding-left:5mm;">Copy C </span>
								- File with
								<br />
								<span style="padding-top:1mm;">Recipient’s Federal Tax Return</span>
								<br />
								<span style="padding-top:1mm;">This information is being furnished</span>
								<br />
								<span style="padding-top:1mm;">to the Internal Revenue Service</span>
							</div>
							<!-- End of Header Block -->
							<!-- Unique Form Identifier -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:46mm;height:12.5mm;border-width:1px 1px 1px 0px;">
								<span>Unique Form Identifier</span>
								<br />
								<span style="padding-left:0mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FormId" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Unique Form Identifier -->
							<!-- Amendment Number Box  -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:35mm;height:12.5mm;border-width:1px 1px 1px 0px;">
								<span>
									<span style="width:.5mm" />
								</span>
								<span>Amendment Number</span>
								<br />
								<span style="padding-left:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AmendmentNum" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Amendment Number Boxr -->
							<!-- Box 6 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:51mm;height:12.5mm;border-width:1px 1px 1px 0px;">
								<span>
									6.
									<span style="width:.5mm" />
								</span>
								<span>Claim Number and Payee Code</span>
								<br />
								<span
									style="padding-top:1mm;padding-left:.5mm;width:50mm;font-size:6.0pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ClaimNum" />
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PayeeCd" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 6 -->
							<!-- Box 7 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:55mm;height:12.5mm;border-width:1px 1px 1px 0px;">
								<span style="width:1.5mm" />
								<span>
									7.
									<span style="width:.5mm" />
								</span>
								<span>Recipient’s U.S. Taxpayer Identification</span>
								<br />
								<span style="padding-left:4mm;"> Number</span>
								<br />
								<span style="padding-top:1mm;float:bottom;padding-left:4mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 7 -->
							<!-- Box Recipient’s Name, Street Address, City, State, and ZIP code -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:81mm;height:37.5mm;float:none;border-width:0px 1px 1px 0px;float:left;">
								Recipient’s Name, Street Address, City, State, and ZIP code
								<br />
								<span style="font-family:Arial;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonNm" />
									</xsl:call-template>
									<br />
									<xsl:choose>
										<xsl:when test="$FormData/USAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/USAddress" />
											</xsl:call-template>
											<br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode"
													select="$FormData/ForeignAddress" />
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<!-- closes Box Recipient’s Name, Street Address, City, State, and 
								ZIP code -->
							<!-- Boxes 8 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:51mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:.3mm" />
								<span>
									8.
									<span style="width:.5mm" />
								</span>
								<span>Recipient’s Chapter 3 Status Code</span>
								<br />
								<span style="width:48mm;padding-top:1mm;padding-left:3mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"
											select="$FormData/RecipientChapter3StatusCd" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Box 9 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:55mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:1.5mm" />
								<span>
									9.
									<span style="width:.5mm" />
								</span>
									<span>Recipient’s Date of Birth</span>
								
								<br />
								<span style="padding-top:1mm;padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BirthDt" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 9 -->
							<!-- Box 10 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:51mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:.3mm" />
								<span>
									10.
									<span style="width:.5mm" />
								</span>
								<span>Gross Benefit Paid in 2021</span>
								<br />
								<span style="padding-left:4.5mm;"></span>
								<br />
								<span style="width:48mm;padding-top:3.5mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
											select="$FormData/GrossBenefitPaidAmt " />
									</xsl:call-template>
								</span>								
							</div>
							<!-- Closes Box 10 -->
							<!-- Box 11 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:55mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:1.5mm" />
								<span>
									11.
									<span style="width:.5mm" />
								</span>
								<span>Benefit Repaid to RRB in 2021</span>
								<br />
								<br />
								<span style="width:51mm;padding-top:3.5mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
											select="$FormData/BenefitRepaidRRBAmt" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 11 -->
							<!-- Box 12 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:51mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:.3mm" />
								<span>
									12.
									<span style="width:.5mm" />
								</span>
								<span>Net Benefit Paid in 2021</span>
								<br />
								<br />
								<span style="width:48mm;padding-top:3.5mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
											select="$FormData/NetBenefitPaidAmount" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 12 -->
							<!-- Box 13 -->
							<div class="styRRB1042SLineDiv styRRB1042SDesc"
								style="width:55mm;height:12.5mm;border-width:0px 1px 1px 0px;">
								<span style="width:1.5mm" />
								<span>
									13.
									<span style="width:.5mm" />
								</span>
								<span>Federal Tax Withheld</span>
								<br />
								<span style="width:51mm;padding-top:6.5mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
											select="$FormData/FederalIncomeTaxWithheldAmt" />
									</xsl:call-template>
								</span>
							</div>
							<!-- Closes Box 13 -->
							<!-- Boxes 1,2,3,14 and 15 -->
							<div style="width:187mm;height:12.5mm;float:left;">
								<!-- Box 2 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:27mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										1.
										<span style="width:.5mm" />
									</span>
									<span>Income Code</span>
									<br />
									<span style="width:25mm;padding-top:3.7mm;padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeTypeCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 1 -->
								<!-- Box 2 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:27mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										2.
										<span style="width:.5mm" />
									</span>
									<span>Chapter Indicator</span>
									<br />
									<span style="width:25mm;padding-top:3.7mm;padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ChapterTypeCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 2 -->
								<!-- Box 3 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:27mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										3.
										<span style="width:.5mm" />
									</span>
									<span>Chapter 3 Status Code</span>
									<br /><br/>
									<span style="width:25mm;padding-top:1mm;padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
												select="$FormData/Chapter3StatusCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Box 14 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:51mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:.3mm" />
									<span>
										14.
										<span style="width:.5mm" />
									</span>
									<span>Country</span>
									<br />
									<span style="width:51mm;padding-top:3.7mm;padding-left:4.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/CountryCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 14 -->
								<!-- Box 15 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:55mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										15.
										<span style="width:.5mm" />
									</span>
									<span>Tax Rate</span>
									<br />
									<span style="width:55mm;padding-top:3.7mm;padding-left:6mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TaxRt" />
										</xsl:call-template>
									</span>
								</div>
							<!-- Closes Box 15 -->
							</div>
							<!-- Closes Boxes 1, 2,3,14 and 15 -->
							<!-- Boxes 4,5,16 and 17 -->
							<div style="width:187mm;height:12.5mm;float:left;">
								<!-- Box 4 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:40.5mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										4.
										<span style="width:.5mm" />
									</span>
									<span>Chapter 4 Status Code</span>
									<br />
									<br />
									<span style="width:40mm;padding-top:1mm;padding-left:4.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
												select="$FormData/Chapter4StatusCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 4 -->
								<!-- Box 5 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:40.5mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										5.
										<span style="width:.5mm" />
									</span>
									<span>Employee Contributions</span>
									<br />
									<br />
									<span style="width:40mm;padding-top:1mm;padding-right:2mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
												select="$FormData/EmployeeContributionsAmt" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 5 -->
								<!-- Box 16 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:51mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:.3mm" />
									<span>
										16.
										<span style="width:.5mm" />
									</span>
									<span>Exemption Code</span>
									<br />
									<span style="width:51mm;padding-top:3.5mm;padding-left:4.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
												select="$FormData/ExemptionCd" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 16 -->
								<!-- Box 17 -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:55mm;height:12.5mm;border-width:0px 1px 1px 0px;">
									<span style="width:1.5mm" />
									<span>
										17.
										<span style="width:.5mm" />
									</span>
									<span>Medicare Premium Total</span>
									<br />
									<span style="width:55mm;padding-top:6mm;padding-right:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
												select="$FormData/TotalMedicarePremiumAmt" />
										</xsl:call-template>
									</span>
								</div>
								<!-- Closes Box 17 -->
							</div>
							<!-- Closes Boxes 4, 5, 16 and 17 -->
							<!-- Shaded area -->
							<div style="width:187mm;height:12.5mm;float:left;">
								<!-- Shaded area -->
								<div class="styRRB1042SLineDiv styRRB1042SDesc"
									style="width:187mm;height:12.5mm;text-align:center;padding-top:4mm;border-width:0px 1px 0px 0px;background-color:lightgray;">
									<span style="font-weight:bold;font-size:11pt;">FORM RRB-1042S (01-21)</span>
								</div>
								</div>
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1"
								value="Return to Form" onclick="javascript:returnToWriteInImage();" />
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData" />
							<xsl:with-param name="DescWidth" select="100" />
						</xsl:call-template>
						<xsl:if test="$FormData/CorrectedInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;"
									scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd" />
											<xsl:with-param name="BackupName">
												$FormData/CorrectedInd
											</xsl:with-param>
										</xsl:call-template>
										Top Left Corner – Corrected Indicator
									</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd" />
											<xsl:with-param name="BackupName">
												$FormData/CorrectedInd
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
							<xsl:if test="$FormData/DuplicateInd">
								<tr>
									<td class="styLeftOverTableRowDesc" style="width:100mm;"
										scope="row">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode"
													select="$FormData/DuplicateIndd" />
												<xsl:with-param name="BackupName">
													$FormData/DuplicateInd
												</xsl:with-param>
											</xsl:call-template>
											Top Left Corner – Duplicate Indicator
										</label>
									</td>
									<td class="styLeftOverTableRowAmount" style="width:87mm;">
										<input type="checkbox" class="styCkboxNM">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd" />
												<xsl:with-param name="BackupName">
													$FormData/DuplicateInd
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>