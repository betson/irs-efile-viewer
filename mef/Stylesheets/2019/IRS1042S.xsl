<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
-->
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1042SStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1042S"/>
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
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1042-S"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1042SStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS1042S">
					<xsl:call-template name="DocumentHeader"/>
					<!-- <<<<<<<<<<<<<<<<<<< PJ START <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- <<<<<<<<<<<<<<<<<<< PJ START <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- <<<<<<<<<<<<<<<<<<< PJ START <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- <<<<<<<<<<<<<<<<<<< PJ START <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--Title of Form -->
					<div class="styNBB" style="width:187mm;height:16mm;">
						<div class="styFNBox" style="width:26mm;height:16mm;border-right:2px solid black;">
                         Form <span class="styFormNumber" style="font-size:16pt">1042-S</span>
							<br/>
							<span style="height:3mm; width:24mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
								</xsl:call-template>
							</span>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:131mm;float:left;height:16mm;">
							<div class="styMainTitle" style="vertical-align:top;width:112mm;padding-left:1mm;font-size:10pt;text-align:left;">
								Foreign Person’s U.S. Source Income Subject to Withholding
							</div>
							<div class="styTY" style="font-size:24pt;width:18mm;float:right;">
							20<span class="styTYColor">19</span>
							</div>
							<div style="float:left;text-align:left;padding-left:1mm;padding-top:2mm;">
								<img src="{$ImagePath}/1042S_Bullet_Md.gif" alt="MediumBullet"/>
								<b> Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1042s">
										<i>www.irs.gov/Form1042S</i>
									</a>
										for instructions and the latest information.
								</b>
							</div>
							<div class="styMainTitle" style="padding-top:1mm;width:130mm;padding-left:2mm;font-size:8pt;text-align:left;">


									<span style="float:left;padding-left:2px;padding-top:2px;border:1.5px solid black;font-size:7pt;height:4mm;width:28mm;letter-spacing: 1.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FormId"/>
										</xsl:call-template>
									</span>
								<span style="width:2mm;"/>
								UNIQUE FORM IDENTIFIER


<!--<script>
function myFunction() {

  var fruits = ["Banana", "Orange", "Apple", "Mango"];
  
//  var fruits = ["Banana", "Orange", "Apple", "Mango"];

  var x = document.getElementById("demo");
  x.innerHTML = fruits.join("|");
}
</script>
-->

<!--
								<table class="styGenericTable" cellpadding="0" cellspacing="0" style="float:left;border:1px solid black;font-size:7pt;height:4mm;width:30mm;">
									<tbody>
										<tr style="border:1px solid black;">
											<th>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,1,1)">
														<xsl:value-of select="substring($FormData/FormId,1,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,2,1)">
														<xsl:value-of select="substring($FormData/FormId,2,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,3,1)">
														<xsl:value-of select="substring($FormData/FormId,3,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,4,1)">
														<xsl:value-of select="substring($FormData/FormId,4,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,5,1)">
														<xsl:value-of select="substring($FormData/FormId,5,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,6,1)">
														<xsl:value-of select="substring($FormData/FormId,6,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,7,1)">
														<xsl:value-of select="substring($FormData/FormId,7,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,8,1)">
														<xsl:value-of select="substring($FormData/FormId,8,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,9,1)">
														<xsl:value-of select="substring($FormData/FormId,9,1)"/>
													</xsl:if>
												</td>
												<td class="styIRS1042SSubCell">
													<xsl:if test="substring($FormData/FormId,10,1)">
														<xsl:value-of select="substring($FormData/FormId,10,1)"/>
													</xsl:if>
												</td>
											</th>
										</tr>
									</tbody>
								</table>
								<span style="width:1mm;"/>
								UNIQUE FORM IDENTIFIER
