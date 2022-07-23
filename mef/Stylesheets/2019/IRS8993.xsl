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
	<xsl:include href="IRS8993Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8993" />
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
				<meta name="Description" content="IRS Form 8993" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS8993Style" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8993">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:18pt;">8993</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. January 2020)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:9pt;">Section 250 Deduction for Foreign-Derived Intangible Income (FDII) <br />
							and Global Intangible Low-Taxed Income (GILTI)</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8993</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-0123</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">933</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div style="float:left;width:140mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							Name of person filing this return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="float:left;width:37mm;height:10mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<strong>Identifying number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Determining Deduction Eligible Income (DEI) <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 1 Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Gross Income
							<span class="sty8993DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Exclusions
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="width:98mm;">
							Income included under section 951(a)(1) (see instructions)
							<span class="sty8993DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section951a1IncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Income included under section 951A (see instructions)
							<span class="sty8993DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIReceivedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Financial Services Income
							<span class="sty8993DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FinancialServicesIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							CFC Dividends (see instructions)
							<span class="sty8993DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCDividendsReceivedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 2e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Domestic Oil and Gas Extraction Income
							<span class="sty8993DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">2e</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DomOilGasExtractionIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 2f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc" style="width:98mm;">
							Foreign Branch Income
							<span class="sty8993DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">2f</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignBranchIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Total Exclusions (add lines 2a through 2f)
							<span class="sty8993DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Gross Income less Total Exclusions (subtract line 3 from line 1)
							<span class="sty8993DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeLessTotIncmExclAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Deductions properly allocable to the amount on line 4
							<span class="sty8993DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Deduction Eligible Income (DEI) (subtract line 5 from line 4)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionEligibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Determining Deemed Intangible Income (DII) <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 2 Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							DEI (from Part I, line 6, above)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionEligibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Deemed Tangible Income Return (10% of QBAI)
							<span class="sty8993DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedTangibleIncomeReturnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Deemed Intangible Income (DII) (subtract line 2 from line 1)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedIntangibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Determining Foreign Derived Ratio <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 3 Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							DEI derived from sales, leases, exchanges, or other dispositions (but 
							not licenses) of property to a foreign person for a foreign use (see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1a</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NotLicensePropertyGrossIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 3 Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							DEI derived from a license of property to a foreign person for a foreign use (see instructions)
							<span class="sty8993DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1b</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LicensePropertyGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 3 Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:7mm;width:98mm;">
							DEI derived from services provided to a person or with respect to property located outside of the United States (see instructions)
							<span class="sty8993DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1c</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignServiceGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 3 Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Foreign Derived Deduction Eligible Income (FDDEI) (add lines 1a through 1c)
							<span class="sty8993DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDDEIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Deduction Eligible Income (DEI) (from Part I, line 6, above)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionEligibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Foreign Derived Ratio (FDDEI / DEI) (divide line 2 by line 3)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignDerivedRt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Determining FDII and/or GILTI Deduction <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 4 Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Deemed Intangible Income (DII) (from Part II, line 3)
							<span class="sty8993DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedIntangibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Foreign Derived Ratio (from Part III, line 4)
							<span class="sty8993DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignDerivedRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc">
							FDII (multiply line 1 by line 2)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Global Intangible Low-Taxed Income (GILTI) Inclusion (see instructions for line 3b)
							<span class="sty8993DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Total FDII and GILTI (add lines 3a and 3b)
							<span class="sty8993DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFDIIAndGILTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Taxable Income (see instructions for line 4)
							<span class="sty8993DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:7mm;">
							Excess FDII and GILTI over Taxable Income (subtract line 4 from line 3c). If zero or less, enter -0- here and on lines 6 and 7
							<span class="sty8993DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExFDIIAndGILTIOverTxblIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							FDII Reduction (divide line 3a by line 3c; multiply by line 5)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							GILTI Reduction (subtract line 6 from line 5)
							<span class="sty8993DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:7mm;">
							FDII Deduction (see instructions for line 8). (Enter here and on Form 1120, Schedule C; see 
							instructions for information on other tax forms)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="height:7mm;">
							GILTI Deduction (see instructions for line 9). (Enter here and on Form 1120, Schedule C; see 
							instructions for information on other tax forms)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />9</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37817J</span>
						<span style="float:right;">Form <strong>8993</strong> (Rev. 1-2020)</span>
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
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
