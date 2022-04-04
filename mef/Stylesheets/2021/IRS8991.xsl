<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8991Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8991"/>
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
				<meta name="Description" content="IRS Form 8991"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8991Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8991">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:18pt;">8991</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. Dec. 2020)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:10pt;">Tax on Base Erosion Payments of Taxpayers With <br/>
							Substantial Gross Receipts</span>
							<br/>
							<span style="font-weight:bold;">
								For tax year beginning 
								<span style="width:30mm;border-bottom:1px dashed black;text-align:center;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>, and ending 
								<span style="width:30mm;border-bottom:1px dashed black;text-align:center;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</span>
							<br/>
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8991</span>
								for instructions and the latest information.
							</span>
							<br/>
							<span style="font-weight:bold;">
								&#9658;See instructions
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div style="float:left;width:130mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							Name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="float:left;width:57mm;height:10mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<strong>Employer Identification number</strong>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Applicable Taxpayer</div>
					</div>
					<div class="styStdDiv" style="padding:0.5mm 0mm 0.5mm 0mm;">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/TxpyrAggrgtUndSect159A2cInd"/>
								<xsl:with-param name="BackupName">F8991TxpyrAggregatedUndSect59Ae3Ind</xsl:with-param>
							</xsl:call-template>Check box if this form is being filed by a taxpayer with which another taxpayer has been aggregated under Regs. section 1.59A-2(c). </label> &#9658;
						<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;" alt="Taxpayer aggregated under regs section 1.59A-2 c Indicator">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/TxpyrAggrgtUndSect159A2cInd"/>
								<xsl:with-param name="BackupName">F8991TxpyrAggregatedUndSect59Ae3Ind</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<div class="styStdDiv" style="padding:0.5mm 0mm 0.5mm 0mm;">
						If the above box is checked, attach a statement listing the names and EINs of all separate taxpayers 
						taken into account in the <br/> determination of "1 person" under Regs. section 1.59A-2(c) 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TxpyrAggrgtUndSect159A2cInd"/>
						</xsl:call-template>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox"/>
						<div class="sty8991ShortDesc" style=""/>
						<div class="sty8991HeaderBox">Column A</div>
						<div class="sty8991HeaderBox">Column B</div>
						<div class="sty8991HeaderBox">Column C</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox"/>
						<div class="sty8991ShortDesc" style=""/>
						<div class="sty8991HeaderBox">1st <br/> Preceding <br/> Tax Year</div>
						<div class="sty8991HeaderBox">2nd <br/> Preceding <br/> Tax Year</div>
						<div class="sty8991HeaderBox">3rd <br/> Preceding <br/> Tax Year</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="sty8991ShortDesc">
							Gross receipts of the applicable taxpayer. See instructions
							<span class="sty8991DotLn">.....</span>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstPrecYrBaseErosionPymtGrp/ApplcblTxpyrGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SecondPrecYrBaseErosionPymtGrp/ApplcblTxpyrGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ThirdPrecYrBaseErosionPymtGrp/ApplcblTxpyrGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="sty8991ShortDesc">
							Gross receipts from partnerships
							<span class="sty8991DotLn">.............</span>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstPrecYrBaseErosionPymtGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SecondPrecYrBaseErosionPymtGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ThirdPrecYrBaseErosionPymtGrp/PartnershipGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="sty8991ShortDesc" style="height:7mm;">
							Gross receipts of all other persons treated as a single employer as the <br/> "applicable taxpayer" pursuant to Regs. section 1.59A-2(c)
							<span class="sty8991DotLn">.....</span>
						</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstPrecYrBaseErosionPymtGrp/AllOtherPersonsGrossRcptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SecondPrecYrBaseErosionPymtGrp/AllOtherPersonsGrossRcptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ThirdPrecYrBaseErosionPymtGrp/AllOtherPersonsGrossRcptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="sty8991ShortDesc">
							Gross receipts. Combine line 1a through line 1c
							<span class="sty8991DotLn">........</span>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstPrecYrBaseErosionPymtGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SecondPrecYrBaseErosionPymtGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ThirdPrecYrBaseErosionPymtGrp/GrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="sty8991Desc">
							Gross receipts of 1st, 2nd, and 3rd preceding taxable years. Combine Columns A, B, and C of line 1d
							<span class="sty8991DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">1e</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="sty8991Desc">
							3-year average annual gross receipts (line 1e divided by 3.0)
							<span class="sty8991DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">1f</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Avg3YrAnnualGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1g -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
						<div class="sty8991Desc" style="height:11mm;">
							Is line 1f $500 million or more?<br/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MetAvg3YrAnnlGroRcptsLimitInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MetAvg3YrAnnlGroRcptsLimitInd"/>
										<xsl:with-param name="BackupName">F8991MetAvg3YrAnnlGroRcptsLimitInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/MetAvg3YrAnnlGroRcptsLimitInd"/>
										<xsl:with-param name="BackupName">F8991MetAvg3YrAnnlGroRcptsLimitInd</xsl:with-param>
									</xsl:call-template>Yes. Continue to line 2.
								</label>
								<br/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MetAvg3YrAnnlGroRcptsLimitInd"/>
										<xsl:with-param name="BackupName">F8991MetAvg3YrAnnlGroRcptsLimitInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/MetAvg3YrAnnlGroRcptsLimitInd"/>
										<xsl:with-param name="BackupName">F8991MetAvg3YrAnnlGroRcptsLimitInd</xsl:with-param>
									</xsl:call-template>No. STOP here and attach this form to your tax return
								</label>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:11mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="sty8991Desc">
							Base erosion tax benefit (from Schedule A, line 15, column a-2)
							<span class="sty8991DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8991Desc">
							Amount of deductions allowed under Chapter 1 of the Internal Revenue Code
							<span class="sty8991DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateDedAllwblChapter1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Base erosion tax benefits resulting from reductions in insurance premiums<br/> 
							reported on Schedule A, line 8, column A-2
							<span class="sty8991DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2c</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/BaseErosionTxBnftRedInsPremAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Base erosion tax benefits resulting from reductions in gross receipts<br/> 
							reported on Schedule A, line 10, column A-2
							<span class="sty8991DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2d</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/BaseErosionTxBnftRedGroRcptAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="sty8991Desc">
							Add lines 2c and 2d
							<span class="sty8991DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">2e</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBaseErosionTxBnftRedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Total deductions for amount paid or accrued for services, to which the exception <br/> 
							under Regs. section 1.59A-3(b)(3)(i) applies (from Schedule A, line 5b)
							<span class="sty8991DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2f</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CompPaidSrvcSect159A3b3iAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2g -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
						<div class="sty8991Desc" style="width:107mm;">
							Qualified derivative payments excepted by Regs. section 1.59A-6(b)
							<span class="sty8991DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">2g</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQualifiedDerivativeDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2h -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">h</div>
						<div class="sty8991Desc" style="width:107mm;">
							Total deductions allowed under sections 172, 245A, and 250 for the tax year
							<span class="sty8991DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">2h</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2i -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">i</div>
						<div class="sty8991Desc" style="height:auto;width:107mm;">
							Does the taxpayer elect to waive deductions in accordance with proposed <br/> regulations section 1.59A-3(c)(6)(i)? <br/>
							<span style="display:inline;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/WaiveDeductionsElectionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Waive deductions election Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/WaiveDeductionsElectionInd"/>
										<xsl:with-param name="BackupName">F8991WaiveDeductionsElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/WaiveDeductionsElectionInd"/>
										<xsl:with-param name="BackupName">F8991WaiveDeductionsElectionInd</xsl:with-param>
									</xsl:call-template>Yes. Complete Schedule B. Enter the amount from line 15 of Schedule B.
								</label>
								<br/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Waive deductions election No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/WaiveDeductionsElectionInd"/>
										<xsl:with-param name="BackupName">F8991MetAvg3YrAnnlGroRcptsLimitInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/WaiveDeductionsElectionInd"/>
										<xsl:with-param name="BackupName">F8991WaiveDeductionsElectionInd</xsl:with-param>
									</xsl:call-template>No. Enter -0-
								</label>
							</span>
							<span class="sty8991DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;">
							<br/>
							<br/>
							<br/>2i</div>
						<div class="sty8991AmountBox" style="height:14mm;">
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalWaivedDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:14mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2j -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">j</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Deductions for exchange losses from section 988 transactions described in Regulations section 1.59A-2(e)(3)(ii)(D)
							<span class="sty8991DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2j</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExchLossesSect988TransDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2k -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">k</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Deductions for TLAC securities and foreign TLAC securities described in Regulations section 1.59A-2(e)(3)(ii)(E)
							<span class="sty8991DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2k</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TLACSecForeignTLACSecDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2l -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">l</div>
						<div class="sty8991Desc" style="height:7mm;width:107mm;">
							Reinsurance losses incurred and claims payments described in Regulations section 1.59A-2(e)(3)(ii)(F)
							<span class="sty8991DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2l</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReinsLossIncurdClaimsPymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2m -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">m</div>
						<div class="sty8991Desc">
							Combine lines 2f through 2l
							<span class="sty8991DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">2m</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2n -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">n</div>
						<div class="sty8991Desc">
							<strong>Total Deductions. </strong> Subtract line 2m from the sum of line 2b and line 2e
							<span class="sty8991DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">2n</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2o -->
					<div class="styStdDivIB">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">o</div>
						<div class="sty8991Desc">
							<strong>Base Erosion Percentage. </strong> Divide line 2a by line 2n
							<span class="sty8991DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">2o</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPct"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/BaseErosionPct)">%</xsl:if>
						</div>
					</div>
					<!-- Line 2p -->
					<div class="styStdDivIB">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">p</div>
						<div class="sty8991Desc" style="height:14mm;">
							Is the taxpayer's base erosion percentage on line 2o 3% or higher (2% or higher for a bank or securities dealer)?<br/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/BaseErosionThresholdPctInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionThresholdPctInd"/>
										<xsl:with-param name="BackupName">F8991BaseErosionThresholdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionThresholdPctInd"/>
										<xsl:with-param name="BackupName">F8991BaseErosionThresholdPctInd</xsl:with-param>
									</xsl:call-template>Yes. Continue to Part II.
								</label>
								<br/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionThresholdPctInd"/>
										<xsl:with-param name="BackupName">F8991BaseErosionThresholdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionThresholdPctInd"/>
										<xsl:with-param name="BackupName">F8991BaseErosionThresholdPctInd</xsl:with-param>
									</xsl:call-template>No. STOP after completing Part I and Schedule A (and, if necessary, Schedule B) and attach this form to your tax return.
								</label>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="height:14mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="margin-left:80mm;">Cat. No. 37815N</span>
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 8991 (Rev. 12-2020)
						<div style="float:right;">Page <strong>2</strong>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Modified Taxable Income (MTI)</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="sty8991Desc">
							Taxable income after net operating loss. See instructions
							<span class="sty8991DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncmAftrNOLSpclDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8991Desc">
							Base erosion tax benefits for the tax year from Schedule A, line 15, column (b-2)
							<span class="sty8991DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8991Desc" style="font-family:Arial;padding-top:0.8mm;">
							Base erosion percentage of the net operating loss deduction allowed under section 172 for the tax year. See instructions
							<span class="sty8991DotLn" style="font-family:Verdana;">..</span>
						</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPctNOLDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="sty8991Desc">
							<strong>Modified Taxable Income. </strong> See instructions
							<span class="sty8991DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBoxNBB">3d</div>
						<div class="sty8991AmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ModifiedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Regular Tax Liability Adjusted for Purposes of Computing Base Erosion Minimum Tax Amount</div>
					</div>
					<!-- Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="sty8991Desc">
							Regular tax liability
							<span class="sty8991DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RegularTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8991Desc">
							Allowed credits, as adjusted (from Schedule C, line 7)
							<span class="sty8991DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYAllwCreditAgainstRegTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8991Desc" style="height:7mm;">
							<strong>Regular tax liability adjusted </strong> for purposes of computing Base Erosion Minimum Tax Amount. Subtract <br/>
							line 4b from line 4a
							<span class="sty8991DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;">
							<br/>4c</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedRegularTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Computation of Base Erosion Minimum Tax Amount</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="sty8991Desc">
							Modified Taxable Income (from line 3d)
							<span class="sty8991DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">5a</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ModifiedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8991Desc">
							BEAT Tax rate applicable for current tax year
							<span class="sty8991DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/TaxRt"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/BaseErosionPct)">%</xsl:if>
						</div>
					</div>
					<!-- Line 5c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8991Desc">
							Base Erosion Minimum Tax. Multiply line 5a by line 5b
							<span class="sty8991DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">5c</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="sty8991Desc">
							Regular tax liability adjusted for purposes of computing Base Erosion Minimum Tax Amount (from line 4c)
							<span class="sty8991DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">5d</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedRegularTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="sty8991Desc">
							<strong>Base Erosion Minimum Tax Amount. </strong> Subtract line 5d from line 5c. If zero or less, enter "-0-"
							<span class="sty8991DotLn">.....</span>
						</div>
						<div class="styLNRightNumBoxNBB">5e</div>
						<div class="sty8991AmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotBaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8991 (Rev. 12-2020)
						<div style="float:right;">Page <strong>3</strong>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:23mm;">SCHEDULE A</div>
						<div class="styPartDesc" style="width:200mm;">Base Erosion Payments and Base Erosion Tax Benefits <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<!--<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>-->
						<div class="styLNDesc" style="width:196mm;height:8mm;">
							Does the taxpayer elect to use financial statements per Regs. section 1.59A-3(b)(4)(i)(D) for 
							purposes of calculating interest expense allocable to a foreign corporation's effectively connected income?
							<span style="display:inline;font-weight:bold;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/UseFinancialStmtElectionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:4px;" alt="Use Financial Statement Election Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/UseFinancialStmtElectionInd"/>
										<xsl:with-param name="BackupName">F8991UseFinancialStmtElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/UseFinancialStmtElectionInd"/>
										<xsl:with-param name="BackupName">F8991UseFinancialStmtElectionInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM" style="margin-left:12px;margin-right:4px;" alt="Use Financial Statement Election No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/UseFinancialStmtElectionInd"/>
										<xsl:with-param name="BackupName">F8991UseFinancialStmtElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/UseFinancialStmtElectionInd"/>
										<xsl:with-param name="BackupName">F8991UseFinancialStmtElectionInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span>
						</div>
						<!--<div class="sty8991ScheduleBoxInd" style="width:108mm;height:8mm;border-left-width:0px;">&nbsp;</div>-->
						<div class="sty8991ScheduleBoxInd" style="width:60mm;font-weight:bold;padding:1mm;height:8mm;border-bottom-width:0px;">
							(Check all applicable boxes in <br/> columns (c), (d), and (e) below)
						</div>
					</div>
					<!-- Column labels -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styLNDesc" style="width:81mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;border-top-width:1px;">(a-1)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;border-top-width:1px;">(a-2)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;border-top-width:1px;">(b-1)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;border-top-width:1px;">(b-2)</div>
						<div class="sty8991ScheduleBoxInd" style="border-top-width:1px;">(c)</div>
						<div class="sty8991ScheduleBoxInd" style="border-top-width:1px;">(d)</div>
						<div class="sty8991ScheduleBoxInd" style="border-top-width:1px;">(e)</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="height:32mm;width:7mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styLNDesc" style="height:32mm;width:81mm;border-bottom:1px solid black;text-align:center;font-size:9pt;font-weight:bold;padding-top:14mm;">
							Type of Base Erosion Payments
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Aggregate Group's Base Erosion Payments</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Aggregate Group's Base Erosion Tax Benefits</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Taxpayer's Base Erosion Payments for Purposes of Modified Taxable Income</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Taxpayer's Base Erosion Tax Benefits</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Any 25% Owner of the Taxpayer</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Person Related Under Sections <br/>267(b) or 707(b)(1) to the Taxpayer or any 25% Owner of the Taxpayer</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Any Other Person Related Within the Meaning of Section 482 to the Taxpayer</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">1</div>
						<div class="styLNDesc" style="width:81mm;">
							Reserved for future use
						</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">2</div>
						<div class="styLNDesc" style="width:81mm;">
							Reserved for future use
						</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">3</div>
						<div class="styLNDesc" style="height:7mm;width:81mm;">
							Purchase or creations of property rights for intangibles (patents, <br/> trademarks, etc.)
							<span class="sty8991DotLn">..............</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/PropertyRightsPrchsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/PropertyRightsPrchsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/PropertyRightsPrchsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/PropertyRightsPrchsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/PropertyRightsPrchsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/PropertyRightsPrchsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/PropertyRightsPrchsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">4</div>
						<div class="styLNDesc" style="width:81mm;">
							Rents, royalties, and license fees
							<span class="sty8991DotLn">.........</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/RentsRyltsLcnsFeesPdAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/RentsRyltsLcnsFeesPdAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/RentsRoyaltiesLicenseFeesPdInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/RentsRoyaltiesLicenseFeesPdInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/RentsRoyaltiesLicenseFeesPdInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">5a</div>
						<div class="styLNDesc" style="height:7mm;width:81mm;">
							Compensation/consideration paid for services <strong>NOT</strong> excepted by <br/> Regs. section 1.59A-3(b)(3)(i)
							<span class="sty8991DotLn">..........</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/CompPaidSrvcNotSect159A3b3iAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/CompPdSrvcNotSect159AllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/CompPaidSrvcNotSect159A3b3iAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/CompPdSrvcNotSect159AllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/CompPaidSrvcNotSect159A3b3iInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/CompPaidSrvcNotSect159A3b3iInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/CompPaidSrvcNotSect159A3b3iInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:7mm;width:81mm;">
							Compensation/consideration paid for services excepted by <br/> Regs. section 1.59A-3(b)(3)(i)
							<span style="float:right;padding-right:2px;">
								<span class="sty8991DotLn" style="float:none;">..</span> 
								$
								<span style="border-bottom:1px solid black;width:27mm;height:3mm;text-align:right;margin-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CompPaidSrvcSect159A3b3iAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">6</div>
						<div class="styLNDesc" style="width:81mm;">
							Interest expense
							<span class="sty8991DotLn">..............</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/InterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/DedIntExpenseAllwChapter1Amt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/InterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/DedIntExpenseAllwChapter1Amt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/InterestExpenseInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/InterestExpenseInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/InterestExpenseInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">7</div>
						<div class="styLNDesc" style="width:81mm;">
							Payments for the purchase of tangible personal property
							<span class="sty8991DotLn">..</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/TangiblePropPrchsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/TangiblePropPrchsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/TangiblePropPrchsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/TangiblePropPrchsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/TangiblePropPrchsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/TangiblePropPrchsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/TangiblePropPrchsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">8</div>
						<div class="styLNDesc" style="height:10mm;width:81mm;">
							Premiums and/or other considerations paid or accrued for <br/> insurance and reinsurance as covered by Regs. section 1.59A-3(b)(1)(iii)
							<span class="sty8991DotLn">................</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/InsReinsPremPdAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/BaseErosionTxBnftRedInsPremAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/InsReinsPremPdAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/BaseErosionTxBnftRedInsPremAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/InsReinsPremPdAccruedInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/InsReinsPremPdAccruedInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:10mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/InsReinsPremPdAccruedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8991 (Rev. 12-2020)
						<div style="float:right;">Page <strong>4</strong>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:23mm;">SCHEDULE A</div>
						<div class="styPartDesc" style="width:200mm;">
							Base Erosion Payments and Base Erosion Tax Benefits 
							<span style="font-weight:normal;">(see instructions) <span style="font-type:italic;"> (continued from page 3)</span>
							</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:81mm;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="width:108mm;height:8mm;border-left-width:0px;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="width:60mm;font-weight:bold;padding:1mm;height:8mm;">
							(Check all applicable boxes in <br/> columns (c), (d), and (e) below)
						</div>
					</div>
					<!-- Column labels -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styLNDesc" style="width:81mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;">(a-1)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;">(a-2)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;">(b-1)</div>
						<div class="sty8991ScheduleBoxInd" style="width:27mm;">(b-2)</div>
						<div class="sty8991ScheduleBoxInd">(c)</div>
						<div class="sty8991ScheduleBoxInd">(d)</div>
						<div class="sty8991ScheduleBoxInd">(e)</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="height:32mm;width:7mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styLNDesc" style="height:32mm;width:81mm;border-bottom:1px solid black;text-align:center;font-size:9pt;font-weight:bold;padding-top:14mm;">
							Type of Base Erosion Payments
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Aggregate Group's Base Erosion Payments</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Aggregate Group's Base Erosion Tax Benefits</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Taxpayer's Base Erosion Payments for Purposes of Modified Taxable Income</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;width:27mm;">Taxpayer's Base Erosion Tax Benefits</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Any 25% Owner of the Taxpayer</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Person Related Under Sections <br/>267(b) or 707(b)(1) to the Taxpayer or any 25% Owner of the Taxpayer</div>
						<div class="sty8991ScheduleBoxInd" style="height:32mm;">Any Other Person Related Within the Meaning of Section 482 to the Taxpayer</div>
					</div>
					<!-- Line 9a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;">9a</div>
						<div class="styLNDesc" style="width:81mm;">
							Nonqualified derivative payments
							<span class="sty8991DotLn">.........</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/NonQlfyDerivativePymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/NonQlfyDrvtvPymtAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/NonQlfyDerivativePymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/NonQlfyDrvtvPymtAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/NonQlfyDerivativePymtInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/NonQlfyDerivativePymtInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/NonQlfyDerivativePymtInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7mm;padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:7mm;width:81mm;">
							Qualified derivative payments excepted by Regs. section 1.59A-6(b)
							<span style="float:right;padding-right:2px;">
								<span class="sty8991DotLn" style="float:none;">........</span> 
								$
								<span style="border-bottom:1px solid black;width:27mm;height:3mm;text-align:right;margin-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDerivativePymtAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">10</div>
						<div class="styLNDesc" style="height:7mm;width:81mm;">
							Payments reducing gross receipts made to surrogate foreign <br/> corporation
							<span class="sty8991DotLn">................</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/GrossReceiptsReductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/BaseErosionTxBnftRedGroRcptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/GrossReceiptsReductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/BaseErosionTxBnftRedGroRcptAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/GrossReceiptsReductionInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/GrossReceiptsReductionInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/GrossReceiptsReductionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">11</div>
						<div class="styLNDesc" style="width:81mm;">
							Other payments &mdash; specify
							<span class="sty8991DotLn">...........</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:if test="$FormData/AggregateBaseErosionPymtGrp/OtherPaymentsAmt/@referenceDocumentName">
								<xsl:attribute name="style">font-size:6pt;</xsl:attribute>
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/OtherPaymentsAmt"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/OtherPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:if test="$FormData/AggregateBaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt/@referenceDocumentName">
								<xsl:attribute name="style">font-size:6pt;</xsl:attribute>
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:if test="$FormData/BaseErosionPymtGrp/OtherPaymentsAmt/@referenceDocumentName">
								<xsl:attribute name="style">font-size:6pt;</xsl:attribute>
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/OtherPaymentsAmt"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/OtherPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:if test="$FormData/BaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt/@referenceDocumentName">
								<xsl:attribute name="style">font-size:6pt;</xsl:attribute>
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/OtherPaymentsAllwDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Any25PercentageOwnerGrp/OtherPaymentsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPrsnGrp/OtherPaymentsInd"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionOtherPrsnGrp/OtherPaymentsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">12</div>
						<div class="styLNDesc" style="width:81mm;">
							Combine line 3 through line 11
							<span class="sty8991DotLn">..........</span>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionPymtGrp/TotalBaseErosionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/TotalBaseErosionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionPymtGrp/TotalBaseErosionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/TotalBaseErosionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">13</div>
						<div class="styLNDesc" style="height:13mm;width:81mm;">
							Base erosion tax benefits related to payments reported on lines 3 
							through 11, on which tax is imposed by section 871 or 881, with 
							respect to which tax has been withheld under section 1441 or 
							1442 at 30% statutory withholding tax rate
							<span class="sty8991DotLn">.....</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;">
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/BaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;">
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/BaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">14</div>
						<div class="styLNDesc" style="height:19mm;width:81mm;">
							Portion of base erosion tax benefits reported on lines 3 through 
							11, on which tax is imposed by section 871 or 881, with respect 
							to which tax has been withheld under section 1441 or 1442 at 
							reduced withholding rate pursuant to income tax treaty. Multiply 
							ratio of percentage withheld divided by 30% times tax benefit. 
							See instructions
							<span class="sty8991DotLn">..............</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:19mm;">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/PortionBaseErosionTaxBnftAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:19mm;">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/PortionBaseErosionTaxBnftAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:19mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;">15</div>
						<div class="styLNDesc" style="height:13mm;width:81mm;">
							<strong>Total</strong> base erosion tax benefits.
							Subtract the sum of line 13 <br/> and line 14 from line 12. Enter the amount from column a-2 <br/> in 
							Part I, line 2a. Enter the amount from column b-2 in <br/> Part II, line 3b
							<span class="sty8991DotLn">...............</span>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggregateBaseErosionTaxBnftGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxAmt" style="height:13mm;border-bottom-width:0px;">
							<br/>
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionTaxBnftGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991ScheduleBoxInd" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Page 5, Schedule B -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8991 (Rev. 12-2020)
						<div style="float:right;">Page <strong>5</strong>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="width:163mm;">Waiver of deductions</div>
					</div>
					<xsl:variable name="shouldSepSchB" select="($Print = $Separated) and (count($FormData/WaiverDeductionsGrp) &gt; 13)"/>
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:6mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;vertical-align:top;">
										<strong>(a) </strong> Description of item or property to which the deduction relates
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)</span>
										Date on which, or period in which, the waived deduction was paid or accrued
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)</span>
										Provision of Code and regulations, as applicable, that allows the deduction for which this election relates
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)</span>
										Line number on the controlled group member tax return where the deduction is reported
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e)</span>
										Name of foreign related party that is or will be the recipient of the payment that generates the deduction
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(f)</span>
										EIN or TIN (if applicable) of foreign related party
									</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(g)</span><br />
										Country of organization of the foreign related party
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(h)</span>
										Amount of deduction claimed for the tax year with respect to the item or property
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(i)</span>
										Amount of deduction being waived for the tax year with respect to the item or property
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepSchB)">
									<xsl:for-each select="$FormData/WaiverDeductionsGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:choose>
													<xsl:when test="position() &lt;= 13">
														<xsl:number value="position()"/>
													</xsl:when>
													<xsl:otherwise>
														&nbsp;
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="WaivedDedPaidOrAccruedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IRCProvisionsTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormOrScheduleLineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="FTIN">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="FTIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:if test="count(ForeignEntityIdentificationGrp) = 1">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="count(ForeignEntityIdentificationGrp) &gt; 1">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
																<xsl:with-param name="Desc">Schedule B, Line <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="WaivedDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSepSchB or (count($FormData/WaiverDeductionsGrp) &lt; 13)">
									<xsl:call-template name="FillSchBCols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/WaiverDeductionsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSepSchB"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;border-right:1px solid black;">14</div>
						<div class="styLNDesc" style="width:197.9mm;padding-left:2px;">
							Totals from attachment, if necessary 
							<span class="sty8991DotLn">.....................................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;">&nbsp;</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="width:6mm;border-right:1px solid black;">15</div>
						<div class="styLNDesc" style="width:223.9mm;padding-left:2px;">
							Total deductions waived per Proposed Regulations section 1.59A-3(c)(6)(i). Add the amounts in column (i). Enter the result here and on Part I, line 2i
							<span class="sty8991DotLn">.........</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:26mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalWaivedDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Page 6 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 8991 (Rev. 12-2020)
						<div style="float:right;">Page <strong>6</strong>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:23mm;">Schedule C</div>
						<div class="styPartDesc" style="width:163mm;">Credits Reducing Regular Tax Liability in Computing Base Erosion Minimum Tax Amount (BEMTA)</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Credits Allowed Against Regular Tax <span style="font-weight:normal;"> (see instructions)</span>
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty8991Desc">
							Total credits allowed in current year. See instructions
							<span class="sty8991DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty8991Desc" style="width:107mm;">
							Credits for increasing research activities from line 1c of all Parts III of Form 3800
							<span class="sty8991DotLn">.</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYIncreasingResearchCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty8991Desc" style="height:7mm;">
							Total allowed credit for increasing research activities for current year. Enter the amount of research <br/> 
							credit reported in Form 3800, Part II, line 38. See instructions
							<span class="sty8991DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>3</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty8991Desc">
							Enter smaller of Schedule C, Part II, line 11 or Part III, line 16
							<span class="sty8991DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Sect38ApplicableCrSmallerAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty8991Desc">
							Limitation of applicable section 38 credits. Multiply line 4 by 80% (0.80)
							<span class="sty8991DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Sect38ApplicableCrLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty8991Desc">
							Adjustments to allowed credits. Add lines 3 and 5
							<span class="sty8991DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllowedCrAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty8991Desc" style="height:7mm;">
							<strong>Credits allowed against regular tax in computing BEMTA. </strong> Subtract line 6 from line 1. Enter here and <br/> 
							on Form 8991, line 4b
							<span class="sty8991DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;">
							<br/>7</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYAllwCreditAgainstRegTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="height:7mm;">
							Applicable section 38 credits <br/>
							<span style="font-weight:normal;"> (Only complete Parts II and III if you have allowed applicable section 38 credits.)</span>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty8991Desc" style="width:107mm;">
							Low income housing credit from line 1d and 4d of all Parts III of Form 3800
							<span class="sty8991DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LowIncomeHousingCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty8991Desc" style="width:107mm;height:7mm;">
							Renewable electricity production credit but only to extent of the renewable <br/>
							electricity under section 45(a) from lines 1f and 4e of all Parts III of Form 3800
							<span class="sty8991DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>9</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RnwblElecCoalCrFromF8835Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty8991Desc" style="width:107mm;height:7mm;">
							Investment credit but only to extent of energy credit property under section 48 <br/>
							from line 4a of all Parts III of Form 3800
							<span class="sty8991DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>10</div>
						<div class="sty8991AmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
						<div class="sty8991AmountBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty8991Desc" style="height:7mm;">
							Total allowed applicable section 38 credits for current year. Enter the amount of applicable credits <br/>
							reported in Form 3800, Part II, line 38. See instructions
							<span class="sty8991DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;">
							<br/>11</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCurrentYearCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">BEMTA determined without adjustment for applicable section 38 credits</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty8991Desc">
							Base erosion minimum tax (Form 8991, line 5c)
							<span class="sty8991DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty8991Desc">
							Regular tax liability (Form 8991, line 4a)
							<span class="sty8991DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RegularTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty8991Desc">
							Subtract Schedule C, Part I, line 3 from line 1
							<span class="sty8991DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedSect38CreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty8991Desc">
							Regular tax adjusted for credits that offset BEMTA. Subtract line 14 from line 13
							<span class="sty8991DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="sty8991AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjRegularTaxSect38CreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty8991Desc" style="height:7mm;">
							Base erosion minimum tax determined without adjustment for applicable section 38 credits. <br/> Subtract line 15 from line 12; 
							if zero or less, enter -0-
							<span class="sty8991DotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;">
							<br/>16</div>
						<div class="sty8991AmountBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BEMTAWithoutAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8991</strong> (Rev. 12-2020)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<!-- Schedule B separated table -->
					<xsl:if test="$shouldSepSchB">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule B - Waiver of deductions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:6mm;font-weight:normal;"> </th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(a) </strong> Description of item or property to which the deduction relates
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)</span>
										Date on which, or period in which, the waived deduction was paid or accrued
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)</span>
										<br/>
										Provision of Code and regulations, as applicable, that allows the deduction for which this election relates
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)</span>
										<br/>
										Line number on the controlled group member tax return where the deduction is reported
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e)</span>
										<br/>
										Name of foreign related party that is or will be the recipient of the payment that generates the deduction
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(f)</span>
										<br/>
										EIN or TIN (if applicable) of foreign related party
									</th>
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(g)</span>
										<br/>
										Country of organization of the foreign related party
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(h)</span>
										<br/>
										Amount of deduction claimed for the tax year with respect to the item or property
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(i)</span>
										<br/>
										Amount of deduction being waived for the tax year with respect to the item or property
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotQOFInvstHoldEOYGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="WaivedDedPaidOrAccruedDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IRCProvisionsTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FormOrScheduleLineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="FTIN">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="FTIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:if test="count(ForeignEntityIdentificationGrp) = 1">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
															<xsl:with-param name="Desc">Schedule B, Line <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeductionClaimedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WaivedDeductionAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/WaiverDeductionsGrp">
						<xsl:if test="count(ForeignEntityIdentificationGrp) &gt; 1">
							<br /><br />
							<span class="styRepeatingDataTitle">Schedule B, row <xsl:value-of select="position()"/>, col (f) - Foreign Entity Reference IDs</span><br />
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr style="border-color:black;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillSchBCols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="13"/>
		<tr style="vertical-align:top;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:value-of select="$LineNumber"/></td>
			<td class="styTableCellTextInherit"><xsl:choose>
				<xsl:when test="$SepMessage">
					See Additional Data Table
				</xsl:when>
				<xsl:otherwise>&nbsp;</xsl:otherwise>
			</xsl:choose></td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillSchBCols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillSchBCols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