-->
								<span style="width:4mm;"/>
								<input alt="Amended indicator" type="checkbox" class="styCkbox" name="AmendedInd" style="height:3.5mm;width:3.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedInd"/>
										<xsl:with-param name="BackupName">Amended indicator</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedInd"/>
										<xsl:with-param name="BackupName">Amended indicator</xsl:with-param>
									</xsl:call-template>
								</label>
								AMENDED 
								<span style="width:4mm;"/>
								<span class="styIRS1042STableCellContent" style="float:none;width:4mm;height:4mm;border-width:1px 1px 1px 1px;">
									<span style="float:right;padding-right:1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AmendmentNum"/>
										</xsl:call-template>
									</span>
								</span>

								AMENDMENT NO.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left:2px solid black;height:16mm;">
							<div class="styOMB" style="height:5mm;padding-left:1mm;padding-top:1mm;">OMB No. 1545-0096</div>
							<div class="styTYBox" style="height:9mm;border:none;">
								<span class="styFormNumber" style="font-size:12pt; padding-left:3mm;padding-top:2mm;">Copy B</span>
								<span style="padding-left:4mm;font-size:8pt;">for Recipient</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<table class="styGenericTable" style="width:187mm;" cellpadding="0" cellspacing="0">
						<thead/>
						<tfoot/>
						<tbody>
							<tr>
								<!-- Left sub table start-->
								<td style="width:93mm;border:1px solid black;border-right:0;">
									<table style="float-left;" cellpadding="0" cellspacing="0">
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;vertical-align:top;">
												<span class="styIRS1042STableCellContent" style="width:13mm;height:12mm;border-width:1px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber">1</span>
											Income code<br/>
													<span style="padding-left:2mm;padding-top:2mm;font-size:8pt;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IncomeTypeCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:22mm;height:12mm;border-width:1px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber" style="height:8mm;">2</span>
											Gross income
														<span style="width:22mm;text-align:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeAmt"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="padding-top:0;width:58mm;height:4mm;border-width:1px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber" style="padding-top:1mm;">3 
														<span style="font-weight:normal;"> Chapter indicator.  Enter "3" or "4"</span>
													</span>
													<span style="float:right;padding-top:1mm;padding-right:10mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ChapterTypeCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCell" style="width:30mm;height:8mm;border-bottom:0;">
													<span class="styIRS1042STableCellContent" style="width:30mm;height:4mm;border-width:1px 0px 0px 1px;">
														<span class="styIRS1042SBoxNumber">3a</span>
											Exemption code
														<span style="float:right;padding-right:2px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/Chapter3Grp/ExemptionCd"/>
															</xsl:call-template>
														</span>
													</span>
													<span class="styIRS1042STableCellContent" style="width:20mm;height:4mm;border-width:1px 0px 0px 1px;">
														<span class="styIRS1042SBoxNumber">3b</span>
											Tax rate
													</span>
													<span class="styIRS1042STableCellContent" style="width:10mm;height:4mm;border-width:1px 0px 0px 0px;">
														<span style="float:right;padding-right:2px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/Chapter3Grp/TaxRt"/>
															</xsl:call-template>
														</span>
													</span>
												</span>
												<span class="styIRS1042STableCell" style="width:28mm;height:8mm;border-bottom:0;">
													<span class="styIRS1042STableCellContent" style="width:28mm;height:4mm;border-width:1px 1px 0px 1px;">
														<span class="styIRS1042SBoxNumber">4a</span>
											Exemption code
														<span style="float:right;padding-right:2px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/Chapter4Grp/ExemptionCd"/>
															</xsl:call-template>
														</span>
													</span>
													<span class="styIRS1042STableCellContent" style="width:18mm;height:4mm;border-width:1px 0px 0px 1px;">
														<span class="styIRS1042SBoxNumber">4b</span>
											Tax rate
													</span>
													<span class="styIRS1042STableCellContent" style="width:10mm;height:4mm;border-width:1px 1px 0px 0px;">
														<span style="float:right;padding-right:2px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/Chapter4Grp/TaxRt"/>
															</xsl:call-template>
														</span>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:4mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">5</span>
										Withholding allowance
														<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAllowancesAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:4mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">6</span>
										Net income
														<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NetIncomeAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:4mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">7a</span>
										Federal tax withheld
														<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6.5mm;border-width:0px 1px 0px 1px;">
													<span style="float-left;width:86mm;padding:0mm 0mm 0mm 0.5mm;">
														<span class="styIRS1042SBoxNumber">7b</span>
										Check if federal tax withheld was not deposited with the IRS because 
										<span style="float:left;padding-left:4mm;">escrow procedures were applied (see instructions)</span>
											<span class="styBoldText" style="float:right;padding-right:2mm;">
															<span class="styDotLn">.....</span>
														</span>
													</span>
													<div style="float-right;width:5mm;">
														<span style="padding-top:1mm;">
															<input alt="Tax not deposit per escrow procedure indicator" type="checkbox" class="styCkbox" name="TaxNotDepositPerEscrowProcInd">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/TaxNotDepositPerEscrowProcInd"/>
																	<xsl:with-param name="BackupName">Tax not deposit per escrow procedure indicator</xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="$FormData/TaxNotDepositPerEscrowProcInd"/>
																	<xsl:with-param name="BackupName">Tax not deposit per escrow procedure indicator</xsl:with-param>
																</xsl:call-template>
															</label>
														</span>
													</div>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6.5mm;border-width:0px 1px 0px 1px;">
													<span style="float-left;width:86mm;padding:0mm 0mm 0mm 0.5mm;">
														<span class="styIRS1042SBoxNumber">7c</span>
										Check if withholding occurred in subsequent year with respect to a
										<span style="float:left;padding-left:4mm;">partnership interest.</span>
											<span class="styBoldText" style="float:right;padding-right:2mm;">
															<span class="styDotLn">..............</span>
														</span>
													</span>
													<div style="float-right;width:5mm;">
														<span style="padding-top:1mm;">
															<input alt="Subsequent year withholding partnership interest indicator" type="checkbox" class="styCkbox" name="SubsqYrWithholdingPrtshpIntInd">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/SubsqYrWithholdingPrtshpIntInd"/>
																	<xsl:with-param name="BackupName">Subsequent year withholding partnership interest indicator</xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="$FormData/SubsqYrWithholdingPrtshpIntInd"/>
																	<xsl:with-param name="BackupName">Subsequent year withholding partnership interest indicator</xsl:with-param>
																</xsl:call-template>
															</label>
														</span>
													</div>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:4mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">8</span>
										Tax withheld by other agents
														<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/OtherAgentsTaxWithheldAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6.5mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">9</span>
										Overwithheld tax repaid to recipient pursuant to adjustment procedures (see instructions)
														<span style="float:right;padding-right:2px;">(
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientRepaidAmt"/>
														</xsl:call-template> )
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">10</span>
										Total withholding credit (combine boxes 7a, 8, and 9)
														<span style="float:right;padding-right:2px;padding-top:3mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalTaxWithholdingCreditAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">11</span>
										Tax paid by withholding agent (amounts not withheld) (see instructions)
														<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentTaxPaidAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:41mm;height:6mm;border-width:0px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12a</span>
											Withholding agent’s EIN
												<span style="padding-left:8mm;">
														<xsl:choose>
															<xsl:when test="$FormData/WithholdingAgentGrp/TIN">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/TIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/EIN"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:26mm;height:6mm;border-width:0px 0px 0px 1px;">
												
