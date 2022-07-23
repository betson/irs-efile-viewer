<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRSSSA1042SStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRSSSA1042S"/>
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
				<meta name="Description" content="IRS Form SSA-1042S"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRSSSA1042SStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" >
				<form id="FormSSA1042S">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="font-weight:bold;text-align:center;font-size:10pt;padding-top:2mm;padding-bottom:1mm;width:187mm;" align="center">
						<span>
							<xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="Desc">Top Left Margin - Corrected Indicator</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd"/>
								<xsl:with-param name="Desc">Top Left Margin - Duplicate Indicator</xsl:with-param>
							</xsl:call-template>
						</span>
						FORM SSA-1042S &#8211; SOCIAL SECURITY BENEFIT STATEMENT
					</div>
					<div class="styStdDiv" style="border:1px solid black;padding-left:0.5mm;width:187mm;">
						<div style="font-size:20pt;font-weight:bold;width:22mm;float:left;">2018</div>
						<div style="font-size:8pt;padding-top:1mm;">
							&#8226; THIS FORM IS FOR USE IN FILING A UNITED STATES FEDERAL INCOME TAX RETURN. <br />
							&#8226; DO NOT RETURN IT TO SOCIAL SECURITY. &#8226; READ THE INFORMATION ON THE REVERSE.
						</div>
					</div>
					<!-- Boxes 1 and 2 -->
					<div class="styStdDiv" style="border-style:solid;border-color:black;border-width:0px 1px 1px 1px;">
						<div style="width:124mm;float:left;border-right:1px solid black;padding-left:0.5mm;height:9mm;">
							Box 1. Name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
							</xsl:call-template>		
						</div>
						<div style="width:62mm;float:left;padding-left:0.5mm;">
							Box 2. Beneficiary's Social Security Number <br />
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>								
						</div>
					</div>
					<!-- Boxes 3 to 5 -->
					<div class="styStdDiv" style="border-style:solid;border-color:black;border-width:0px 1px 1px 1px;">
						<div style="width:62mm;float:left;border-right:1px solid black;padding-left:0.5mm;height:9mm;">
							Box 3. Benefits Paid in 2018
							<br />
							<span style="float:right;padding-right:0.5mm;padding-top:2.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:62mm;float:left;border-right:1px solid black;padding-left:0.5mm;height:9mm;">
							Box 4. Benefits Repaid to SSA in 2018
							<br />
							<span style="float:right;padding-right:0.5mm;padding-top:2.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftRepaidSSAAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:62.4mm;float:left;padding-left:0.5mm;border:1px solid black;height:9mm;">
							Box 5. Net Benefits for 2018 <span style="font-style:italic;font-size:6pt;">(Box 3 minus Box 4)</span>
							<br />
							<span style="float:right;padding-right:0.5mm;padding-top:2.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetSocSecBnftAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv">
						<!-- Left side -->
						<div style="width:93mm;border-left:1px solid black;float:left;">
							<!-- Box 3 description -->
							<div style="width:100%;text-align:center;font-weight:bold;">DESCRIPTION OF AMOUNT IN BOX 3</div>
							<div style="width:100%;height:67mm;padding:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftDesc"/>
								</xsl:call-template>
							</div>
							<!-- Box 6 -->
							<div class="stySSA1042SBoxCell">
								Box 6. Rate of Tax <br />
								<span style="float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxRt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Box 7 -->
							<div class="stySSA1042SBoxCell">
								Box 7. Amount of Tax Withheld <br />
								<span style="float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Box 8 -->
							<div class="stySSA1042SBoxCell">
								Box 8. Amount of Tax Refunded <br />
								<span style="float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Box 9 -->
							<div class="stySSA1042SBoxCell" style="border-bottom:1px solid black;">
								Box 9. Net Tax Withheld During 2018 <span style="font-style:italic;display:inline;">(Box 7 minus Box 8)</span> <br />
								<span style="float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Right side -->
						<div style="width:94mm;border-left:1px solid black;border-right:1px solid black;float:left;">
							<!-- Box 4 description -->
							<div style="width:100%;text-align:center;font-weight:bold;">DESCRIPTION OF AMOUNT IN BOX 4</div>
							<div style="width:100%;height:56mm;padding:1mm;border-bottom:1px sold black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftRepaidSSADesc"/>
								</xsl:call-template>
							</div>
							<!-- Box 10 -->
							<div class="stySSA1042SBoxCell" style="height:25mm;">
								Box 10. Address 
								    <!--USAAddress-->
									<xsl:if test="$FormData/USAddress !=''">
									    <br />	
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/USAddress"/>
										</xsl:call-template>  
									</xsl:if>
									<!--ForiegnAddress-->
									<xsl:if test="$FormData/ForeignAddress !=''">	
									    <br />
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress"/>
										</xsl:call-template>
									</xsl:if>
							</div>
							<!-- Box 11 -->
							<div class="stySSA1042SBoxCell" style="height:14mm;border-bottom:1px solid black;">
								Box 11. Claim Number <span style="font-style:italic;display:inline;">(Use this number if you need to contact SSA.)</span> <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ClaimNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End page and form -->
					<div class="styStdDiv"> <!-- Removed class pageEnd -->
						Form <strong>SSA-1042S-SM </strong> (1-2018)
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
						<xsl:if test="$FormData/CorrectedInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CorrectedInd</xsl:with-param>
									</xsl:call-template>Top Left Margin - Corrected Indicator</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/CorrectedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$FormData/DuplicateInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/DuplicateInd</xsl:with-param>
									</xsl:call-template>Top Left Margin - Duplicate Indicator</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DuplicateInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/DuplicateInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>