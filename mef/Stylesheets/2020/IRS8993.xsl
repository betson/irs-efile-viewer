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
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. December 2020)</div>
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
						<div class="styPartDesc">Determining Deduction Eligible Income (DEI) and Deemed Intangible Income (DII) <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 1 Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Gross income
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
							Financial services income
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
							CFC dividends (see instructions)
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
							Domestic oil and gas extraction income
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
							Foreign branch income
							<span class="sty8993DotLn">.................</span>
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
							Total exclusions (add lines 2a through 2f)
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
							Gross DEI (subtract line 3 from line 1)
							<span class="sty8993DotLn">......................</span>
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
							DEI (subtract line 5 from line 4)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionEligibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Deemed tangible income return (10% of QBAI)
							<span class="sty8993DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedTangibleIncomeReturnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							DII (subtract line 7 from line 6)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">8</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedIntangibleIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Header -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Determining Foreign-Derived Deduction Eligible Income (FDDEI) <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:12mm;border-bottom:1px solid black;text-align:center;">
						<div class="sty8993HeaderBox" style="height:12mm;width:50mm;border-left:0px">
							
						</div>
						<div class="sty8993HeaderBox" style="">
							<strong>(A)</strong> Foreign-derived income from all sales of general property
						</div>
						<div class="sty8993HeaderBox" style="">
							<strong>(B)</strong> Foreign-derived income from all sales of intangible property
						</div>
						<div class="sty8993HeaderBox" style="">
							<strong>(C)</strong> Foreign-derived income from services
						</div>
						<div class="sty8993HeaderBox" style="height:12mm;width:8mm;">
						</div>
						<div class="sty8993HeaderBox" style="">
							<strong>(D)</strong> Total (Add columns (A) through (C))
						</div>
					</div>
					<!-- Part 2 Line 9a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9a</div>
						<div class="sty8993DescBox">
							Gross receipts
							<span class="sty8993DotLn">.....</span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 9b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8993DescBox">
							Gross receipts from partnerships
							<!--<span class="sty8993DotLn">......</span>-->
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">9b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 9c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8993DescBox" style="height:7mm">
							Total gross receipts (add lines 9a and 9b)
							<span class="sty8993DotLn">......</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">9c</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 10a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10a</div>
						<div class="sty8993DescBox">
							Cost of goods sold (COGS) (see instructions)
							<span class="sty8993DotLn">......</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/CostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/CostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/CostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">10a</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/CostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 10b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="sty8993DescBox">
							COGS from partnerships (see instructions)
							<span class="sty8993DotLn">......</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/PartnershipCostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/PartnershipCostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/PartnershipCostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">10b</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/PartnershipCostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 10c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="sty8993DescBox">
							Total COGS (add lines 10a and 10b)
							<span class="sty8993DotLn">........</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/TotalCostGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/TotalCostGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/TotalCostGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">10c</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/TotalCostGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty8993DescBox">
							Gross FDDEI (subtract line 10c from line 9c)
							<span class="sty8993DotLn">......</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/GrossFDDEIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/GrossFDDEIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/GrossFDDEIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">11</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/GrossFDDEIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty8993DescBox">
							Allocable deductions
							<span class="sty8993DotLn">...</span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty8993DescBox">
							Allocable deductions from partnerships
							<span class="sty8993DotLn">......</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmGenPropGrp/PrtshpAllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmIntngblPropGrp/PrtshpAllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnDerivedIncmSrvcGrp/PrtshpAllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">13</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotFrgnDerivedIncmPropSrvcGrp/PrtshpAllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Interest deductions
							<span class="sty8993DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc">
							Research and experimental deductions
							<span class="sty8993DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ResearchExperimentalDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							Apportioned share of deductions
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ApportionedShareDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							Apportioned share of deductions from partnerships
							<span class="sty8993DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpApprtnShareDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc">
							Total deductions (add lines 12 through 17)
							<span class="sty8993DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc">
							FDDEI (subtract line 18 from line 11)
							<span class="sty8993DotLn">......................</span>
						</div>
						<div class="styLNRightNumBoxNBB">19</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDDEIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 Line 1 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 2 Line 2 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 2 Line 3 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 1a -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 1b -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 1c -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 2 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 3 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 4 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Determining FDII and/or GILTI Deduction <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 4 Line 1 -->
					<!--<div class="styStdDiv">
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
					</div>-->
					<!-- Part 3 Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							Foreign-derived ratio (FDDEI/DEI) (divide line 19 by line 6)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignDerivedRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc">
							FDII (multiply line 8 by line 20)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc">
							GILTI inclusion (see instructions)
							<span class="sty8993DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc">
							Total FDII and GILTI (add lines 21 and 22)
							<span class="sty8993DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFDIIAndGILTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc">
							Taxable income (see instructions) (If zero or less, skip lines 25 through 27 and enter -0- on lines 28 and 29.)
						</div>
						<div class="styLNRightNumBox">24</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:7mm;">
							Excess FDII and GILTI over taxable income (subtract line 24 from line 23). If zero or less, enter -0- here and on lines 26 and 27
							<span class="sty8993DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />25</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExFDIIAndGILTIOverTxblIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc">
							FDII reduction (divide line 21 by line 23; multiply by line 25)
							<span class="sty8993DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">26</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc">
							GILTI reduction (subtract line 26 from line 25)
							<span class="sty8993DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">27</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc">
							FDII deduction (see instructions). Enter here and on Form 1120, Schedule C
							<span class="sty8993DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">28</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FDIIDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc">
							GILTI deduction (see instructions). Enter here and on Form 1120, Schedule C
							<span class="sty8993DotLn">..........</span>
						</div>
						<div class="styLNRightNumBoxNBB">29</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37817J</span>
						<span style="float:right;">Form <strong>8993</strong> (Rev. 12-2020)</span>
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