<!--         height:100%; float:left; text-align-left; font-size:7pt; font-weight:bold; padding: 0mm 0.5mm 0mm 0.5mm; -->
<!--													<span class="styIRS1042SBoxNumber"></span>
-->
											<b>&nbsp;12b&#32;</b> Ch. 3 status code
														<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/Chapter3StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:26mm;height:6mm;border-width:0px 1px 0px 1px;">
<!--													<span class="styIRS1042SBoxNumber">12c</span>
-->
											<b>&nbsp;12c&#32;</b> Ch. 4 status code
														<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/Chapter4StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:9mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12d</span>
										Withholding agent's name <br/>
													<span style="font-size:90%;">
														<xsl:choose>
															<xsl:when test="$FormData/WithholdingAgentGrp/PersonNm">
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/PersonNm"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="$FormData/WithholdingAgentGrp/BusinessName/BusinessNameLine2Txt">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/BusinessName/BusinessNameLine1Txt"/>
																		</xsl:call-template>
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/BusinessName/BusinessNameLine2Txt"/>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/BusinessName/BusinessNameLine1Txt"/>
																		</xsl:call-template>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:6.5mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12e</span>
										Withholding agent's Global Intermediary Identification Number (GIIN)<br/>
													<span style="padding-left:26mm;;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/GIIN"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:24mm;height:6mm;border-width:0px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12f</span>
											Country code<br/>
													<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/CountryCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:69mm;height:6mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber" style="height:3mm;">12g</span>
											Foreign taxpayer identification number, if any<br/>
													<span style="font-size:90%;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/FTIN"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:9mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12h</span>
										Address (number and street)<br/>
													<xsl:choose>
														<xsl:when test="$FormData/WithholdingAgentGrp/USAddress">
															<xsl:choose>
																<xsl:when test="$FormData/WithholdingAgentGrp/USAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/USAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/WithholdingAgentGrp/ForeignAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:9mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">12i</span>
										City or town, state or province, country, ZIP or foreign postal code<br/>
													<xsl:choose>
														<xsl:when test="$FormData/WithholdingAgentGrp/USAddress">
															<br/>
															<xsl:call-template name="PopulateCityStateInfo">
																<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/USAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="$FormData/WithholdingAgentGrp/ForeignAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/CityNm"/>
															</xsl:call-template>, 
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>, 
																	<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>, 
																	<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentGrp/ForeignAddress/CountryCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:62mm;font-size:90%;height:13mm;border-width:0px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber">13a</span>
											Recipient's name<br/>
													<xsl:choose>
														<xsl:when test="$FormData/RecipientGrp/PersonNm">
															<br/>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/RecipientGrp/BusinessName/BusinessNameLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span class="styIRS1042STableCellContent" style="width:31mm;height:13mm;font-size:90%;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">13b</span>
											Recipient's country code<br/>
													<span style="padding-left:8mm;padding-top:7mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/CountryCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:9mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">13c</span>
										Address (number and street)<br/>
													<xsl:choose>
														<xsl:when test="$FormData/RecipientGrp/USAddress">
															<xsl:choose>
																<xsl:when test="$FormData/RecipientGrp/USAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/USAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/RecipientGrp/ForeignAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:93mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:93mm;height:9mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">13d</span>
										City or town, state or province, country, ZIP or foreign postal code<br/>
													<xsl:choose>
														<xsl:when test="$FormData/RecipientGrp/USAddress">
															<br/>
															<xsl:call-template name="PopulateCityStateInfo">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/USAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="$FormData/RecipientGrp/ForeignAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/CityNm"/>
															</xsl:call-template>, 
																<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>, 
																	<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>, 
																	<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/ForeignAddress/CountryCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</td>
										</tr>
									</table>
								</td>
								<!-- Left sub table end-->
								<!-- Right sub table start-->
								<td style="width:94mm;border:1px solid black;border-left:0;vertical-align:top;">
									<table style="float-right;" cellpadding="0" cellspacing="0">
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:49mm;height:8mm;border-width:1px 0px 0px 0px;">
													<span class="styIRS1042SBoxNumber">13e</span>
										Recipient's U.S. TIN, if any <br/>
													<span style="padding-top:2mm;">
														<xsl:choose>
															<xsl:when test="$FormData/RecipientGrp/TIN">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/TIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/EIN"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:45mm;padding-top:1mm;height:4mm;border-width:1px 1px 1px 1px;">
