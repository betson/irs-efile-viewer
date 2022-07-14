<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRSRRB1042SStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRSRRB1042S"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form RRB-1042S"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRSRRB1042SStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="FormSSA1042S">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="padding-top:2mm;">
						<span style="float:left;">
							<xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>
							<span style="width:10mm;"/>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
									<xsl:with-param name="BackupName">SSA1042S/CorrectedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
									<xsl:with-param name="BackupName">SSA1042S/CorrectedInd</xsl:with-param>
								</xsl:call-template>CORRECTED</label>
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd"/>
									<xsl:with-param name="BackupName">SSA1042S/DuplicateInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd"/>
									<xsl:with-param name="BackupName">SSA1042S/DuplicateInd</xsl:with-param>
								</xsl:call-template>DUPLICATE</label>
						</span>
					</div>
					<div class="styStdDiv" style="border:1px solid black;overflow:hidden;">
						<!-- All but last column -->
						<div style="width:156mm;float:left;">
							<div style="font-family:Arial;width:90mm;float:left;padding-left:0.5mm;padding-top:0.2mm;">
								PAYER'S NAME, STREET ADDRESS, CITY, STATE AND ZIP CODE <br />
								<span style="font-family:Verdana;font-weight:bold;">UNITED STATES RAILROAD RETIREMENT BOARD</span>
							</div>
							<div style="width:20mm;float:left;font-weight:bold;">
								TAX YEAR<br />
								<span style="font-size:9pt;">2016</span>
							</div>
							<div style="width:46mm;height:7.2mm;float:left;font-weight:bold;">
								STATEMENT FOR NONRESIDENT <br />
								ALIEN RECIPIENTS OF:
							</div>
							<!-- First column -->
							<div style="width:64mm;float:left;">
								<div class="styRRB1042SLineDiv" style="height:4.2mm;font-weight:bold;border-width:0px;padding-left:0.5mm;">844 N RUSH ST CHICAGO, IL 60611-2092</div>
								<div class="styRRB1042SLineDiv" style="font-size:6pt;border-width:1px 0px 0px 0px;padding-left:0.5mm;">PAYER'S FEDERAL IDENTIFYING NO. 36-3314600</div>
								<div class="styRRB1042SLineDiv styRRB1042SDesc" style="width:100%;height:14.4mm;float:none;border-width:1px 0px 0px 0px;">
									1. Claim No. and Payee Code <br />
									<span style="font-family:Arial">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimNum"/>
										</xsl:call-template><br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PayeeCd"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styRRB1042SLineDiv styRRB1042SDesc" style="width:100%;height:7.4mm;float:none;border-width:1px 0px 0px 0px;">
									2. Recipient's Identification Number <br />
									<span style="font-family:Verdana">
										<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
									</span>
								</div>
								<div class="styRRB1042SLineDiv styRRB1042SDesc" style="width:100%;height:21mm;float:none;border-width:1px 0px 0px 0px;">
									Recipient's Name, Street Address, City, State, and Zip Code <br />
									<span style="font-family:Verdana">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template><br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template><br />
										<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template><br />
										</xsl:if>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template><br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Middle column -->
							<div style="width:92mm;float:right;">
								<!-- Line 3 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										3. Gross Social Security Equivalent Benefit Portion of Tier 1 Paid in the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossSocSecBnftTier1PaidAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 4 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										4. Social Security Equivalent Benefit Portion of Tier 1 Repaid to RRB in the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftTier1RepaidRRBAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 5 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										5. Net Social Security Eqivalent Benefit Portion of Tier 1 Paid in the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetSocSecBnftTier1PaidAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 6 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										6. Worker's Compensation Offset in the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WorkersCompensationOffsetAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 7 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										7. Social Security Equivalent Benefit Portion of Tier 1 Paid for One Year Prior to the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftTier1PaidPrYr1Amt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 8 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										8. Social Security Equivalent Benefit Portion of Tier 1 Paid for Two Years Prior to the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftTier1PaidPrYr2Amt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 9 -->
								<div class="styRRB1042SLineDiv">
									<div class="styRRB1042SDesc">
										9. Social Security Equivalent Benefit Portion of Tier 1 Paid for Three or More Years Prior to the Year Shown Above
									</div>
									<div class="styRRB1042SAmountBox">
										<br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftTier1PaidBfrPrYr2Amt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- Last column -->
						<div style="width:30.4mm;float:left;">
							<div style="width:100%;padding-top:1.5mm;padding-bottom:1.5mm;padding-left:4mm;font-weight:bold;font-family:Arial Narrow;">
								PAYMENTS BY THE <br /> RAILROAD <br /> RETIREMENT <br /> BOARD
							</div>
							<div style="width:100%;padding-top:1.5mm;padding-left:6mm;padding-bottom:2.2mm;font-family:Arial Narrow;background-color:black;color:white;">
								<span style="font-size:larger;font-weight:bold;">COPY B</span><br />
								FILE WITH <br /> RECIPIENT'S <br /> FEDERAL TAX <br /> RETURN <br /> <br />
								THIS <br /> INFORMATION <br /> IS BEING <br /> FURNISHED <br /> TO THE <br /> INTERNAL <br /> REVENUE <br /> SERVICE
							</div>
						</div>
						<!-- Bottom Line -->
						<div style="width:187mm;">
							<div style="width:64mm;float:left;">&#8194;</div>
							<div class="styRRB1042SAmountBox" style="width:31mm;border-top-width:1px;text-align:center;">
								<span style="font-family:Times New Roman;float:left;padding-left:0.8mm;">10. Country</span> <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CountryCd"/>
								</xsl:call-template>
							</div>
							<div class="styRRB1042SAmountBox" style="width:31.5mm;border-top-width:1px;">
								<span style="font-family:Times New Roman;float:left;padding-left:0.8mm;">11. Rate of Tax</span> <br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxRt"/>
								</xsl:call-template>
							</div>
							<div class="styRRB1042SAmountBox" style="width:29.3mm;border-top-width:1px;">
								<span style="font-family:Times New Roman;float:left;padding-left:0.8mm;">12. Federal Tax Withheld</span> <br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styRRB1042SAmountBox" style="width:30.5mm;border-top-width:1px;">
								<span style="font-family:Times New Roman;float:left;padding-left:0.8mm;">13. Medicare Premium Total</span> <br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalMedicarePremiumAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End page and form -->
					<div class="styStdDiv" style="font-weight:bold;"> <!-- Removed class pageEnd -->
						FORM RRB-1042S (01-98)
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
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>