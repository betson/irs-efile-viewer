<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS4720Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS4720" />
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
				<meta name="Description" content="IRS Form 4720" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4720Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form4720">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:27mm;height:17.3mm;">
							Form <span class="styFN" style="font-size:18pt;">4720</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
							</xsl:call-template>
							<br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:136mm;height:17.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Return of Certain Excise Taxes Under Chapters <br /> 41 and 42 of the Internal Revenue Code
							</span><br />
							<span style="font-weight:bold;font-size:8pt;font-family:Arial Narrow;">
								(Sections 170(f)(10), 664(c)(2), 4911, 4912, 4941, 4942, 4943, 4944, 4945, 4955, 4958, 4959, 4960, 4965, 4966, 4967, and 4968)
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form4720</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:24mm;height:17.3mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0052</div>
							<div class="styTY">20<span class="styTYColor">20</span></div>
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:2px;padding-bottom:2px;border-top:2px solid black;border-bottom:1px solid black;">
						For calendar year 2020 or other tax year beginning 
						<span style="width:49mm;text-align:center;border-bottom:1px solid black;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						and ending 
						<span style="width:49mm;text-align:center;border-bottom:1px solid black;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:135mm;">
							<div class="sty4720HeaderCell" style="height:10.5mm;width:100%;border-left:none;">
								Name of organization, entity, or person subject to tax
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="sty4720HeaderCell" style="height:10mm;width:100%;border-left:none;">
								<span>Number, street, and room or suite no. (or P.O. box if mail is not delivered to street address)</span>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="sty4720HeaderCell" style="min-height:7mm;width:100%;border-bottom-width:0px;height:auto;border-left:none;">
								<span>City or town, state or province, country, and ZIP or foreign postal code</span>
								<br />
								<span style="display:inline;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:52mm;">
							<div class="styEINBox" style="width:100%;height:10.5mm;padding-left:1mm;font-weight:normal;border-bottom:1px solid black;border-left:1px solid black;font-size:inherit;">
								<strong>EIN or SSN</strong><br />
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"><xsl:with-param name="EINChanged" select="true()"/></xsl:call-template>
							</div>
							<div class="sty4720HeaderCell" style="width:100%;height:5mm;">
								<input type="checkbox" class="styCkboxNM" alt="Amended Return Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">IRS4720AmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Amended return
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								</xsl:call-template>
							</div>
							<div class="sty4720HeaderCell" style="width:100%;height:15mm;border-bottom:none;">
								Check box for type of annual return: <br />
								<input type="checkbox" class="styCkboxNM" alt="Form 990 return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990Ind"/>
										<xsl:with-param name="BackupName">IRS4720Form990Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								Form 990
								<input type="checkbox" class="styCkboxNM" alt="Form 990 EZ return" style="margin-left:7mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990EZInd"/>
										<xsl:with-param name="BackupName">IRS4720Form990EZInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Form 990-EZ
								<br />
								<input type="checkbox" class="styCkboxNM" alt="Form 990 PF return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990PFInd"/>
										<xsl:with-param name="BackupName">IRS4720Form990PFInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Form 990-PF
								<input type="checkbox" class="styCkboxNM" alt="Other return" style="margin-left:3mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
										<xsl:with-param name="BackupName">IRS4720OtherInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Other
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherReturnDesc"/>
									<xsl:with-param name="Desc">Header - Other Return Type Description</xsl:with-param>
								</xsl:call-template>
								<br />
								<input type="checkbox" class="styCkboxNM" alt="Form 5227 return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form5227Ind"/>
										<xsl:with-param name="BackupName">IRS4720Form5227Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								Form 5227
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:155mm;">&nbsp;</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
						<div class="styLNRightNumBox">N/A</div>
					</div>
					<!-- Line A -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">A</div>
						<div class="styLNDesc" style="width:155mm;">
							Is the organization a foreign private foundation within the meaning of section 4948(b)? 
							<span class="sty4720DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPrivateFoundationInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPrivateFoundationInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:155mm;height:4.4mm;padding-top:0px;">
							Show conversion rate to U.S. dollars. See instructions. &#9658;
							<span style="border-bottom:1px dashed black;width:80mm;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/ExchangeRateDesc"/>
									<xsl:with-param name="Desc">Line A - Exchange Rate Description</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Line B -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">B</div>
						<div class="styLNDesc" style="width:155mm;">
							Has corrective action been taken on any taxable event that resulted in Chapter 42 taxes being reported on this form?
							<span class="sty4720DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectiveActionTakenInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectiveActionTakenInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/NotApplicableInd"/>
							</xsl:call-template>
							<xsl:if test="$FormData/NotApplicableInd">N/A</xsl:if>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:179mm;height:auto;padding-top:0px;">
							If "Yes," attach a detailed description of the corrective action taken and, if applicable, enter the fair market value of any property <br />
							recovered as a result of the correction &#9658; $
							<span style="border-bottom:1px dashed black;width:34mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PropertyRecoveredFMVAmt"/>
								</xsl:call-template>
							</span> . 
							If "No," (that is, any uncorrected acts or transactions), attach <br /> an explanation (see instructions).
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Taxes on Organization 
							<span style="display:inline;font-weight:normal;">
								(Sections 170(f)(10), 664(c)(2), 4911(a), 4912(a), 4942(a), 4943(a), 4944(a)(1), <br />
								4945(a)(1), 4955(a)(1), 4959, 4960(a), 4965(a)(1), 4966(a)(1), and 4968(a))
							</span>
						</div>
					</div>
					<!-- Part 1, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Tax on undistributed income &mdash; Schedule B, line 4
							<span class="sty4720DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/TotUndistributedIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="">
							Tax on excess business holdings &mdash; Schedule C, line 7
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleC/TotExcessBusinessHoldingsTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="">
							Tax on investments that jeopardize charitable purpose &mdash; Schedule D, Part I, column (e)
							<span class="sty4720DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleD/TotInvstJrpdzChrtblPrpsTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="">
							Tax on taxable expenditures &mdash; Schedule E, Part I, column (g)
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleE/TotTaxableExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="">
							Tax on political expenditures &mdash; Schedule F, Part I, column (e)
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">5</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleF/TotPoliticalExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="">
							Tax on excess lobbying expenditures &mdash; Schedule G, line 4
							<span class="sty4720DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="">6</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleG/TotExcessLobbyingExpendTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="">
							Tax on disqualifying lobbying expenditures &mdash; Schedule H, Part I, column (e)
							<span class="sty4720DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="">7</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleH/TotDsqlfyLbbyngExpendTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="">
							Tax on premiums paid on personal benefit contracts
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="">8</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnOrganizationGrp/TotPersonalBnftCntrctPremTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="">
							Tax on being a party to prohibited tax shelter transactions &mdash; Schedule J, Part I, column (h)
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="">9</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleJ/TotProhibitedTaxShelterTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="">
							Tax on taxable distributions &mdash; Schedule K, Part I, column (f)
							<span class="sty4720DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="">10</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleK/TotTaxableDistributionsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="">
							Tax on a charitable remainder trust's unrelated business taxable income. Attach statement
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnOrganizationGrp/TotCharitableRemainderTrTaxAmt"/>
							</xsl:call-template>
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="">11</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnOrganizationGrp/TotCharitableRemainderTrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="">
							Tax on failure to meet the requirements of section 501(r)(3) &mdash; Schedule M, Part II, line 2
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="">12</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleM/TotHospitalFcltsFail501r3TxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="">
							Tax on excess executive compensation &mdash; Schedule N
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="">13</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleN/TotExcessExecutiveCompTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="">
							Tax on net investment income of private colleges and universities &mdash; Schedule O
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">14</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/TotNetInvestmentIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="">
							<strong>Total </strong> 
							(add lines 1-14)
							<span class="sty4720DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="">15</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnOrganizationGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="height:auto;">
							Taxes on a Manager, Self-Dealer, Disqualified Person, Donor, Donor Advisor, or Related Person <br />
							<span style="display:inline;font-weight:normal;">
								(Sections 4912(b), 4941(a), 4944(a)(2), 4945(a)(2), 4955(a)(2), 4958(a), 4965(a)(2), 4966(a)(2), and 4967(a))
							</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="min-height:8mm;height:auto;width:146.2mm;border-left:none;border-bottom:none;border-right-width:1px;">
							<span style="font-family:Arial;">
								Name and address of related organization; city or town, state or province, country, ZIP or foreign postal code
							</span>
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/RelatedOrganizationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/RelatedOrganizationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/RelatedOrganizationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/USAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/USAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/ForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/ForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</div>
						<div class="sty4720HeaderCell" style="width:40.5mm;border:none;">
							<span style="font-family:Arial;">
								Employer identification number
							</span><br />
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/EIN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Tax on self-dealing &mdash; Schedule A, Part II, column (d); and Part III, column (d)
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotSelfDealingTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="">
							Tax on investments that jeopardize charitable purposes &mdash; Schedule D, Part II, column (d)
							<span class="sty4720DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotInvstJrpdzChrtblPrpsTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="">
							Tax on taxable expenditures &mdash; Schedule E, Part II, column (d)
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotTaxableExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="">
							Tax on political expenditures &mdash; Schedule F, Part II, column (d)
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotPoliticalExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="">
							Tax on disqualifying lobbying expenditures &mdash; Schedule H, Part II, column (d)
							<span class="sty4720DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="">5</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotDsqlfyLbbyngExpendTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="">
							Tax on excess benefit transactions &mdash; Schedule I, Part II, column (d); and Part III, column (d)
							<span class="sty4720DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="">6</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotExcessBenefitTransactionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="">
							Tax on being a party to prohibited tax shelter transactions &mdash; Schedule J, Part II, column (d)
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="">7</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotProhibitedTaxShelterTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="">
							Tax on taxable distributions &mdash; Schedule K, Part II, column (d)
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">8</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotTaxableDistributionsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="">
							Tax on prohibited benefits &mdash; Schedule L, Part II, column (d); and Part III, column (d)
							<span class="sty4720DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="">9</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotProhibitedBenefitsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<strong>Total </strong>&mdash; Add lines 1 through 9
							<span class="sty4720DotLn">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">10</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Tax Payments
						</div>
					</div>
					<!-- Part 3, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Total tax (Part I, line 15 or Part II, line 10)
							<span class="sty4720DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:choose>
								<xsl:when test="$FormData/TaxOnOrganizationGrp">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnOrganizationGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TxsMgrSelfDealerDnrRltdPrsnGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 3, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Total payments including amount paid with Form 8868 (see instructions)
							<span class="sty4720DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<strong>Tax due. </strong> If line 1 is larger than line 2, enter amount owed (see instructions)
							<span class="sty4720DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<strong>Overpayment. </strong> If line 1 is smaller than line 2, enter the difference. This is your refund
							<span class="sty4720DotLn">.......</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:10mm;">Cat. No. 13021D</span>
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Sch A -->
					<div class="sty4720ScheduleHead">
						SCHEDULE A &mdash; Initial Taxes on Self-Dealing <span style="font-weight:normal;">(Section 4941)</span>
					</div>
					<!-- Sch A, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Acts of Self-Dealing and Tax Computation
						</div>
					</div>
					<!-- Table 1, cols (a)-(c) -->
					<xsl:variable name="shouldSeparateSAP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchAPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Act <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(b)</strong>
										Date <br /> of act
									</th>
									<th class="styTableCellHeader" scope="col" style="width:150mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> Description of act
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSAP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ActNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ActDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ActDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSAP1 or count($FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable3ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSAP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch A Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchAPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(d)</strong> 
										Question number from Form <br /> 990-PF, 
										Part VII-B, or Form 5227, <br /> Part VI-B, 
										applicable to the act
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(e)</strong>	Amount involved in act
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(f)</strong>	Initial tax on self-dealer <br />
										(10% of col. (e))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Tax on foundation managers <br />(if 
										applicable) (lesser of <br />$20,000 or 5% of col. (e))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSAP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Form990PFOr5227LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ActAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSAP1 or count($FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSAP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch A, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Self-Dealers and Proration of Payments
						</div>
					</div>
					<!-- Sch A, Part 2 table -->
					<xsl:variable name="shouldSeparateSAP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleA/SummarySelfDealerTaxLiabGrp) &gt; 4)"/>
					<div class="styStdDiv" style="" id="SchAPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of self-dealers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Act no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Self-dealer's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSAP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleA/SummarySelfDealerTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortSelfDlrAmtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortSelfDlrAmtGrp[1]/ActNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortSelfDlrAmtGrp[1]/TaxImposedOrProratedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SumTxOrPrortSelfDlrAmtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ActNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSAP2 or count($FormData/IRS4720ScheduleA/SummarySelfDealerTaxLiabGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleA/SummarySelfDealerTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSAP2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch A, Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Foundation Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch A, Part 3 table -->
					<xsl:variable name="shouldSeparateSAP3" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleA/SumSelfDlngFndtnMgrTaxLiabGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchAPart3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Act no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (g), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSAP3)">
									<xsl:for-each select="$FormData/IRS4720ScheduleA/SumSelfDlngFndtnMgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortnFndtnMgrAmtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortnFndtnMgrAmtGrp[1]/ActNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortnFndtnMgrAmtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SumTxOrPrortnFndtnMgrAmtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ActNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSAP3 or count($FormData/IRS4720ScheduleA/SumSelfDlngFndtnMgrTaxLiabGrp) &lt; 3">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleA/SumSelfDlngFndtnMgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSAP3"/>
										<xsl:with-param name="MaxLine" select="3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="sty4720ScheduleHead">
						SCHEDULE B &mdash; Initial Tax on Undistributed Income <span style="font-weight:normal;">(Section 4942)</span>
					</div>
					<!-- Sch B, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Undistributed income for years before 2019 (from Form 990-PF for 2020, Part XIII, line 6d)
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/Taxable1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch B, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="">
							Undistributed income for 2019 (from Form 990-PF for 2020, Part XIII, line 6e)
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/Taxable2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch B, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							Total undistributed income at end of current tax year beginning in 2020 and subject to tax under <br /> 
							section 4942 (add lines 1 and 2)
							<span class="sty4720DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />3</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/TotalUndistributedIncomeCYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/TotalUndistributedIncomeCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch B, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<strong>Tax &mdash; </strong>Enter 30% of line 3 here and on Part I, line 1
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleB/TotUndistributedIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<!-- Sch C -->
					<xsl:for-each select="$FormData/IRS4720ScheduleC">
						<div class="sty4720ScheduleHead">
							SCHEDULE C &mdash; Initial Tax on Excess Business Holdings <span style="font-weight:normal;">(Section 4943)</span>
						</div>
						
						<div class="sty4720ScheduleHead" style="text-align:left;">
							Business Holdings and Computation of Tax
						</div>
						<div class="sty4720ScheduleHead" style="text-align:left;font-weight:normal;">
							If you have taxable excess holdings in more than one business enterprise, attach a separate schedule for each enterprise. 
							Refer to the instructions for each line item before making any entries.
						</div>
						<div class="styStdDiv" style="min-height:10mm;padding:0.5mm;">
							Name and address of business enterprise<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessEnterpriseName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="BusinessEnterpriseName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessEnterpriseName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<br />
							<xsl:choose>
								<xsl:when test="ForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="ForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="USAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styStdDiv" style="padding-top:3.5mm;padding-bottom:0.5mm;border-top:1px solid black;">
							<div class="styGenericDiv" style="width:124mm;">
								Employer identification number
								<span class="sty4720DotLn">...................&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:62mm;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="EIN"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv" style="padding-top:3.5mm;padding-bottom:0.5mm;border-top:1px solid black;">
							<div class="styGenericDiv" style="width:124mm;">
								Form of enterprise (corporation, partnership, trust, joint venture, sole proprietorship, etc.)
								<span class="sty4720DotLn">&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:62mm;text-align:left;padding-left:0.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="EnterpriseTypeDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- column headers -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:13mm;border-left:none;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(a)</strong> <br />
								Voting stock <br /> (profits interest or <br /> beneficial interest)
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(b)</strong> <br />
								Value
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(c)</strong> <br />
								Nonvoting stock <br /> (capital interest)
							</div>
						</div>
						<!-- Sch C, Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">1</div>
							<div class="styLNDesc" style="width:82mm;">
								Foundation holdings in business enterprise 
								<span class="sty4720DotLn">......</span>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="FoundationHoldingsBusEntrprGrp/VotingStockPct"/>
								</xsl:call-template>
								<xsl:if test="not(FoundationHoldingsBusEntrprGrp/VotingStockPct)">%</xsl:if>
							</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="FoundationHoldingsBusEntrprGrp/ValuePct"/>
								</xsl:call-template>
								<xsl:if test="not(FoundationHoldingsBusEntrprGrp/ValuePct)">%</xsl:if>
							</div>
							<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">2</div>
							<div class="styLNDesc" style="width:82mm;">
								Permitted holdings in business enterprise 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="PermittedHoldingsBusEntrprGrp"/>
								</xsl:call-template>
								<span class="sty4720DotLn">......</span>
							</div>
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="PermittedHoldingsBusEntrprGrp/VotingStockPct"/>
								</xsl:call-template>
								<xsl:if test="not(PermittedHoldingsBusEntrprGrp/VotingStockPct)">%</xsl:if>
							</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="PermittedHoldingsBusEntrprGrp/ValuePct"/>
								</xsl:call-template>
								<xsl:if test="not(PermittedHoldingsBusEntrprGrp/ValuePct)">%</xsl:if>
							</div>
							<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">3</div>
							<div class="styLNDesc" style="width:82mm;">
								Value of excess holdings in business enterprise
								<span class="sty4720DotLn">.....</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsBusEntrprGrp/VotingStockAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsBusEntrprGrp/ValueAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsBusEntrprGrp/NonvotingStockAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch C, Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">4</div>
							<div class="styLNDesc" style="width:82mm;height:10mm;">
								Value of excess holdings disposed of within 90 days; or, <br />
								other value of excess holdings not subject to section <br /> 4943 tax (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsDisposedGrp"/>
								</xsl:call-template>
								<span class="sty4720DotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;"><br /><br />4</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;padding-right:0.5mm;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsDisposedGrp/VotingStockAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;padding-right:0.5mm;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsDisposedGrp/ValueAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ExcessHoldingsDisposedGrp/NonvotingStockAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch C, Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">5</div>
							<div class="styLNDesc" style="width:82mm;height:7mm;">
								Taxable excess holdings in business enterprise &ndash; <br /> line 3 minus line 4
								<span class="sty4720DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-right:0.5mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TaxableExHoldingsBusEntrprGrp/VotingStockAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-right:0.5mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TaxableExHoldingsBusEntrprGrp/ValueAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TaxableExHoldingsBusEntrprGrp/NonvotingStockAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch C, Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">6</div>
							<div class="styLNDesc" style="width:82mm;">
								<strong>Tax &mdash; </strong> Enter 10% of line 5
								<span class="sty4720DotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="InitialTaxExHoldingsBusGrp/VotingStockAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="InitialTaxExHoldingsBusGrp/ValueAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="InitialTaxExHoldingsBusGrp/NonvotingStockAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Sch C, Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">7</div>
							<div class="styLNDesc" style="width:82mm;height:7mm;">
								<strong>Total tax &mdash; </strong> Add amounts on line 6, columns (a), (b), and (c); 
								enter total here and on Part I, line 2
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="TotExcessBusinessHoldingsTxAmt"/>
								</xsl:call-template>
								<span class="sty4720DotLn">.......</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />7</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;padding-right:0.5mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotExcessBusinessHoldingsTxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;background-color:lightgrey;">&nbsp;</div>
						</div>
					</xsl:for-each>
					<xsl:if test="not($FormData/IRS4720ScheduleC)">
						<!-- Sch C -->
						<div class="sty4720ScheduleHead">
							SCHEDULE C &mdash; Initial Tax on Excess Business Holdings <span style="font-weight:normal;">(Section 4943)</span>
						</div>
						<div class="sty4720ScheduleHead" style="text-align:left;">
							Business Holdings and Computation of Tax
						</div>
						<div class="sty4720ScheduleHead" style="text-align:left;font-weight:normal;">
							If you have taxable excess holdings in more than one business enterprise, attach a separate schedule for each enterprise. 
							Refer to the instructions for each line item before making any entries.
						</div>
						<div class="styStdDiv" style="min-height:10mm;padding:0.5mm;">
							Name and address of business enterprise<br />&nbsp;</div>
						<div class="styStdDiv" style="padding-top:3.5mm;padding-bottom:0.5mm;border-top:1px solid black;">
							<div class="styGenericDiv" style="width:124mm;">
								Employer identification number
								<span class="sty4720DotLn">...................&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:62mm;text-align:center;">&nbsp;</div>
						</div>
						<div class="styStdDiv" style="padding-top:3.5mm;padding-bottom:0.5mm;border-top:1px solid black;">
							<div class="styGenericDiv" style="width:124mm;">
								Form of enterprise (corporation, partnership, trust, joint venture, sole proprietorship, etc.)
								<span class="sty4720DotLn">&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:62mm;text-align:left;padding-left:0.5mm;">&nbsp;</div>
						</div>
						<!-- column headers -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:13mm;border-left:none;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(a)</strong> <br />
								Voting stock <br /> (profits interest or <br /> beneficial interest)
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(b)</strong> <br />
								Value
							</div>
							<div class="styLNAmountBox" style="width:30mm;height:13mm;text-align:center;">
								<strong>(c)</strong> <br />
								Nonvoting stock <br /> (capital interest)
							</div>
						</div>
						<!-- Sch C, Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">1</div>
							<div class="styLNDesc" style="width:82mm;">
								Foundation holdings in business enterprise 
								<span class="sty4720DotLn">......</span>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">%</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">%</div>
							<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">2</div>
							<div class="styLNDesc" style="width:82mm;">
								Permitted holdings in business enterprise 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="PermittedHoldingsBusEntrprGrp"/>
								</xsl:call-template>
								<span class="sty4720DotLn">......</span>
							</div>
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">%</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">%</div>
							<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">3</div>
							<div class="styLNDesc" style="width:82mm;">
								Value of excess holdings in business enterprise
								<span class="sty4720DotLn">.....</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">4</div>
							<div class="styLNDesc" style="width:82mm;height:10mm;">
								Value of excess holdings disposed of within 90 days; or, <br />
								other value of excess holdings not subject to section <br /> 4943 tax (attach statement)
								<span class="sty4720DotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;"><br /><br />4</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:10mm;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">5</div>
							<div class="styLNDesc" style="width:82mm;height:7mm;">
								Taxable excess holdings in business enterprise &ndash; <br /> line 3 minus line 4
								<span class="sty4720DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;height:7mm;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:82mm;">&nbsp;</div>
							<div class="styLNRightNumBoxNBB">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">6</div>
							<div class="styLNDesc" style="width:82mm;">
								<strong>Tax &mdash; </strong> Enter 10% of line 5
								<span class="sty4720DotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="width:30mm;">&nbsp;</div>
						</div>
						<!-- Sch C, Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="width:7mm;">7</div>
							<div class="styLNDesc" style="width:82mm;height:7mm;">
								<strong>Total tax &mdash; </strong> Add amounts on line 6, columns (a), (b), and (c); 
								enter total here and on Part I, line 2
								<span class="sty4720DotLn">.......</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />7</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:30mm;height:7mm;background-color:lightgrey;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Sch D -->
					<div class="sty4720ScheduleHead">
						SCHEDULE D &mdash; Initial Taxes on Investments That Jeopardize Charitable Purpose <span style="font-weight:normal;">(Section 4944)</span>
					</div>
					<!-- Sch D, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Investments and Tax Computation
						</div>
					</div>
					<!-- Table 1, cols (a)-(f) -->
					<xsl:variable name="shouldSeparateSDP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleD/InvestmentsTaxComputationGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchDPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Investment <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of<br /> investment
									</th>
									<th class="styTableCellHeader" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of investment
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong>
										Amount of <br /> investment
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Initial tax on foundation (10% <br /> of col. (d))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Initial tax on foundation managers (if applicable) &mdash; <br />(lesser of $10,000 or 10% of col. (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSDP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleD/InvestmentsTaxComputationGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvestmentNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="InvestmentDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvestmentDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvestmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSDP1 or count($FormData/IRS4720ScheduleD/InvestmentsTaxComputationGrp) &lt; 5">
									<xsl:call-template name="FillTable6ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleD/InvestmentsTaxComputationGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSDP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:126.8mm;height:4mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (e). Enter here and on Part I, line 3
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;height:4mm;text-align:right;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleD/TotInvstJrpdzChrtblPrpsTxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;height:4mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:156.8mm;height:4mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (f). Enter total (or prorated amount) here and in Part II, column (c), below
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;height:4mm;text-align:right;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleD/TotTaxImposedManagerPrortAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch D, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Foundation Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch D, Part 2 table -->
					<xsl:variable name="shouldSeparateSDP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleD/InvstSumFndtnMgrTaxLiabGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchDPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Investment no. from Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSDP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleD/InvstSumFndtnMgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./InvstSumTxPrortFndtnMgrAmtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InvstSumTxPrortFndtnMgrAmtGrp[1]/InvestmentNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvstSumTxPrortFndtnMgrAmtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="InvstSumTxPrortFndtnMgrAmtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="InvestmentNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSDP2 or count($FormData/IRS4720ScheduleD/InvstSumFndtnMgrTaxLiabGrp) &lt; 3">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleD/InvstSumFndtnMgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSDP2"/>
										<xsl:with-param name="MaxLine" select="3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<!-- Sch E -->
					<div class="sty4720ScheduleHead">
						SCHEDULE E &mdash; Initial Taxes on Taxable Expenditures <span style="font-weight:normal;">(Section 4945)</span>
					</div>
					<!-- Sch E, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Expenditures and Computation of Tax
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSEP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchEPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
										<strong>(b)</strong>
										Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styTableCellHeader" scope="col" style="width:58mm;font-weight:normal;">
										<strong>(d)</strong>
										Name and address of recipient
									</th>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Description of expenditure and purposes <br /> for which made
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSEP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RecipientNm"/>
												</xsl:call-template><br />
												<xsl:choose>
													<xsl:when test="RecipientForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExpenditureDescPurposeTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSEP1 or count($FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp) &lt; 5">
									<xsl:call-template name="FillTable5ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSEP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch E Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchEPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:59mm;font-weight:normal;">
										<strong>(f)</strong> 
										Question number from Form 990-PF, <br />
										Part VII-B, or Form 5227, Part VI-B, <br /> 
										applicable to the expenditure
									</th>
									<th class="styTableCellHeader" scope="col" style="width:64mm;font-weight:normal;">
										<strong>(g)</strong>	Initial tax imposed on foundation <br />
										(20% of col. (b))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:64mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong> Initial tax imposed on foundation <br /> managers (if 
										applicable) &mdash; (lesser of <br /> $10,000 or 5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSEP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Form990PFOr5227LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSEP1 or count($FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp) &lt; 5">
									<xsl:call-template name="FillTable3Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSEP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:58.8mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (g). Enter here and on <br /> Part I, line 4
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="sty4720HeaderCell" style="width:64mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleE/TotTaxableExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4720HeaderCell" style="width:64mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:122.8mm;border-left:none;"><br />
							<strong>Total &mdash;</strong> Column (h). Enter total (or prorated amount) here and in Part II, column (c), below
							<span class="sty4720DotLn" style="padding-right:0px;">.</span>
						</div>
						<div class="sty4720HeaderCell" style="width:64mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleE/TotTaxImposedManagerPrortAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch E, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Foundation Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch E, Part 2 table -->
					<xsl:variable name="shouldSeparateSEP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleE/SummaryFndtnMgrTaxLiabGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchEPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (h), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSEP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleE/SummaryFndtnMgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSEP2 or count($FormData/IRS4720ScheduleE/SummaryFndtnMgrTaxLiabGrp) &lt; 3">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleE/SummaryFndtnMgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSEP2"/>
										<xsl:with-param name="MaxLine" select="3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch F -->
					<div class="sty4720ScheduleHead">
						SCHEDULE F &mdash; Initial Taxes on Political Expenditures <span style="font-weight:normal;">(Section 4955)</span>
					</div>
					<!-- Sch F, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Expenditures and Computation of Tax
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSFP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleF/PltclExpendituresCmptTaxGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchFPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(b)</strong>
										Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styTableCellHeader" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(d)</strong>
										Description of political expenditure
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Initial tax imposed on organization or foundation <br /> (10% of col. (b))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Initial tax imposed on managers (if <br /> applicable) (lesser <br /> of  $5,000 or <br /> 2.5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSFP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleF/PltclExpendituresCmptTaxGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExpenditureDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSFP1 or count($FormData/IRS4720ScheduleF/PltclExpendituresCmptTaxGrp) &lt; 5">
									<xsl:call-template name="FillTable6ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleF/PltclExpendituresCmptTaxGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSFP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:126.8mm;border-left:none;">
							<br />
							<strong>Total &mdash;</strong> Column (e). Enter here and on Part I, line 5
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleF/TotPoliticalExpenditureTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:156.8mm;border-left:none;"><br />
							<strong>Total &mdash;</strong> Column (f). Enter total (or prorated amount) here and in Part II, column (c), below
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleF/TotTaxImposedManagerPrortAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch F, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Foundation Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch F, Part 2 table -->
					<xsl:variable name="shouldSeparateSFP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleF/SummaryOrgFndtnMgrTaxLiabGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchFPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of organization managers or <Br /> foundation managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSFP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleF/SummaryOrgFndtnMgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSFP2 or count($FormData/IRS4720ScheduleF/SummaryOrgFndtnMgrTaxLiabGrp) &lt; 3">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleF/SummaryOrgFndtnMgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSFP2"/>
										<xsl:with-param name="MaxLine" select="3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>5</strong></div>
					</div>
					<!-- Sch G -->
					<div class="sty4720ScheduleHead">
						SCHEDULE G &mdash; Tax on Excess Lobbying Expenditures <span style="font-weight:normal;">(Section 4911)</span>
					</div>
					<!-- Sch G, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Excess of grass roots expenditures over grass roots nontaxable amount (from Schedule C (Form 990 or <br />
							990-EZ), Part II-A, column (b), line 1h). (See the instructions before making an entry.)
							<span class="sty4720DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleG/ExLbbyngGrassrootMnsNonTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch G, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							Excess of lobbying expenditures over lobbying nontaxable amount (from Schedule C (Form 990 or 990-EZ), <br />
							Part II-A, column (b), line 1i). (See the instructions before making an entry.)
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleG/ExLbbyExpendMnsLbbyngNonTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch G, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							Excess lobbying expenditures &mdash; enter the larger of line 1 or line 2
							<span class="sty4720DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleG/ExcessLobbyingExpenditureAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch G, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<strong>Tax &mdash; </strong>Enter 25% of line 3 here and on Part I, line 6
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleG/TotExcessLobbyingExpendTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch H -->
					<div class="sty4720ScheduleHead">
						SCHEDULE H &mdash; Taxes on Disqualifying Lobbying Expenditures <span style="font-weight:normal;">(Section 4912)</span>
					</div>
					<!-- Sch H, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Expenditures and Computation of Tax
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSHP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleH/DsqlfyLbbyngExpendCmptTaxGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchHPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(b)</strong>
										Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styTableCellHeader" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(d)</strong>
										Description of lobbying expenditures
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Tax imposed on organization <br /> (5% of col. (b))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Tax imposed on organization managers (if applicable) &mdash; <br />(5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSHP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleH/DsqlfyLbbyngExpendCmptTaxGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExpenditureDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSHP1 or count($FormData/IRS4720ScheduleH/DsqlfyLbbyngExpendCmptTaxGrp) &lt; 5">
									<xsl:call-template name="FillTable6ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleH/DsqlfyLbbyngExpendCmptTaxGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSHP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:126.8mm;border-left:none;">
							<br />
							<strong>Total &mdash;</strong> Column (e). Enter here and on Part I, line 7
							<span class="sty4720DotLn">..............</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleH/TotDsqlfyLbbyngExpendTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:156.8mm;border-left:none;"><br />
							<strong>Total &mdash;</strong> Column (f). Enter total (or prorated amount) here and in Part II, column (c), below
							<span class="sty4720DotLn">.........</span>
						</div>
						<div class="sty4720HeaderCell" style="width:30mm;text-align:right;padding-right:2px;">
							<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleH/TotTaxImposedManagerPrortAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch H, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Organization Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch H, Part 2 table -->
					<xsl:variable name="shouldSeparateSHP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleH/SummaryOrgMgrTaxLiabGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchHPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of organization managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSHP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleH/SummaryOrgMgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSHP2 or count($FormData/IRS4720ScheduleH/SummaryOrgMgrTaxLiabGrp) &lt; 3">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleH/SummaryOrgMgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSHP2"/>
										<xsl:with-param name="MaxLine" select="3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch I -->
					<div class="sty4720ScheduleHead">
						SCHEDULE I &mdash; Initial Taxes on Excess Benefit Transactions <span style="font-weight:normal;">(Section 4958)</span>
					</div>
					<!-- Sch I, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Excess Benefit Transactions and Tax Computation
						</div>
					</div>
					<!-- Table 1, cols (a)-(c) -->
					<xsl:variable name="shouldSeparateSIP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchIPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Transaction <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of transaction
									</th>
									<th class="styTableCellHeader" scope="col" style="width:150mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> Description of transaction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSIP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TransactionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSIP1 or count($FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable3ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSIP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch I Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchAPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(d)</strong>	Amount of excess benefit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(e)</strong>	Initial tax on disqualified persons <br />
										(25% of col. (d))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:63mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Tax on organization managers <br />(if 
										applicable) (lesser of <br /> $20,000 or 10% of col. (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSIP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessBenefitAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSIP1 or count($FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable3Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSIP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 6 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>6</strong></div>
					</div>
					<!-- Sch I continued -->
					<div class="sty4720ScheduleHead">
						SCHEDULE I &mdash; Initial Taxes on Excess Benefit Transactions <span style="font-weight:normal;">(Section 4958) 
						<span style="font-style:italic;"> Continued</span></span>
					</div>
					<!-- Sch I, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Disqualified Persons and Proration of Payments
						</div>
					</div>
					<!-- Sch I, Part 2 table -->
					<xsl:variable name="shouldSeparateSIP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleI/SummaryDsqlfyPrsnTaxLiabGrp) &gt; 4)"/>
					<div class="styStdDiv" style="" id="SchIPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of disqualified persons liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Trans. no. from Part I, <br /> col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (e), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Disqualified person's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSIP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleI/SummaryDsqlfyPrsnTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxLiabDsqlfyPrsnPrortnGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SumTxLiabDsqlfyPrsnPrortnGrp[1]/TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumTxLiabDsqlfyPrsnPrortnGrp[1]/TaxImposedOrProratedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SumTxLiabDsqlfyPrsnPrortnGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransactionNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSIP2 or count($FormData/IRS4720ScheduleI/SummaryDsqlfyPrsnTaxLiabGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleI/SummaryDsqlfyPrsnTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSIP2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch I, Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:9pt;">
							Summary of Tax Liability of 501(c)(3), (c)(4), &amp; (c)(29) Organization Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch I, Part 3 table -->
					<xsl:variable name="shouldSeparateSIP3" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleI/Summary501c3429MgrTaxLiabGrp) &gt; 4)"/>
					<div class="styStdDiv" style="" id="SchIPart3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of 501(c)(3), (c)(4), &amp; (c)(29) organization managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Trans. no. from Part I, <br /> col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax liability <br /> 
										 (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSIP3)">
									<xsl:for-each select="$FormData/IRS4720ScheduleI/Summary501c3429MgrTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxLiab501c3c4c29MgrPrortGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SumTxLiab501c3c4c29MgrPrortGrp[1]/TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumTxLiab501c3c4c29MgrPrortGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SumTxLiab501c3c4c29MgrPrortGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransactionNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSIP3 or count($FormData/IRS4720ScheduleI/Summary501c3429MgrTaxLiabGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleI/Summary501c3429MgrTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSIP3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch J -->
					<div class="sty4720ScheduleHead">
						SCHEDULE J &mdash; Taxes on Being a Party to Prohibited Tax Shelter Transactions <span style="font-weight:normal;">(Section 4965)</span>
					</div>
					<!-- Sch J, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Prohibited Tax Shelter Transactions (PTST) and Tax Imposed on the Tax-Exempt Entity <br />
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSJP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchJPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> Transaction <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong>
										Transaction date
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(c)</strong>
										Type of transaction <br />
										<span style="text-align:left;width:40mm;">
											<strong>1 </strong> &ndash;Listed<br />
											<strong>2 </strong> &ndash;Subsequently listed<br />
											<strong>3 </strong> &ndash;Confidential<br />
											<strong>4 </strong> &ndash;Contractual protection
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:97mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Description of transaction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSJP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<br />
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TransactionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ProhibitedTaxShelterTransCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ProhibitedTaxShelterTransDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSJP1 or count($FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp) &lt; 5">
									<xsl:call-template name="FillTable4ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSJP1"/>
										<xsl:with-param name="TwoLine" select="true()"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch J Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchJPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(e)</strong> 
										Did the tax-exempt entity know or have reason to know this transaction 
										was a PTST when it became a party to the transaction? 
										Answer <strong>Yes</strong> or <strong>No</strong>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(f)</strong> Net income attributable to <br /> the PTST
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(g)</strong>	 75% of proceeds attributable to <br /> the PTST
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong> Tax imposed on the tax-exempt <br /> entity (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSJP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="KnownPTSTTransInd/text() = '1' or KnownPTSTTransInd/text() = 'true'">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="KnownPTSTTransInd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="KnownPTSTTransInd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetIncomeAttributablePTSTAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Proceeds75PctAttrblPTSTAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSJP1 or count($FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp) &lt; 5">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSJP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="width:140mm;height:4mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (h). Enter here and on Part I, line 9
							<span class="sty4720DotLn" style="padding-right:0px;">.................</span>
						</div>
						<div class="sty4720HeaderCell" style="width:47mm;height:4mm;text-align:right;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleJ/TotProhibitedTaxShelterTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 7 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>7</strong></div>
					</div>
					<!-- Sch J, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Tax Imposed on Entity Managers <span style="font-weight:normal;">(Section 4965) <span style="font-style:italic;">Continued</span></span>
						</div>
					</div>
					<!-- Sch J, Part 2 table -->
					<xsl:variable name="shouldSeparateSJP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleJ/TaxImposedEntityManagerGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchJPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Name of entity manager
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Transaction <br /> number from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax &mdash; enter $20,000 for <br /> each  
										transaction listed in <br /> col. (b) for each  
										manager in col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSJP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleJ/TaxImposedEntityManagerGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./TaxLiabImposedEntityManagerGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxLiabImposedEntityManagerGrp[1]/TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxLiabImposedEntityManagerGrp[1]/TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="TaxLiabImposedEntityManagerGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransactionNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSJP2 or count($FormData/IRS4720ScheduleJ/TaxImposedEntityManagerGrp) &lt; 5">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleJ/TaxImposedEntityManagerGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSJP2"/>
										<xsl:with-param name="MaxLine" select="5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch K -->
					<div class="sty4720ScheduleHead">
						SCHEDULE K &mdash; Taxes on Taxable Distributions of Sponsoring Organizations Maintaining Donor <br />
						Advised Funds <span style="font-weight:normal;">(Section 4966). See the instructions.</span>
					</div>
					<!-- Sch K, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Taxable Distributions and Tax Computation
						</div>
					</div>
					<!-- Table 1, cols (a)-(c) -->
					<xsl:variable name="shouldSeparateSKP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchKPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:86mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of sponsoring organization and <br />
										donor advised fund
									</th>
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> Description of distribution
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSKP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SponsoringOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="SponsoringOrganizationName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SponsoringOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<span style="width:100%;height:1mm;border-top:1px dashed black;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonorAdvisedFundPersonNm"/>
												</xsl:call-template>
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonorAdvisedFundBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DonorAdvisedFundBusinessName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DonorAdvisedFundBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributionDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSKP1 or count($FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp) &lt; 4">
									<xsl:call-template name="FillTable3ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSKP1"/>
										<xsl:with-param name="MaxLine" select="4"/>
										<xsl:with-param name="TwoLine" select="true()"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch K Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchKPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(d)</strong> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(e)</strong> Amount of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(f)</strong> Tax imposed on <br /> organization (20% of col. (e))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Tax on fund managers <br /> (lesser of 5% of col. (e) or $10,000)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSKP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSKP1 or count($FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSKP1"/>
										<xsl:with-param name="MaxLine" select="4"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="height:4mm;width:92.9mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (f). Enter here and on Part I, line 10
							<span class="sty4720DotLn">.....</span>
						</div>
						<div class="sty4720HeaderCell" style="height:4mm;width:47mm;text-align:right;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleK/TotTaxableDistributionsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4720HeaderCell" style="height:4mm;width:47mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="sty4720HeaderCell" style="height:4mm;width:139.9mm;border-left:none;">
							<strong>Total &mdash;</strong> Column (g). Enter total (or prorated amount) here and in Part II, column (c), below
							<span class="sty4720DotLn">....</span>
						</div>
						<div class="sty4720HeaderCell" style="height:4mm;width:47mm;text-align:right;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleK/TotTaxImposedManagerPrortAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch K, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Fund Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch K, Part 2 table -->
					<xsl:variable name="shouldSeparateSKP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleK/SumTxLiabFundMgrPrortnPymtGrp) &gt; 3)"/>
					<div class="styStdDiv" style="" id="SchKPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of fund managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (g), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSKP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleK/SumTxLiabFundMgrPrortnPymtGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSKP2 or count($FormData/IRS4720ScheduleK/SumTxLiabFundMgrPrortnPymtGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleK/SumTxLiabFundMgrPrortnPymtGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSKP2"/>
										<xsl:with-param name="MaxLine" select="4"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 8 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>8</strong></div>
					</div>
					<!-- Sch L -->
					<div class="sty4720ScheduleHead">
						SCHEDULE L &mdash; Taxes on Prohibitied Benefits Distributed From Donor Advised Funds <span style="font-weight:normal;">(Section 4967).</span><br />
						<span style="font-weight:normal;">See the instructions.</span>
					</div>
					<!-- Sch L, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Prohibited Benefits and Tax Computation
						</div>
					</div>
					<!-- Table 1, cols (a)-(c) -->
					<xsl:variable name="shouldSeparateSLP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchLPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of <br /> prohibited benefit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:145mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> Description of benefit
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSLP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp">
										<tr style="height:8mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ProhibitedBenefitDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BenefitDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSLP1 or count($FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable3ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSLP1"/>
										<xsl:with-param name="MaxLine" select="5"/>
										<xsl:with-param name="TwoLine" select="true()"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch L Part 1 Table 2 -->
					<div class="styStdDiv" style="" id="SchLPart1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(d)</strong>	Amount of prohibited benefit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(e)</strong>	Tax on donors, donor advisors, or related persons 
										(125% of col. (d)) (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:63mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Tax on fund managers (if applicable) 
										(lesser of 10% of col. (d) or $10,000) (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSLP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProhibitedBenefitAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSLP1 or count($FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp) &lt; 5">
									<xsl:call-template name="FillTable3Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSLP1"/>
										<xsl:with-param name="MaxLine" select="5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch L, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Summary of Tax Liability of Donors, Donor Advisors, Related Persons, and Proration of Payments
						</div>
					</div>
					<!-- Sch L, Part 2 table -->
					<xsl:variable name="shouldSeparateSLP2" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleL/DnrAdvisorRltdPrsnTaxLiabGrp) &gt; 4)"/>
					<div class="styStdDiv" style="" id="SchLPart2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of donors, donor advisors, or related persons liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (e), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Donor's, donor advisor's or related person's total tax liability 
										(add amounts in col. (c)) (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSLP2)">
									<xsl:for-each select="$FormData/IRS4720ScheduleL/DnrAdvisorRltdPrsnTaxLiabGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortDnrAdvisorRltdGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortDnrAdvisorRltdGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SumTxOrPrortDnrAdvisorRltdGrp[1]/TaxImposedOrProratedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SumTxOrPrortDnrAdvisorRltdGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSLP2 or count($FormData/IRS4720ScheduleL/DnrAdvisorRltdPrsnTaxLiabGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleL/DnrAdvisorRltdPrsnTaxLiabGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSLP2"/>
										<xsl:with-param name="MaxLine" select="4"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch L, Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:9pt;">
							Summary of Tax Liability of Fund Managers and Proration of Payments
						</div>
					</div>
					<!-- Sch L, Part 3 table -->
					<xsl:variable name="shouldSeparateSLP3" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleL/SumTxLiabFundMgrPrortnPymtGrp) &gt; 4)"/>
					<div class="styStdDiv" style="" id="SchLPart3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of fund managers liable for tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Fund Manager's total tax liability <br /> 
										 (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSLP3)">
									<xsl:for-each select="$FormData/IRS4720ScheduleL/SumTxLiabFundMgrPrortnPymtGrp">
										<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
										<xsl:variable name="subRows">
											<xsl:choose>
												<xsl:when test="$subCount &gt; 3">
													<xsl:value-of select="$subCount"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
											<xsl:if test="position() &gt; 1">
												<tr>
													<td class="styTableCellCtrInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ItemNum"/>
														</xsl:call-template>
													</td>
													<td class="styTableCellAmtInherit">
														<xsl:if test="position() &lt; $subRows">
															<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$subCount &lt; 2">
											<tr>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="$subCount &lt; 3">
											<tr>
												<td class="styTableCellAmtInherit">&nbsp;</td>
												<td class="styTableCellAmtInherit">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSLP3 or count($FormData/IRS4720ScheduleL/SumTxLiabFundMgrPrortnPymtGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols3Subs">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleL/SumTxLiabFundMgrPrortnPymtGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSLP3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 9 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>9</strong></div>
					</div>
					<!-- Sch M -->
					<div class="sty4720ScheduleHead">
						SCHEDULE M &mdash; Tax on Hospital Organization for Failure to Meet the Community Health Needs <br /> Assessment Requirements 
						<span style="font-weight:normal;">(Sections 4959 and 501(r)(3)). (See instructions.)</span>
					</div>
					<!-- Sch M, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Failures to Meet Section 501(r)(3)
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSMP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleM/FailToMeetSection501r3Grp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchMPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:54mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of hospital facility
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of the failure
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Tax year hospital facility last conducted a CHNA
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Tax year hospital facility last adopted <br /> an implementation strategy
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSMP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleM/FailToMeetSection501r3Grp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="HospitalFacilityName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FailureDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="CHNAConductedYr"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right:none;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="ImplementationStrategyAdptYr"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSMP1 or count($FormData/IRS4720ScheduleM/FailToMeetSection501r3Grp) &lt; 5">
									<xsl:call-template name="FillTable5ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleM/FailToMeetSection501r3Grp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSMP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Sch M, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Computation of Tax
						</div>
					</div>
					<!-- Sch M, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Number of hospital facilities operated by the hospital organization that failed to meet the Community <br /> 
							Health Needs Assessment requirements of section 501(r)(3)
							<span class="sty4720DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleM/HospitalFcltsFailCHNA501r3Num"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch M, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							<strong>Tax &mdash; </strong>Enter $50,000 multiplied by line 1 here and on Part I, line 12
							<span class="sty4720DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleM/TotHospitalFcltsFail501r3TxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch N -->
					<div class="sty4720ScheduleHead">
						SCHEDULE N &mdash; Tax on Excess Executive Compensation 
						<span style="font-weight:normal;">(Section 4960). (See instructions.)</span>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSNP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleN/ExExecutiveCompensationTaxGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchNPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:64mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of covered employee
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(c)</strong> Excess renumeration
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Excess parachute payment
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Total. Add <br /> column (c) and (d)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSNP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleN/ExExecutiveCompensationTaxGrp">
										<tr style="height:4mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CoveredEmployeeNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessRemunerationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessParachutePaymentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RemunerationPlusPrchtPymtAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSNP1 or count($FormData/IRS4720ScheduleN/ExExecutiveCompensationTaxGrp) &lt; 5">
									<xsl:call-template name="FillTable5ColsN">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/IRS4720ScheduleN/ExExecutiveCompensationTaxGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSNP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="styLNRightNumBox" style="width:13mm;border-left-width:0px;border-right-width:1px;">6</div>
						<div class="styLNDesc" style="width:144mm;padding-left:4mm;border-bottom:1px solid black;">
							Attachment, if necessary. See instructions
							<span class="sty4720DotLn">.....................</span>
						</div>
						<div class="styLNAmountBox" style="width:30mm;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:157mm;padding-left:4mm;border-bottom:1px solid black;">
							<strong>Total</strong> (add column (e) items 1-6)
							<span class="sty4720DotLn">..........................</span>
						</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleN/TotalExRmnrtnPlusPrchtPymtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:157mm;padding-left:4mm;">
							<strong>Tax. </strong> Enter 21% of the amount above here and on Part I, line 13
							<span class="sty4720DotLn">.................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleN/TotExcessExecutiveCompTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sch O -->
					<div class="sty4720ScheduleHead">
						SCHEDULE O &mdash; Excise Tax on Net Investment Income of Private Colleges and Universities <br />
						<span style="font-weight:normal;">(Section 4968)</span>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateSOP1" select="($Print = $Separated) and (count($FormData/IRS4720ScheduleO/RelatedOrganizationGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="SchOPart1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;background-color:lightgrey">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:18mm;background-color:lightgrey">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:59mm;font-weight:normal;">
										<strong>(a)</strong>
										Name
									</th>
									<th class="styTableCellHeader" scope="col" style="width:18mm;font-weight:normal;">
										<strong>(b)</strong> EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(c)</strong> Gross <br /> investment income (See instructions.)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(d)</strong> Capital <br /> gain <br /> net <br /> income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(e)</strong> Administrative expenses allocable to income included in cols. (c) and (d)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Net investment income (See instructions.)
									</th>
								</tr>
							</thead>
							<tbody>
								<tr style="height:8mm;vertical-align:top;font-size:6pt;">
									<td class="styTableCellCtrInherit" style="font-size:7pt;font-weight:bold;">1</td>
									<td class="styTableCellTextInherit" style="font-size:7pt;">Filing Organization</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/FilingOrganizationGrp/GrossInvestmentIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/FilingOrganizationGrp/CapitalGainNetIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/FilingOrganizationGrp/AdminExpensesAllocableIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/FilingOrganizationGrp/NetInvestmentIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="not($shouldSeparateSOP1)">
									<xsl:for-each select="$FormData/IRS4720ScheduleO/RelatedOrganizationGrp">
										<tr style="height:8mm;vertical-align:top;font-size:6pt;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;"><xsl:value-of select="position() + 1"/></td>
											<td class="styTableCellTextInherit" style="font-size:7pt;">Related Organization</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossInvestmentIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CapitalGainNetIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdminExpensesAllocableIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSOP1 or count($FormData/IRS4720ScheduleO/RelatedOrganizationGrp) &lt; 1">
									<tr style="height:8mm;vertical-align:top;font-size:6pt;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;">2</td>
										<td class="styTableCellTextInherit" style="font-size:7pt;">Related Organization</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSOP1 or count($FormData/IRS4720ScheduleO/RelatedOrganizationGrp) &lt; 2">
									<tr style="height:8mm;vertical-align:top;font-size:6pt;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;">3</td>
										<td class="styTableCellTextInherit" style="font-size:7pt;">Related Organization</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/RelatedOrganizationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateSOP1 or count($FormData/IRS4720ScheduleO/RelatedOrganizationGrp) &lt; 3">
									<tr style="height:8mm;vertical-align:top;font-size:6pt;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;">4</td>
										<td class="styTableCellTextInherit" style="font-size:7pt;">Related Organization</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">&nbsp;</td>
									</tr>
								</xsl:if>
								<tr style="height:8mm;vertical-align:bottom;font-size:6pt;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;"><br />5</td>
									<td class="styTableCellTextInherit" colspan="3" style="font-size:7pt;">
										<br />
										Total from attachment, if necessary
										<span class="sty4720DotLn">.........</span>
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right:none;">&nbsp;</td>
								</tr>
								<tr style="height:8mm;vertical-align:bottom;font-size:6pt;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;"><br />6</td>
									<td class="styTableCellTextInherit" colspan="3" style="font-size:7pt;">
										<br />
										<strong>Total</strong>
										<span class="sty4720DotLn">..................</span>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/ExcsTxNetInvstCollegeTotGrp/GrossInvestmentIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/ExcsTxNetInvstCollegeTotGrp/CapitalGainNetIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/ExcsTxNetInvstCollegeTotGrp/AdminExpensesAllocableIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/ExcsTxNetInvstCollegeTotGrp/NetInvestmentIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="height:8mm;vertical-align:bottom;font-size:6pt;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;"><br />7</td>
									<td class="styTableCellTextInherit" colspan="6" style="font-size:7pt;">
										<br />
										Excise Tax on Net Investment Income. Enter 1.4% of the amount in 6(f) here and on Part I, line 14
										<span class="sty4720DotLn">......</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-right:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS4720ScheduleO/TotNetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
					</div>
					<!-- Page 10 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 4720 (2020)
						<div style="float:right;">Page <strong>10</strong></div>
					</div>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:13mm;height:69.5mm;font-size:12pt;font-weight:bold;padding-top:20mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:174mm;font-size:7pt;padding:0.5mm;margin-bottom:4mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
							is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:174mm;margin-top:6mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:82mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;">
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/OfficerTrusteePersonGrp/PersonNm"/>
									</xsl:call-template>
								</span>
								<span>Signature of officer or trustee</span>
							</div>
							<div class="styGenericDiv" style="width:52mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;border-right:1px solid black;">
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/OfficerTrusteePersonGrp/PersonTitleTxt"/>
									</xsl:call-template>
								</span>
								<span style="width:100%;text-align:center;">Title</span>
							</div>
							<div class="styGenericDiv" style="width:26mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:100%;text-align:center;">Date</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:174mm;margin-top:12mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:134mm;">
								<span style="width:100%;min-height:8mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/MgrSelfDealerDnrRltdPrsnGrp/PersonNm"></xsl:with-param>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/MgrSelfDealerDnrRltdPrsnGrp/OrganizationOrEntityName/BusinessNameLine1Txt"></xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/BusinessOfficerGrp/MgrSelfDealerDnrRltdPrsnGrp/OrganizationOrEntityName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/MgrSelfDealerDnrRltdPrsnGrp/OrganizationOrEntityName/BusinessNameLine2Txt"></xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span>
									Signature (and organization or entity name if applicable) of manager, self-dealer, disqualified person, <br />
									donor, donor advisor, or related person
								</span>
							</div>
							<div class="styGenericDiv" style="width:26mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:100%;text-align:center;">Date</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:174mm;margin-top:6mm;padding-left:1mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd"/>
							</xsl:call-template>
							<div class="styGenericDiv" style="width:170mm;">
								May the IRS discuss this return with the preparer shown below? (see instructions)
								<span class="sty4720DotLn" style="float:none;">..........</span>
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" alt="Discuss with paid preparer Yes">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS4720AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>Yes
								<input type="checkbox" class="styCkboxNM" style="margin-left:16px;margin-right:2px;" alt="Discuss with paid preparer No">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS4720AuthorizeThirdPartyNoCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>No
							</div>
						</div>
					</div>
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>4720</strong> (2020)</span>
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
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description <xsl:value-of select="position()"/></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/ExchangeRateDesc"/>
							<xsl:with-param name="Desc">Line A - Exchange Rate Description</xsl:with-param>
						</xsl:call-template>
					</table>
					<!-- Sch A, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSAP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A, Part I - Acts of Self-Dealing and Tax Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;">
										<strong>(a)</strong> Act <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;">
										<strong>(b)</strong> Date <br /> of act
									</th>
									<th class="styDepTblCell" scope="col" style="width:150mm;">
										<strong>(c)</strong> Description of act
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ActNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ActDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ActDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(d)</strong> 
										Question number from Form <br /> 990-PF, 
										Part VII-B, or Form 5227, <br /> Part VI-B, 
										applicable to the act
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(e)</strong>	Amount involved in act
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(f)</strong>	Initial tax on self-dealer <br />
										(10% of col. (e))
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(g)</strong> Tax on foundation managers <br />(if 
										applicable) <br />(lesser of $20,000 or 5% of col. (e))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleA/ActsSelfDealingTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Form990PFOr5227LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ActAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch A, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSAP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A, Part II - Summary of Tax Liability of Self-Dealers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of self-dealers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Act no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(d)</strong> Self-dealer's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleA/SummarySelfDealerTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortSelfDlrAmtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortSelfDlrAmtGrp[1]/ActNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortSelfDlrAmtGrp[1]/TaxImposedOrProratedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SumTxOrPrortSelfDlrAmtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ActNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch A, Part 3 separated table -->
					<xsl:if test="$shouldSeparateSAP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A, Part III - Summary of Tax Liability of Foundation Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Act no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (g), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleA/SumSelfDlngFndtnMgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortnFndtnMgrAmtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortnFndtnMgrAmtGrp[1]/ActNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortnFndtnMgrAmtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SumTxOrPrortnFndtnMgrAmtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ActNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch D, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSDP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule D, Part I - Investments and Tax Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Investment <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of <br /> investment
									</th>
									<th class="styDepTblCell" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of investment
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong>
										Amount of <br /> investment
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Initial tax on foundation (10% <br /> of col. (d))
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Initial tax on foundation managers (if applicable) &mdash; <br />(lesser of $10,000 or 10% of col. (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleD/InvestmentsTaxComputationGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InvestmentNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="InvestmentDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InvestmentDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvestmentAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch D, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSDP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule D, Part II - Summary of Tax Liability of Foundation Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Investment no. from Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleD/InvstSumFndtnMgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./InvstSumTxPrortFndtnMgrAmtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InvstSumTxPrortFndtnMgrAmtGrp[1]/InvestmentNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvstSumTxPrortFndtnMgrAmtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="InvstSumTxPrortFndtnMgrAmtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="InvestmentNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch E, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSEP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule E, Part I - Expenditures and Computation of Tax</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;">
										<strong>(b)</strong> Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styDepTblCell" scope="col" style="width:58mm;font-weight:normal;">
										<strong>(d)</strong>
										Name and address of recipient
									</th>
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(e)</strong> Description of expenditure and purposes <br /> for which made
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RecipientNm"/>
											</xsl:call-template><br />
											<xsl:choose>
												<xsl:when test="RecipientForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="RecipientUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExpenditureDescPurposeTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:59mm;font-weight:normal;">
										<strong>(f)</strong> 
										Question number from Form 990-PF, <br />
										Part VII-B, or Form 5227, Part VI-B, <br /> 
										applicable to the expenditure
									</th>
									<th class="styDepTblCell" scope="col" style="width:64mm;font-weight:normal;">
										<strong>(g)</strong>	Initial tax imposed on foundation <br />
										(20% of col. (b))
									</th>
									<th class="styDepTblCell" scope="col" style="width:64mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong> Initial tax imposed on foundation <br /> managers (if 
										applicable) &mdash; (lesser of <br /> $10,000 or 5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleE/TaxableExpendituresCmptTaxGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Form990PFOr5227LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch E, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSEP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule E, Part II - Summary of Tax Liability of Organization Managers or Foundation Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of foundation managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (h), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleE/SummaryFndtnMgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch F, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSFP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule F, Part I - Political Expenditures and Computation of Tax</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(b)</strong>
										Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styDepTblCell" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(d)</strong>
										Description of political expenditure
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Initial tax imposed on organization or foundation <br /> (10% of col. (b))
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Initial tax imposed on managers (if <br /> applicable) (lesser <br /> of  $5,000 or <br /> 2.5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleF/PltclExpendituresCmptTaxGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExpenditureDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch F, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSFP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule F, Part II - Summary of Tax Liability of Organization Managers or Foundation Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of organization managers or <Br /> foundation managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleF/SummaryOrgFndtnMgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch H, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSHP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule H, Part I - Disqualifying Lobbying Expenditures and Computation of Tax</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(b)</strong>
										Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong>
										Date paid<br /> or incurred
									</th>
									<th class="styDepTblCell" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(d)</strong>
										Description of lobbying expenditures
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Tax imposed on organization <br /> (5% of col. (b))
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Tax imposed on organization managers (if applicable) &mdash; <br />(5% of col. (b))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleH/DsqlfyLbbyngExpendCmptTaxGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenditureAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ExpenditureDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExpenditureDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch H, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSHP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule H, Part II - Summary of Tax Liability of Organization Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of organization managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleH/SummaryOrgMgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch I, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSIP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule I, Part I - Excess Benefit Transactions and Tax Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Transaction <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of transaction
									</th>
									<th class="styDepTblCell" scope="col" style="width:150mm;font-weight:normal;">
										<strong>(c)</strong> Description of transaction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TransactionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(d)</strong>	Amount of excess benefit
									</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(e)</strong>	Initial tax on disqualified persons <br />
										(25% of col. (d))
									</th>
									<th class="styDepTblCell" scope="col" style="width:63mm;font-weight:normal;">
										<strong>(f)</strong> Tax on organization managers <br />(if 
										applicable) (lesser of <br /> $20,000 or 10% of col. (d))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleI/ExcessBenefitTransTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExcessBenefitAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch I, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSIP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule I, Part II - Summary of Tax Liability of Disqualified Persons and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of disqualified persons liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Trans. no. from Part I, <br /> col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (e), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(d)</strong> Disqualified person's total tax <br /> 
										liability (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleI/SummaryDsqlfyPrsnTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxLiabDsqlfyPrsnPrortnGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SumTxLiabDsqlfyPrsnPrortnGrp[1]/TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumTxLiabDsqlfyPrsnPrortnGrp[1]/TaxImposedOrProratedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SumTxLiabDsqlfyPrsnPrortnGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransactionNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch I, Part 3 separated table -->
					<xsl:if test="$shouldSeparateSIP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule I, Part III - Summary of Tax Liability of 501(c)(3), (c)(4) &amp; (c)(29) Organization Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of 501(c)(3), (c)(4), &amp; (c)(29) organization managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Trans. no. from Part I, <br /> col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Manager's total tax liability <br /> 
										 (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleI/Summary501c3429MgrTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxLiab501c3c4c29MgrPrortGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SumTxLiab501c3c4c29MgrPrortGrp[1]/TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumTxLiab501c3c4c29MgrPrortGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SumTxLiab501c3c4c29MgrPrortGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransactionNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch J, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSJP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule J, Part I - Prohibited Tax Shelter Transactions (PTST) and Tax Imposed on the Tax-Exempt Entity</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> Transaction <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong>
										Transaction date
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(c)</strong>
										Type of transaction <br />
										<span style="text-align:left;width:40mm;">
											<strong>1 </strong> &ndash;Listed<br />
											<strong>2 </strong> &ndash;Subsequently listed<br />
											<strong>3 </strong> &ndash;Confidential<br />
											<strong>4 </strong> &ndash;Contractual protection
										</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:97mm;font-weight:normal;">
										<strong>(d)</strong> Description of transaction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<br />
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TransactionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ProhibitedTaxShelterTransCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ProhibitedTaxShelterTransDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(e)</strong> 
										Did the tax-exempt entity know or have reason to know this transaction 
										was a PTST when it became a party to the transaction? 
										Answer <strong>Yes</strong> or <strong>No</strong>
									</th>
									<th class="styDepTblCell" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(f)</strong> Net income attributable to <br /> the PTST
									</th>
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(g)</strong>	 75% of proceeds attributable to <br /> the PTST
									</th>
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(h)</strong> Tax imposed on the tax-exempt <br /> entity (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleJ/PTSTTxImposeTxExemptEntityGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="KnownPTSTTransInd/text() = '1' or KnownPTSTTransInd/text() = 'true'">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="KnownPTSTTransInd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="KnownPTSTTransInd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetIncomeAttributablePTSTAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Proceeds75PctAttrblPTSTAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch J, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSJP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule J, Part II - Tax Imposed on Entity Managers</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong> 
										Name of entity manager
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Transaction <br /> number from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax &mdash; enter $20,000 for <br /> each  
										transaction listed in <br /> col. (b) for each  
										manager in col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>(d)</strong> Manager's total tax <br /> 
										liability (add amounts in col. (c))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleJ/TaxImposedEntityManagerGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./TaxLiabImposedEntityManagerGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxLiabImposedEntityManagerGrp[1]/TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxLiabImposedEntityManagerGrp[1]/TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="TaxLiabImposedEntityManagerGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransactionNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch K, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSKP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule K, Part I - Taxable Distributions and Tax Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:86mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of sponsoring organization and <br />
										donor advised fund
									</th>
									<th class="styDepTblCell" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(c)</strong> Description of distribution
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SponsoringOrganizationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="SponsoringOrganizationName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SponsoringOrganizationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<span style="width:100%;height:1mm;border-top:1px dashed black;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DonorAdvisedFundPersonNm"/>
											</xsl:call-template>
											<br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DonorAdvisedFundBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="DonorAdvisedFundBusinessName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonorAdvisedFundBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit" style="border-right:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributionDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(d)</strong> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(e)</strong> Amount of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(f)</strong> Tax imposed on <br /> organization (20% of col. (e))
									</th>
									<th class="styDepTblCell" scope="col" style="width:47mm;font-weight:normal;">
										<strong>(g)</strong> Tax on fund managers <br /> (lesser of 5% of col. (e) or $10,000)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleK/TaxableDistributionsTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch K, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSKP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule K, Part II - Summary of Tax Liability of Fund Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of fund managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (g), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Fund Manager's total tax liability <br /> 
										 (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleK/SumTxLiabFundMgrPrortnPymtGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch L, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSLP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule L, Part I - Prohibited Benefits and Tax Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong>
										Date of <br /> prohibited benefit
									</th>
									<th class="styDepTblCell" scope="col" style="width:145mm;font-weight:normal;">
										<strong>(c)</strong> Description of benefit
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ProhibitedBenefitDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BenefitDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(d)</strong>	Amount of prohibited benefit
									</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">
										<strong>(e)</strong>	Tax on donors, donor advisors, or related persons 
										(125% of col. (d)) (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:63mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Tax on fund managers (if applicable) 
										(lesser of 10% of col. (d) or $10,000) (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleL/ProhibitedBenefitsTaxCmptGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProhibitedBenefitAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedManagerAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch L, Part 2 separated table -->
					<xsl:if test="$shouldSeparateSLP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule L, Part II - Summary of Tax Liability of Donors, Donor Advisors, Related Persons, and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of donors, donor advisors, or related persons liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (e), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Donor's, donor advisor's or related person's total tax liability 
										(add amounts in col. (c)) (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleL/DnrAdvisorRltdPrsnTaxLiabGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SumTxOrPrortDnrAdvisorRltdGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortDnrAdvisorRltdGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SumTxOrPrortDnrAdvisorRltdGrp[1]/TaxImposedOrProratedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SumTxOrPrortDnrAdvisorRltdGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedOrProratedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch L, Part 3 separated table -->
					<xsl:if test="$shouldSeparateSLP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule L, Part III - Summary of Tax Liability of Fund Managers and Proration of Payments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>(a)</strong> 
										Names of fund managers liable for tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> Item no. from <br /> Part I, col. (a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(c)</strong>	Tax from Part I, col. (f), <br />
										or prorated amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Fund Manager's total tax liability <br /> 
										 (add amounts in col. (c)) <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleL/SumTxLiabFundMgrPrortnPymtGrp">
									<xsl:variable name="subCount"><xsl:value-of select="count(./SummaryTxLiabMgrPrortnPymtGrp)"/></xsl:variable>
									<xsl:variable name="subRows">
										<xsl:choose>
											<xsl:when test="$subCount &gt; 3">
												<xsl:value-of select="$subCount"/>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="3"/></xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SummaryTxLiabMgrPrortnPymtGrp[1]/TaxImposedManagerPrortAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right:none;">
											<xsl:attribute name="rowspan"><xsl:value-of select="$subRows"/></xsl:attribute>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:variable name="outerMod" select="position() mod 2"/>
									<xsl:for-each select="SummaryTxLiabMgrPrortnPymtGrp">
										<xsl:if test="position() &gt; 1">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $outerMod) mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCellCtrInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ItemNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:if test="position() &lt; $subRows">
														<xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxImposedManagerPrortAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="$subCount &lt; 2">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$subCount &lt; 3">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="$outerMod = 0">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch M, Part 1 separated table -->
					<xsl:if test="$shouldSeparateSMP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule M, Part I - Failures to Meet Section 501(r)(3)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:54mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of hospital facility
									</th>
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of the failure
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Tax year hospital facility last conducted a CHNA
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Tax year hospital facility last adopted <br /> an implementation strategy
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleM/FailToMeetSection501r3Grp">
									<tr style="min-height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ItemNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="HospitalFacilityName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FailureDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="CHNAConductedYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right:none;">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="ImplementationStrategyAdptYr"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch N separated table -->
					<xsl:if test="$shouldSeparateSNP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule N - Tax on Excess Executive Compensation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:13mm;font-weight:normal;">
										<strong>(a)</strong> Item <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:64mm;font-weight:normal;">
										<strong>(b)</strong>
										Name of covered employee
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(c)</strong> Excess renumeration
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Excess parachute payment
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(e)</strong> Total. Add <br /> column (c) and (d)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleN/ExExecutiveCompensationTaxGrp">
									<tr style="min-height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ItemNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CoveredEmployeeNm"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessRemunerationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessParachutePaymentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RemunerationPlusPrchtPymtAmt"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch O, separated table -->
					<xsl:if test="$shouldSeparateSOP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule O - Excise Tax on Net Investment Income of Private Colleges and Universities - Related Organizations</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>(a)</strong>
										Name
									</th>
									<th class="styDepTblCell" scope="col" style="width:18mm;font-weight:normal;">
										<strong>(b)</strong> EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(c)</strong> Gross <br /> investment income (See instructions.)
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(d)</strong> Capital <br /> gain <br /> net <br /> income
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(e)</strong> Administrative expenses allocable to income included in cols. (c) and (d)
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(f)</strong> Net investment income (See instructions.)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRS4720ScheduleO/RelatedOrganizationGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;font-size:6pt;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;font-size:7pt;"><xsl:value-of select="position() + 1"/></td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossInvestmentIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CapitalGainNetIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdminExpensesAllocableIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable3Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:4mm;vertical-align:top;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable3Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable3Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable3ColsN">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<xsl:param name="TwoLine" select="false()"/>
		<tr style="height:4mm;vertical-align:top;">
			<xsl:if test="$TwoLine">
				<xsl:attribute name="style">height:8mm;vertical-align:top;</xsl:attribute>
			</xsl:if>
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise><xsl:value-of select="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit" style="border-right-width:0px;">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable3ColsN">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="TwoLine" select="$TwoLine"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable3ColsN">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="TwoLine" select="$TwoLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:4mm;vertical-align:top;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4ColsN">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<xsl:param name="TwoLine" select="false()"/>
		<tr style="height:4mm;vertical-align:top;">
			<xsl:if test="$TwoLine">
				<xsl:attribute name="style">height:8mm;vertical-align:top;</xsl:attribute>
			</xsl:if>
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise><xsl:value-of select="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Add'l Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4ColsN">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="TwoLine" select="$TwoLine"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4ColsN">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="TwoLine" select="$TwoLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4Cols3Subs">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr style="vertical-align:top;">
			<td class="styTableCellCtrInherit" rowspan="3">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
			<td class="styTableCellAmtInherit" rowspan="3" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<tr>
			<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-bottom-style:dashed;">&nbsp;</td>
		</tr>
		<tr>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols3Subs">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols3Subs">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable5ColsN">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:4mm;vertical-align:top;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise><xsl:value-of select="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Add'l Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5ColsN">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5ColsN">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable6ColsN">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:4mm;vertical-align:top;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise><xsl:value-of select="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Add'l Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable6ColsN">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable6ColsN">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
