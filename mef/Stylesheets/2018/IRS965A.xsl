<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS965AStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS965A" />
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
				<meta name="Description" content="IRS Form 965-A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS965AStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form965A">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							Form <span class="styFN" style="font-size:18pt;">965-A</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(January 2019)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">Individual Report of Net 965 Tax Liability</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form965A</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. XXXX-XXXX</div>
						</div>
					</div>
					<!-- Amended line -->
					<div class="styStdDivLS" style="border-top:1px solid black;font-size:8pt;padding-top:0.2mm;padding-left:1.5mm;padding-bottom:0.2mm;">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedInd"/>
								<xsl:with-param name="BackupName">IRS965AmendedInd</xsl:with-param>
							</xsl:call-template>Check this box if this is an amended report</label>
						<span style="float:right;padding-right:2.5mm;">
							<span class="sty965ADotLn" style="float:left;">...........................................</span>
							<span style="float:left;padding-right:2mm;">&#9658;</span>
							<input class="styCkboxNM" type="checkbox" style="float:left;margin-top:1px;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedInd"/>
										<xsl:with-param name="BackupName">IRS965AmendedInd</xsl:with-param>
									</xsl:call-template>
								</input>
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:174mm;">
							Name of taxpayer with a net 965 tax liability<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:40mm;padding-left:0.5mm;">
							Identifying number<br />
							<span style="font-size:7pt;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
						<div class="styEINBox" style="height:7.8mm;width:40mm;padding-left:0.5mm;font-weight:normal;border-left:1px solid black;font-size:7pt;">
							Taxable year of reporting<br />
							<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Report of Net 965 Tax Liability and Election To Pay in Installments</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;padding-bottom:0.5mm;">
										<span style="font-weight:bold;">(a)</span><br />
										Year of Section 965(a) <br />
										Inclusion, Liability Assumption,<br />
										or Liability Triggering Event <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:51mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)</span><br />
										Taxpayer's Net Tax Liability <br />
										with all <br />
										965 amounts <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:51mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)</span><br />
										Taxpayer's Net Tax Liability <br />
										without <br />
										965 amounts <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)</span><br />
										Net 965 Tax Liability <br />
										(subtract column (c) from column (b))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(e)</span><br />
										S Corporation Shareholder Total <br />
										Deferred Net 965 Tax Liability <br />
										(line total from Part III, column (g), <br />
										see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Net965TaxLiabInstalElectGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityYr"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="TransactionCd"/>
												<xsl:with-param name="Desc">Part I - Transaction Code</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWith965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWithout965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:if test="position() &gt; 2">
												<xsl:attribute name="style">border-right-width:0px;background-color:lightgrey;</xsl:attribute>
											</xsl:if>
											<xsl:variable name="pos" select="position()"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSCorpNet965TaxCmptGrp[$pos]/NetSect965DeferredTaxLiabAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/Net965TaxLiabInstalElectGrp) &lt; 7">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/Net965TaxLiabInstalElectGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 1, cols (f)-(k) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(f)</span><br />
										Net 965 Tax Liability <br />
										eligible for installment payment <br />
										election (subtract column (e) from  <br />
										column (d), see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21mm;font-weight:normal;vertical-align:top;padding-left:0px;padding-right:0px;padding-bottom:0px;">
										<span style="font-weight:bold;">(g)</span><br />
										Installment <br />
										Election <br />
										Made<br />
										<div style="width:50%;float:left;text-align:center;border-right:1px solid black;border-top:1px solid black;height:4mm;">Yes</div>
										<div style="width:50%;float:left;text-align:center;height:4mm;border-top:1px solid black;">No</div>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(h)</span><br />
										Net 965 Tax Liability <br />
										to be paid in full for Year 1 <br />
										(if column (g) is "No," enter amount <br />
										from column (f))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(i)</span><br />
										Net 965 Tax Liability <br />
										to be paid in installments <br />
										(if column (g) is "Yes," enter amount <br />
										in column (f) and see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(j)</span><br />
										Net 965 Tax Liability<br />
										Transferred (Out), Transferred In, <br />
										or Subsequent Adjustments, <br /> 
										if any (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(k)</span><br />
										Tax Identification Number <br />
										of buyer/transferee or <br />
										seller/transferor
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Net965TaxLiabInstalElectGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InstallmentPaymentElectionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding:0px;">
											<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:4mm;padding-top:0.2mm;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="InstallmentElectionInd"/>
												</xsl:call-template>
											</div>
											<div style="width:50%;float:left;text-align:center;height:4mm;padding-top:0.2mm;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="InstallmentElectionInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:if test="InstallmentElectionInd = 'false' or InstallmentElectionInd = '0'">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InstallmentPaymentElectionAmt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:if test="InstallmentElectionInd = 'true' or InstallmentElectionInd = '1'">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InstallmentPaymentElectionAmt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxAdjustmentAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:choose>
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
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/Net965TaxLiabInstalElectGrp) &lt; 7">
									<xsl:call-template name="FillTable2Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/Net965TaxLiabInstalElectGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Record of Amount of Net 965 Tax Liability Paid by the Taxpayer <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Table 2, cols (a)-(f) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(a)</span><br />
										Year of <br />
										Section 965(a) Inclusions, <br />
										Liability Assumption, or <br />
										Triggering Event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;">
										<br /><span style="font-weight:bold;">(b)</span><br />
										Paid for Year 1
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;">
										<br /><span style="font-weight:bold;">(c)</span><br />
										Paid for Year 2
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;">
										<br /><span style="font-weight:bold;">(d)</span><br />
										Paid for Year 3
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;">
										<br /><span style="font-weight:bold;">(e)</span><br />
										Paid for Year 4
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<br /><span style="font-weight:bold;">(f)</span><br />
										Paid for Year 5
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Net965TaxLiabInstalElectGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear1Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear2Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear3Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear4Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear5Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/Net965TaxLiabInstalElectGrp) &lt; 7">
									<xsl:call-template name="FillTable3Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/Net965TaxLiabInstalElectGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd">
						<span style="font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:25mm;">Cat. No. 71277H</span>
						<span style="float:right;">Form <strong>965-A</strong> (1-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 965-A (1-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 2 (cont) -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Record of Amount of Net 965 Tax Liability Paid by the Taxpayer <span style="font-weight:normal;font-style:italic;">(continued)</span></div>
					</div>
					<!-- Table 2, cols (g)-(k) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(g)</span><br />
										Paid for Year 6
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(h)</span><br />
										Paid for Year 7
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(i)</span><br />
										Paid for Year 8
									</th>
									<th class="styTableCellHeader" scope="col" style="width:51mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(j)</span><br />
										Net 965 Tax Liability Remaining Unpaid <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(k)</span><br />
										Net 965 Tax Liability <br />
										Paid for the Reporting Year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Net965TaxLiabInstalElectGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear6Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear7Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidYear8Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnpaidTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/Net965TaxLiabInstalElectGrp) &lt; 7">
									<xsl:call-template name="FillTable4Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/Net965TaxLiabInstalElectGrp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="4" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965ADotLn" style="margin-right:-10px;">...................................&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetSection965TaxLiabUnpaidAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetSection965TaxLiabPaidAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:auto;width:242mm;">
							S Corporation Shareholder: Report of Calculation of Net 965 Tax Liability Related to 965 Amounts Allocated From an S Corporation and Election to Defer Such Net 965 Tax Liability
						</div>
					</div>
					<!-- Table 3 -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:19mm;font-weight:normal;">
										Year <br /> of <br /> 965(a) <br /> Inclusion
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:53mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(a)</span><br />
										S Corporation Name
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)</span><br />
										S Corporation <br /> Tax Identification <br /> Number
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)</span><br />
										Taxpayer's Net <br /> Tax Liability <br />
										with only 965 amounts <br />
										fom this S Corporation <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)</span><br />
										Taxpayers without <br />
										965 amounts <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:38mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e)</span><br />
										Net 965 Tax Liability<br />
										related to 965 amounts from <br />
										this S Corporation (subtract <br /> 
										column (d) from column (c))
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:18mm;font-weight:normal;vertical-align:top;padding-left:0px;padding-right:0px;padding-bottom:0px;">
										<span style="font-weight:bold;">(f)</span><br />
										Deferral <br />
										Election <br />
										Made
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(g)</span><br />
										Deferred Net 965 <br /> Tax Liabiity <br />
										(if column (f) is "Yes," enter <br />
										amount from column (e))
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:9mm;height:4mm;font-weight:normal;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:9mm;height:4mm;font-weight:normal;">No</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotalSCorpNet965TaxCmptGrp[1]/SCorpNet965TaxComputationGrp">
									<tr style="height:7mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;text-align:right;padding-right:0.5mm;">
											<xsl:if test="position() = 1">
												<div style="float:left;width:13mm;">
													1 <span style="width:2mm;"/>
													<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="../InclusionYr"/>
													</xsl:call-template>
												</div>
											</xsl:if>
											(<xsl:number value="position()" format="i"/>)
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template><br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding:0px;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWith965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWithout965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="DeferralElectionInd"/>
											</xsl:call-template>
										</td>
										<td  class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="DeferralElectionInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:if test="DeferralElectionInd = 'true' or DeferralElectionInd = '1'">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/TotalSCorpNet965TaxCmptGrp[1]/SCorpNet965TaxComputationGrp) &lt; 5">
									<xsl:call-template name="FillTable5Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TotalSCorpNet965TaxCmptGrp[1]/SCorpNet965TaxComputationGrp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="8" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965ADotLn" style="margin-right:-10px;">...................................................&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSCorpNet965TaxCmptGrp[1]/NetSect965DeferredTaxLiabAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:for-each select="$FormData/TotalSCorpNet965TaxCmptGrp[2]/SCorpNet965TaxComputationGrp">
									<tr style="height:7mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;text-align:right;padding-right:0.5mm;">
											<xsl:if test="position() = 1">
												<div style="float:left;width:13mm;">
													2 <span style="width:2mm;"/>
													<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="../InclusionYr"/>
													</xsl:call-template>
												</div>
											</xsl:if>
											(<xsl:number value="position()" format="i"/>)
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template><br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding:0px;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWith965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityWithout965Amt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="DeferralElectionInd"/>
											</xsl:call-template>
										</td>
										<td  class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="DeferralElectionInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:if test="DeferralElectionInd = 'true' or DeferralElectionInd = '1'">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/TotalSCorpNet965TaxCmptGrp[2]/SCorpNet965TaxComputationGrp) &lt; 5">
									<xsl:call-template name="FillTable5Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TotalSCorpNet965TaxCmptGrp[2]/SCorpNet965TaxComputationGrp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="8" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965ADotLn" style="margin-right:-10px;">...................................................&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSCorpNet965TaxCmptGrp[2]/NetSect965DeferredTaxLiabAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>965-A</strong> (1-2019)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 965-A (1-2019)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="height:auto;width:242mm;">
							Annual Report of Deferred Net 965 Tax Liability Related to 965 Amounts Allocated From S Corporations <br />
							<span style="font-weight:normal;">(required every year until the liability is fully paid)</span>
						</div>
					</div>
					<!-- Table 4, cols (a)-(d) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;vertical-align:top;padding-top:2mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(a)</span><br />
										Election or <br />
										Transfer Year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:128mm;font-weight:normal;vertical-align:top;padding-top:2mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(b)</span><br />
										S Corporation Name
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;vertical-align:top;padding-top:2mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(c)</span><br />
										S Corporation <br />
										Tax Identification Number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;vertical-align:top;border-right-width:0px;padding-top:2mm;padding-bottom:2mm;">
										<span style="font-weight:bold;">(d)</span><br />
										Beginning Deferred <br />
										Net 965 Tax Liability <br />
										(see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SCorpDeferredNet965TaxLiabGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="ElectionTransferYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="SCorporationName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BeginningDeferredTaxLiabAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/SCorpDeferredNet965TaxLiabGrp) &lt; 10">
									<xsl:call-template name="FillTable6Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SCorpDeferredNet965TaxLiabGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 4, cols (e)-(i) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTbl" style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;vertical-align:top;padding-top:2mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(e)</span><br />
										Reserved for <br />
										Future Use
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(f)</span><br />
										Net 965 Tax Liability <br />
										Triggered <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(g)</span><br />
										Deferred 965 Net Tax Liability <br />
										Transferred (Out) or <br />
										Transferred In by Agreement, if any <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;padding-bottom:1mm;">
										<span style="font-weight:bold;">(h)</span><br />
										Tax Identification Number <br />
										of Transferee or Transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;vertical-align:top;border-right-width:0px;padding-top:1.5mm;padding-bottom:2mm;">
										<span style="font-weight:bold;">(i)</span><br />
										Deferred Net Tax Liability <br />
										at the end of this Reporting Year <br />
										(add columns (d), (e), (f), and (g)) <br />
										(see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SCorpDeferredNet965TaxLiabGrp">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="NetTaxLiabilityTriggeredAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeferredNetTaxLiabTrnsfrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
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
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeferredNetTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/SCorpDeferredNet965TaxLiabGrp) &lt; 10">
									<xsl:call-template name="FillTable7Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SCorpDeferredNet965TaxLiabGrp)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="5" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965ADotLn" style="margin-right:-10px;">..............................................&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSCorpDefrdNet965TaxLiabAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>965-A</strong> (1-2019)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/Net965TaxLiabInstalElectGrp">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="TransactionCd"/>
								<xsl:with-param name="Desc">Part I - Transaction Code <xsl:number value="position()"/> (<xsl:value-of select="NetTaxLiabilityYr"/>)</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="7"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:if test="$LineNumber &gt; 2">
					<xsl:attribute name="style">border-right-width:0px;background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				&nbsp;
			</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable1Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable2Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="7"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="padding:0px;">
				<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:4mm;padding-top:0.2mm;">&nbsp;</div>
				<div style="width:50%;float:left;text-align:center;height:4mm;padding-top:0.2mm;">&nbsp;</div>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable2Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable3Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="7"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable3Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable4Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="7"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable4Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable5Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;">(<xsl:number value="$LineNumber" format="i"/>)</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable5Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable6Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="10"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable6Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable7Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="10"/>
		<tr style="height:4mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey">&nbsp;</td>
			<td class="styTableCellAmtInherit">
				<xsl:call-template name="PopulateNegativeNumber">
					<xsl:with-param name="TargetNode" select="/.."/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable7Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