<!--													<span class="styIRS1042SBoxNumber">13f</span>
-->
											<b>&nbsp;13f&#32;</b> Ch. 3 status code
														<span style="padding-left:7mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/Chapter3StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:45mm;padding-top:1mm;height:4mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">13g</span>
											Ch. 4 status code
														<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/Chapter4StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:33mm;height:12mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber" style="height:3mm;">13h</span>
											Recipient's GIIN<br/>
													<br/>
													<span style="padding-left:2mm;padding-top:3mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/GIIN"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:44mm;height:12mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber" style="height:3mm;">13i</span>
											Recipient's foreign tax identification number, if any<br/>
													<span style="padding-left:4mm;padding-top:3mm;">
														<xsl:value-of select="substring($FormData/RecipientGrp/FTIN,1,19)"/>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:17mm;height:12mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber" style="height:3mm;">13j</span>
											LOB Code<br/>
													<br/>
													<span style="padding-left:7mm;padding-top:3mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/LOBCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">13k</span>
										Recipient's account number  <br/>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/AccountNum"/>
															</xsl:call-template>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">13l</span>
											Recipient's date of birth 
  <span style="width:18mm;">
  <span style="float:left;"> (YYYY</span>
  <span style="float:left;">MM</span>
  <span style="float:left;">DD) </span>
