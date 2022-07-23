<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS965BStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS965B" />
	<!-- Special selectors set up to reserve rows 1 and 2 for certain data sets. If an XML group fails rule F965B-002 the data will be missing -->
	<xsl:variable name="ElectionInclusion2017" select="$FormData/Net965TaxLiabInstalElectGrp[TransactionCd='INITIAL INCLUSION' and NetTaxLiabilityYr='2017'][1]"/>
	<xsl:variable name="ElectionInclusion2018" select="$FormData/Net965TaxLiabInstalElectGrp[TransactionCd='INITIAL INCLUSION' and NetTaxLiabilityYr='2018'][1]"/>
	<xsl:variable name="ElectionOther" select="$FormData/Net965TaxLiabInstalElectGrp[not(TransactionCd='INITIAL INCLUSION' and (NetTaxLiabilityYr='2017' or NetTaxLiabilityYr='2018'))]"/>
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
				<meta name="Description" content="IRS Form 965-B" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS965BStyle" />
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
							Form <span class="styFN" style="font-size:18pt;">965-B</span> 
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
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">
								Corporate and Real Estate Investment Trust (REIT) Report of Net 965 <br />
								Tax Liability and Electing REIT Report of 965 Amounts
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form965B</span>
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
							<span class="sty965BDotLn" style="float:left;">...........................................</span>
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
							Name of taxpayer or REIT<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:40mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Identifying number</strong><br />
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
						<div class="styEINBox" style="height:7.8mm;width:40mm;padding-left:0.5mm;font-weight:normal;border-left:1px solid black;font-size:7pt;">
							Taxable year of reporting<br />
							<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;font-size:8pt;">
						REITs Electing To Account For Section 965 Amounts Over Time Must Filll Out Part III.
					</div>
					<!-- Part 1 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Report of Net 965 Tax Liability and Election To Pay in Installments</div>
					</div>
					<!-- Table 1 -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;vertical-align:top;padding-bottom:0.5mm;">
										<span style="font-weight:bold;">(a)</span><br />
										Year of <br /> Section <br /> 965(a) <br />
										Inclusion or <br /> Liability Assumed<br />
										<span style="font-family:Arial Narrow;">(see instructions)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)</span><br />
										Taxpayer's Net Tax <br />
										Liability with all <br />
										965 amounts <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)</span><br />
										Taxpayer's Net Tax <br />
										Liability without <br />
										965 amounts <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)</span><br />
										Net 965 Tax Liability <br />
										(subtract column (c) <br /> 
										from column (b))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;vertical-align:top;padding-left:0px;padding-right:0px;padding-bottom:0px;">
										<span style="font-weight:bold;">(e)</span><br />
										Installment <br />
										Election <br />
										Made<br /><br /><br /><br />
										<div style="width:50%;float:left;text-align:center;border-right:1px solid black;border-top:1px solid black;height:4mm;">Yes</div>
										<div style="width:50%;float:left;text-align:center;height:4mm;border-top:1px solid black;">No</div>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(f)</span><br />
										Net 965 Tax Liability <br />
										to be paid <br /> 
										in full in Year 1 <br />
										(if column (e) is "No," <br /> 
										enter amount <br />
										from column (d))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(g)</span><br />
										Net 965 Tax Liability <br />
										to be paid <br /> 
										in installments <br />
										(if column (e) is "Yes," <br /> 
										enter amount <br />
										from column (d) <br />
										and see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(h)</span><br />
										Net 965 Tax Liability<br />
										Transferred (Out), Transferred In, <br />
										or Subsequent Adjustments, <br /> 
										if any (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(i)</span><br />
										Tax <br /> 
										Identification <br /> 
										Number <br />
										of buyer/ <br />
										transferee or <br />
										seller/ <br />
										transferor
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Row 1, 2017 Initial Inclusion. Use $ElectionInclusion2017 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">1</td>
									<td class="styTableCellCtrInherit">
										<xsl:if test="not($ElectionInclusion2017/NetTaxLiabilityYr)">2017</xsl:if>
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetTaxLiabilityYr"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/TransactionCd"/>
											<xsl:with-param name="Desc">Part I - Transaction Code</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetTaxLiabilityWith965Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetTaxLiabilityWithout965Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetSection965TaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="padding:0px;">
										<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:4mm;padding-top:0.2mm;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/InstallmentElectionInd"/>
											</xsl:call-template>
										</div>
										<div style="width:50%;float:left;text-align:center;height:4mm;padding-top:0.2mm;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/InstallmentElectionInd"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:if test="$ElectionInclusion2017/InstallmentElectionInd = 'false' or $ElectionInclusion2017/InstallmentElectionInd = '0'">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:if test="$ElectionInclusion2017/InstallmentElectionInd = 'true' or $ElectionInclusion2017/InstallmentElectionInd = '1'">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetTaxAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="border-right-width:0px;">
										<xsl:choose>
											<xsl:when test="$ElectionInclusion2017/SSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/SSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/EIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<!-- Row 2, 2018 Initial Inclusion. Use $ElectionInclusion2018 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">2</td>
									<td class="styTableCellCtrInherit">
										<xsl:if test="not($ElectionInclusion2018/NetTaxLiabilityYr)">2018</xsl:if>
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetTaxLiabilityYr"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/TransactionCd"/>
											<xsl:with-param name="Desc">Part I - Transaction Code</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetTaxLiabilityWith965Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetTaxLiabilityWithout965Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetSection965TaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="padding:0px;">
										<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:4mm;padding-top:0.2mm;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/InstallmentElectionInd"/>
											</xsl:call-template>
										</div>
										<div style="width:50%;float:left;text-align:center;height:4mm;padding-top:0.2mm;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/InstallmentElectionInd"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:if test="$ElectionInclusion2018/InstallmentElectionInd = 'false' or $ElectionInclusion2018/InstallmentElectionInd = '0'">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:if test="$ElectionInclusion2018/InstallmentElectionInd = 'true' or $ElectionInclusion2018/InstallmentElectionInd = '1'">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetSection965TaxLiabilityAmt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetTaxAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="border-right-width:0px;">
										<xsl:choose>
											<xsl:when test="$ElectionInclusion2018/SSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/SSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/EIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<xsl:for-each select="$ElectionOther">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position() + 2"/>
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
													<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:if test="InstallmentElectionInd = 'true' or InstallmentElectionInd = '1'">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetSection965TaxLiabilityAmt"/>
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
								<xsl:if test="count($ElectionOther) &lt; 5">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="3 + count($ElectionOther)"/>
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
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(a)</span><br />
										Year of Section 965(a) <br />
										Inclusion or <br />
										Liability Assumed <br />
										(see instructions)
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
								<!-- Row 1, 2017 Initial Inclusion. Use $ElectionInclusion2017 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">1</td>
									<td class="styTableCellCtrInherit">
										<xsl:if test="not($ElectionInclusion2017/NetTaxLiabilityYr)">2017</xsl:if>
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/NetTaxLiabilityYr"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear4Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear5Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Row 2, 2018 Initial Inclusion. Use $ElectionInclusion2018 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">2</td>
									<td class="styTableCellCtrInherit">
										<xsl:if test="not($ElectionInclusion2018/NetTaxLiabilityYr)">2018</xsl:if>
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/NetTaxLiabilityYr"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear1Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear2Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear3Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear4Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear5Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:for-each select="$ElectionOther">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position() + 2"/>
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
								<xsl:if test="count($ElectionOther) &lt; 5">
									<xsl:call-template name="FillTable3Rows">
										<xsl:with-param name="LineNumber" select="3 + count($ElectionOther)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 2, cols (g)-(k) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(g)</span><br />
										Paid for Year 6
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(h)</span><br />
										Paid for Year 7
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(i)</span><br />
										Paid for Year 8
									</th>
									<th class="styTableCellHeader" scope="col" style="width:51mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(j)</span><br />
										Net 965 Tax Liability <br />
										Remaining Unpaid (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(k)</span><br />
										Net 965 Tax Liability <br />
										Paid for the Reporting Year
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Row 1, 2017 Initial Inclusion. Use $ElectionInclusion2017 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">1</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear6Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear7Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidYear8Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/UnpaidTaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/PaidTaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Row 2, 2018 Initial Inclusion. Use $ElectionInclusion2018 -->
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">2</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear6Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear7Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidYear8Amt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/UnpaidTaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/PaidTaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:for-each select="$ElectionOther">
									<tr style="height:4mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="position() + 2"/>
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
								<xsl:if test="count($ElectionOther) &lt; 5">
									<xsl:call-template name="FillTable4Rows">
										<xsl:with-param name="LineNumber" select="3 + count($ElectionOther)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="4" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965BDotLn" style="margin-right:-10px;">...................................&#9658;</span>
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
					<div class="styStdDivLS pageEnd">
						<span style="font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:25mm;">Cat. No. 71278S</span>
						<span style="float:right;">Form <strong>965-B</strong> (1-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 965-B (1-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:auto;width:242mm;">
							Electing REIT Report of Section 965 Amounts Accounted for Over Time <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Table 3, cols (a)-(f) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;padding:1.5mm 0mm 1.5mm 0mm;">
										<span style="font-weight:bold;">(a)</span><br />
										Tax Year of <br />
										Section 965(a) Inclusion and <br />
										Section 965(c) Deduction
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(b)</span><br />
										Amount Elected to be <br /> 
										Accounted for Over Time
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(c)</span><br />
										Portion Accounted for in <br /> Year 1
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(d)</span><br />
										Portion Accounted for in <br /> Year 2
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(e)</span><br />
										Portion Accounted for in <br /> Year 3
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;border-right-width:0px;padding-top:1.5mm;">
										<span style="font-weight:bold;">(f)</span><br />
										Portion Accounted for in <br /> Year 4
									</th>
								</tr>
							</thead>
							<tbody>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">1a</td>
									<td class="styTableCellCtrInherit">
										2017 Section 965(a) Inclusion
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">1b</td>
									<td class="styTableCellCtrInherit">
										2017 Section 965(c) Deduction
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">2a</td>
									<td class="styTableCellCtrInherit">
										2018 Section 965(a) Inclusion
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">2b</td>
									<td class="styTableCellCtrInherit">
										2018 Section 965(c) Deduction
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">3a</td>
									<td class="styTableCellCtrInherit">
										&nbsp;
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">3b</td>
									<td class="styTableCellCtrInherit">
										&nbsp;
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Table 3, cols (g)-(l) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;padding:1.5mm 0mm 1.5mm 0mm;">
										<span style="font-weight:bold;">(g)</span><br />
										Portion Accounted for in <br /> Year 5
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(h)</span><br />
										Portion Accounted for in <br /> Year 6
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(i)</span><br />
										Portion Accounted for in <br /> Year 7
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(j)</span><br />
										Portion Accounted for in <br /> Year 8
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;vertical-align:top;padding-top:1.5mm;">
										<span style="font-weight:bold;">(k)</span><br />
										Amount Remaining to be <br />
										Accounted for
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top;border-right-width:0px;padding-top:1.5mm;">
										<span style="font-weight:bold;">(l)</span><br />
										Portion Accounted for in <br /> 
										in this Reporting Year
									</th>
								</tr>
							</thead>
							<tbody>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">1a</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">1b</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">2a</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">2b</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">3a</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:4mm;vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">3b</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="height:7mm;vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="5" style="padding-left:0.5mm;">
										<strong>Totals</strong>
										<span class="sty965BDotLn" style="margin-right:-10px;">.......................................&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>965-B</strong> (1-2019)</span>
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
						<xsl:for-each select="$ElectionInclusion2017">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="$ElectionInclusion2017/TransactionCd"/>
								<xsl:with-param name="Desc">Part I - Transaction Code row 1 (<xsl:value-of select="$ElectionInclusion2017/NetTaxLiabilityYr"/>)</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$ElectionInclusion2018">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="$ElectionInclusion2018/TransactionCd"/>
								<xsl:with-param name="Desc">Part I - Transaction Code row 2 (<xsl:value-of select="$ElectionInclusion2018/NetTaxLiabilityYr"/>)</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$ElectionOther">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="TransactionCd"/>
								<xsl:with-param name="Desc">Part I - Transaction Code row <xsl:number value="position() + 2"/> (<xsl:value-of select="NetTaxLiabilityYr"/>)</xsl:with-param>
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
			<td class="styTableCellCtrInherit" style="padding:0px;">
				<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:4mm;padding-top:0.2mm;">&nbsp;</div>
				<div style="width:50%;float:left;text-align:center;height:4mm;padding-top:0.2mm;">&nbsp;</div>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
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
			<td class="styTableCellCtrInherit" style="padding:0px;">
				<div style="width:50%;float:left;text-align:center;border-right:1px solid black;height:7mm;padding-top:0.2mm;">&nbsp;</div>
				<div style="width:50%;float:left;text-align:center;height:7mm;padding-top:0.2mm;">&nbsp;</div>
			</td>
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
