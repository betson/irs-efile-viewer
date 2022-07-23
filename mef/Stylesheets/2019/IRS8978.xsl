<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8978Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8978" />
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
				<meta name="Description" content="IRS Form 8995" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8978Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8978">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8978</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="" style="font-family:Arial;padding-bottom:1mm;">(December 2019)</span>
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:18.5mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:0mm;">Partner's Audit Liability Under Section 6226</span>
							<br /><br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8978</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:18.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-0123</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;padding-top:1.5mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">57</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							<strong>Name of partner(s)</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Partner tax ID number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Computation of Additional Reporting Year Tax <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="" style="width:79mm;height:13mm;float:left;">
							&nbsp;
						</div>
						<div class="sty8978AmtBox" style="height:13mm;text-align:center;">
							<strong>(a)</strong><br />
							Tax Year Ended <br />
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TaxYearEndDt"/>
								</xsl:call-template>
							</span><br />
							mo. day &nbsp; year
						</div>
						<div class="sty8978AmtBox" style="height:13mm;text-align:center;">
							<strong>(b)</strong><br />
							Tax Year Ended <br />
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TaxYearEndDt"/>
								</xsl:call-template>
							</span><br />
							mo. day &nbsp; year
						</div>
						<div class="sty8978AmtBox" style="height:13mm;text-align:center;">
							<strong>(c)</strong><br />
							Tax Year Ended <br />
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TaxYearEndDt"/>
								</xsl:call-template>
							</span><br />
							mo. day &nbsp; year
						</div>
						<div class="sty8978AmtBox" style="height:13mm;text-align:center;">
							<strong>(d)</strong><br />
							Tax Year Ended <br />
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TaxYearEndDt"/>
								</xsl:call-template>
							</span><br />
							mo. day &nbsp; year
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">1a</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Total income per original return or as previously <br /> adjusted
							<span class="sty8978DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />1a</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalIncomeOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalIncomeOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalIncomeOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalIncomeOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Adjustments to income from Schedule A <br /> 
							(Form 8978), line 2, columns (a) through (d)
							<span class="sty8978DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />1b</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalAdjustmentsToIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalAdjustmentsToIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalAdjustmentsToIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalAdjustmentsToIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">2</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Combine lines 1a and 1b and enter the corrected income. See instructions
							<span class="sty8978DotLn">.......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />2</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">3a</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Total deductions per original return or as <br /> previously adjusted
							<span class="sty8978DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />3a</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalDeductionOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalDeductionOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalDeductionOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalDeductionOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Adjustments to deductions from Schedule A <br /> 
							(Form 8978), line 4, columns (a) through (d)
							<span class="sty8978DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />3b</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalDeductionNetChangeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalDeductionNetChangeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalDeductionNetChangeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalDeductionNetChangeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">4</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Combine lines 3a and 3b and enter the corrected deductions. See instructions
							<span class="sty8978DotLn">......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />4</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalDeductionCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalDeductionCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalDeductionCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalDeductionCorrectAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;"><br />5</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Corrected taxable income. Subtract line 4 from <br />line 2
							<span class="sty8978DotLn">.............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />5</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TaxableIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TaxableIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TaxableIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TaxableIncomeCorrectAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;"><br />6</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							<br />Income tax on line 5 (see instructions)
							<span class="sty8978DotLn">...</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />6</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">7</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Alternative minimum tax on line 5 (see <br /> instructions)
							<span class="sty8978DotLn">...........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />7</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;"><br />8</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							<br />Total corrected income tax. Add lines 6 and 7
							<span class="sty8978DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />8</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalTaxCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalTaxCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalTaxCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalTaxCorrectAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9a -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;width:7.5mm;">9a</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Total credits per original return or as previously <br /> adjusted
							<span class="sty8978DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />9a</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalCreditOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalCreditOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalCreditOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalCreditOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9b -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Adjustments to credits from Schedule A <br /> 
							(Form 8978), line 6, columns (a) through (d)
							<span class="sty8978DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />9b</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalAdjustmentsToCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalAdjustmentsToCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalAdjustmentsToCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalAdjustmentsToCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;">10</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Combine lines 9a and 9b and enter the corrected credits. See instructions
							<span class="sty8978DotLn">.......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />10</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalCreditsCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalCreditsCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalCreditsCorrectAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalCreditsCorrectAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;">11</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Total corrected income tax liability.  <br /> 
							Subtract line 10 from line 8
							<span class="sty8978DotLn">......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />11</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalCorrIncmTaxLiabAfterCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalCorrIncmTaxLiabAfterCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalCorrIncmTaxLiabAfterCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalCorrIncmTaxLiabAfterCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;">12</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Total income tax shown on original return or as <br /> previously adjusted
							<span class="sty8978DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />12</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TotalTaxOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TotalTaxOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TotalTaxOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TotalTaxOriginallyRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;">13</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							Increase/Decrease to tax. Subtract line 12 from <br /> line 11, columns (a) through (d)
							<span class="sty8978DotLn">.....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />13</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/TaxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/TaxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/TaxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/TaxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="width:7.5mm;height:7mm;">14</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;">
							Total increase/decrease to reporting year tax. Add line 13, columns (a) through (d). Enter here and on the appropriate line on your tax return
							<span class="sty8978DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />14</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotRptgYrTxIncreaseDecreaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Penalties <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;"><br />15</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							<br />Penalties
							<span class="sty8978DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />15</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/PenaltyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/PenaltyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/PenaltyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/PenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="width:7.5mm;height:7mm;"><br />16</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;">
							<br />
							Total penalties. Add line 15, columns (a) through (d)
							<span class="sty8978DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />16</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Interest <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:7mm;width:7.5mm;"><br />17</div>
						<div class="styLNDesc" style="width:64mm;height:7mm;">
							<br />Interest
							<span class="sty8978DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7.5mm;height:7mm;"><br />17</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[1]/InterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[2]/InterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[3]/InterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978AmtBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TYAuditLiabilityCmptGrp[4]/InterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="width:7.5mm;height:7mm;"><br />18</div>
						<div class="styLNDesc" style="width:138.5mm;height:7mm;">
							<br />
							Total interest. Add line 17, columns (a) through (d)
							<span class="sty8978DotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />18</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37802K</span>
						<span style="float:right;">Form <strong>8978</strong> (12-2019)</span>
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