</span><br/>
								<span style="padding-left:8mm;">
									<span style="float:left;border:1px solid black;font-size:8pt;height:5mm;width:40mm;letter-spacing: 3mm;padding-top:1mm;padding-left:1mm;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BirthDt"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BirthDt"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/RecipientGrp/BirthDt"/>
										</xsl:call-template>
									</span>
</span>



<!--
													<table class="styGenericTable" cellpadding="0" cellspacing="0" style="float:left;border:1px solid black;font-size:8pt;height:5mm;width:40mm;letter-spacing: 1.5mm;">
														<tbody>
															<tr style="border:1px solid black;">
																<th>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,1,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,1,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,2,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,2,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,3,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,3,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,4,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,4,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,6,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,6,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,7,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,7,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,9,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,9,1)"/>
																		</xsl:if>
																	</td>
																	<td class="styIRS1042SSubCell" style="width:5mm;">
																		<xsl:if test="substring($FormData/RecipientGrp/BirthDt,10,1)">
																			<xsl:value-of select="substring($FormData/RecipientGrp/BirthDt,10,1)"/>
																		</xsl:if>
																	</td>
																</th>
															</tr>
														</tbody>
													</table>

-->
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">14a</span>
										Primary Withholding Agent's Name (if applicable)  <br/>
													<span style="font-size:90%;">
													<xsl:choose>
														<xsl:when test="$FormData/PrimaryWithholdingAgentGrp/PersonNm">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/PrimaryWithholdingAgentGrp/BusinessName/BusinessNameLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:42mm;height:7mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">14b</span>
										Primary Withholding Agent's EIN<br/>
													<span style="padding-left:8mm;">
														<xsl:choose>
															<xsl:when test="$FormData/PrimaryWithholdingAgentGrp/TIN">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/TIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="$FormData/PrimaryWithholdingAgentGrp/EIN"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:52mm;height:7mm;border-width:0px 1px 0px 0px;">
													<span style="padding-top:1mm;">
														<span class="styIRS1042SBoxNumber">15</span>
										Check if pro-rata basis reporting
</span>
													<span style="float:right;padding-right:3mm;">
														<input alt="Pro rata basis indicator" type="checkbox" class="styCkbox" name="ProRataBasisInd">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/ProRataBasisInd"/>
																<xsl:with-param name="BackupName">Pro rata basis indicator</xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/ProRataBasisInd"/>
																<xsl:with-param name="BackupName">Pro rata basis indicator</xsl:with-param>
															</xsl:call-template>
														</label>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:43mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15a</span>
											Intermediary or flow-through entity's EIN, if any<br/>
													<span style="padding-left:10mm;">
														<xsl:choose>
															<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/TIN">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/TIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/EIN"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:26mm;height:9mm;border-width:0px 1px 0px 0px;">
<!--													<span class="styIRS1042SBoxNumber">15b</span>
-->
											<b>&nbsp;15b&#32;</b>Ch. 3 status code<br/>
													<br/>
													<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/Chapter3StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:25mm;height:9mm;border-width:0px 1px 0px 0px;">
<!--													<span class="styIRS1042SBoxNumber">15c</span>
-->
											<b>&nbsp;15c&#32;</b>Ch. 4 status code<br/>
													<br/>
													<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/Chapter4StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:8.5mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15d</span>
										Intermediary or flow-through entity's name <br/>
													<span style="font-size:90%;">
														<xsl:choose>
															<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/PersonNm">
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/PersonNm"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/BusinessName/BusinessNameLine2Txt">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/BusinessName/BusinessNameLine1Txt"/>
																		</xsl:call-template>
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/BusinessName/BusinessNameLine2Txt"/>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/BusinessName/BusinessNameLine1Txt"/>
																		</xsl:call-template>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:5mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15e</span>
										Intermediary or flow-through entity's GIIN
													<span style="padding-left:8mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/GIIN"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:25mm;height:6mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15f</span>
											Country code<br/>
													<span style="padding-left:5mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/CountryCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:69mm;height:6mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber" style="height:3mm;">15g</span>
											Foreign tax identification number, if any<br/>
													<span style="font-size:90%">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/FTIN"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15h</span>
										Address (number and street)<br/>
													<xsl:choose>
														<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/USAddress">
															<xsl:choose>
																<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/USAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/USAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/USAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/AddressLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/AddressLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:9mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">15i</span>
										City or town, state or province, country, ZIP or foreign postal code<br/>
													<xsl:choose>
														<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/USAddress">
															<br/>
															<xsl:call-template name="PopulateCityStateInfo">
																<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/USAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/CityNm"/>
															</xsl:call-template>, 
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>, 
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>, 
																	<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/IntermediaryOrFlowThruEntGrp/ForeignAddress/CountryCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:64mm;font-size:90%;height:13mm;border-width:0px 0px 0px 0px;">
													<span class="styIRS1042SBoxNumber">16a</span>
											Payer's name<br/>
													<xsl:choose>
														<xsl:when test="$FormData/PayerGrp/PersonNm">
															<br/>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="$FormData/PayerGrp/BusinessName/BusinessNameLine2Txt">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<br/>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<span class="styIRS1042STableCellContent" style="width:30mm;height:13mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">16b</span>
											Payer's TIN<br/>
													<br/>
													<br/>
													<xsl:choose>
														<xsl:when test="$FormData/PayerGrp/TIN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/TIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/EIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:44mm;height:6mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">16c</span>
											Payer's GIIN<br/>
													<span style="font-size:90%;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/GIIN"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:25mm;height:6mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">16d</span>
											Ch. 3 status code<br/>
													<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/Chapter3StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:25mm;height:6mm;border-width:0px 1px 0px 0px;">
													<span class="styIRS1042SBoxNumber">16e</span>
											Ch. 4 status code<br/>
													<span style="padding-left:6mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/PayerGrp/Chapter4StatusCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;">
												<span class="styIRS1042STableCellContent" style="width:36mm;height:7mm;border-width:0px 0px 0px 0px;">
													<span class="styIRS1042SBoxNumber">17a</span>
											State income tax withheld<br/>
													<span style="float:right;padding-right:2px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/StateTaxWithheldAmt"/>
														</xsl:call-template>
													</span>
												</span>
												<span class="styIRS1042STableCellContent" style="width:36mm;height:7mm;border-width:0px 0px 0px 1px;">
													<span class="styIRS1042SBoxNumber">17b</span>
											Payer’s state tax no.<br/>
<!--													<span style="">
-->														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/PayerStateIdNum"/>
														</xsl:call-template>
<!--													</span>
-->												</span>
												<span class="styIRS1042STableCellContent" style="width:22mm;height:7mm;border-width:0px 1px 0px 1px;">
													<span class="styIRS1042SBoxNumber">17c</span>
											Name of state<br/>
													<span style="padding-left:5mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/StateCd"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td class="styIRS1042STableCell" style="width:94mm;float:left;background-color:lightgrey;">
												<span class="styIRS1042STableCellContent" style="width:94mm;height:10.2mm;border-width:0px 1px 0px 0px;">
												</span>
											</td>
										</tr>
									</table>
									<!-- Right sub table end-->
								</td>
							</tr>
						</tbody>
					</table>
					<div class="styFormFooter" style="width:187mm;border-top-width: 1px;">
						<span style="width:98mm;font-weight:bold;" class="styGenericDiv">
						For Privacy Act and Paperwork Reduction Act Notice, see instructions.
			  </span>
						<span style="width:58mm;font-weight:normal;text-align:center;" class="styGenericDiv">
							Cat. No. 11386R
						</span>
						<span style="float:right;" class="styGenericDiv">Form <span class="styBoldText">1042-S</span> (2019)</span>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<< PJ END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- <<<<<<<<<<<<<<<<<<< PJ END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--					<p style="page-break-before:always"/>
-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:10mm;">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
