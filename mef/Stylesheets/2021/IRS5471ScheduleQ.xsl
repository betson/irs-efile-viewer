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
	<xsl:include href="IRS5471ScheduleQStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleQ" />
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
				<meta name="Description" content="IRS Schedule Q Form 5471" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleQStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleQ">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE Q<br />(Form 5471)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(December 2020)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								CFC Income by CFC Income Groups
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471.
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5471</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of person filing Form 5471 <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>Identifying number</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:163.2mm;height:9mm;">
							Name of foreign corporation <br />
							<xsl:choose>
								<xsl:when test="$FormData/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="width:46mm;height:9mm;padding-left:2px;">
							EIN (if any) <br />
							<xsl:choose>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/SSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:46mm;height:9mm;padding-left:1mm;font-weight:normal;word-wrap:break-all">
							<strong>Reference ID number</strong> (see instructions)<br />
							<xsl:choose>
								<xsl:when test="count($FormData/ForeignEntityIdentificationGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp"/>
										<xsl:with-param name="Desc">Entity Information - Foreign Entity Identification</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Complete a separate Schedule Q with respect to each applicable category of income (see instructions)
						</div>
					</div>
					<!-- Line A -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">A</div>
						<div class="styLNDesc" style="width:216mm;">
							Enter a separate category code with respect to which this Schedule Q is being completed (see instructions for codes)
							<span class="sty5471SQDotLn">...............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line B -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">B</div>
						<div class="styLNDesc" style="width:216mm;">
							If category code "PAS" is entered on line A, enter the applicable grouping code (see instructions)
							<span class="sty5471SQDotLn">.....................&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PassiveCategoryIncomeGroupCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line C -->
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Complete a separate Schedule Q for U.S. source income and foreign source income.
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">C</div>
						<div class="styLNDesc" style="width:90mm;">
							Indicate whether this Schedule Q is being completed for:
						</div>
						<div class="styGenericDiv" style="width:158mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:3px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/USSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F5471SQUSSourceIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/USSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F5471SQUSSourceIncome</xsl:with-param>
								</xsl:call-template>U.S. source income</label>
							<span style="width:40px;"/>
							<input type="checkbox" class="styCkboxNM" style="margin-right:3px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F5471SQForeignSourceIncomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F5471SQForeignSourceIncomeInd</xsl:with-param>
								</xsl:call-template>Foreign source income</label>
						</div>
					</div>
					<!-- Line D -->
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Complete a separate Schedule Q for FOGEI or FORI income.
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">D</div>
						<div class="styLNDesc" style="width:240mm;">
							If this Schedule Q is being completed for FOGEI or FORI income, check this box
							<span class="sty5471SQDotLn">.................................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="width:8mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="FOGEI or FORI indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FOGEIOrFORIInd"/>
									<xsl:with-param name="BackupName">F5471SQFOGEIOrFORIInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>

					<xsl:variable name="sep1a" select="($Print = $Separated) and (count($FormData/DivIntRntsRyltsAnntsGrp) &gt; 2)"/>
					<xsl:variable name="sep1b" select="($Print = $Separated) and (count($FormData/NetGainCertainPropTransGrp) &gt; 2)"/>
					<xsl:variable name="sep1c" select="($Print = $Separated) and (count($FormData/NetGainCommoditiesTranGrp) &gt; 2)"/>
					<xsl:variable name="sep1d" select="($Print = $Separated) and (count($FormData/NetFrgnCurrencyGainGrp) &gt; 2)"/>
					<xsl:variable name="sep1e" select="($Print = $Separated) and (count($FormData/IncmEquivalentToIntGrp) &gt; 2)"/>
					<xsl:variable name="sep1f" select="($Print = $Separated) and (count($FormData/FrgnBaseCoSalesIncmGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Page1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:72mm;font-weight:normal;font-style:italic;text-align:left;padding-left:6px;">
										Enter amounts in functional currency of the foreign corporation (unless otherwise noted).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(i)</strong><br /> Country <br /> Code
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(ii)</strong><br /> Gross Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(iii)</strong><br /> Definitely Related Expenses
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(iv)</strong><br /> Related Person Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(v)</strong><br /> Other Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(vi)</strong><br /> Research &amp; Experimental Expenses
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;border-right-width:0px;">
										<strong>(vii)</strong><br /> Other Expenses <br /> (attach schedule)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-top:0px;">1</span>
										Subpart F Income Groups
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 1a total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">a</span>
										Dividends, Interest, Rents, Royalties, <br />&amp; Annuities (Total)
										<span class="sty5471SQDotLn">.........</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDivIntRntsRyltsAnntsGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/DivIntRntsRyltsAnntsGrp"/>
									<xsl:with-param name="Sep" select="$sep1a"/>
								</xsl:call-template>
								<!-- Line 1b total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">b</span>
										Net Gain From Certain Property <br />Transactions (Total)
										<span class="sty5471SQDotLn">.........</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetGainCertainPropTransGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainCertainPropTransGrp"/>
									<xsl:with-param name="Sep" select="$sep1b"/>
								</xsl:call-template>
								<!-- Line 1c total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">c</span>
										Net Gain From Commodities Transactions (Total)
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetGainCommoditiesTranGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainCommoditiesTranGrp"/>
									<xsl:with-param name="Sep" select="$sep1c"/>
								</xsl:call-template>
								<!-- Line 1d total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">d</span>
										Net Foreign Currency Gain (Total)
										<span class="sty5471SQDotLn">.....</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetFrgnCurrencyGainGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/NetFrgnCurrencyGainGrp"/>
									<xsl:with-param name="Sep" select="$sep1d"/>
								</xsl:call-template>
								<!-- Line 1e total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">e</span>
										Income Equivalent to Interest (Total)
										<span class="sty5471SQDotLn">....</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotIncmEquivalentToIntGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/IncmEquivalentToIntGrp"/>
									<xsl:with-param name="Sep" select="$sep1e"/>
								</xsl:call-template>
								<!-- Line 1f total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">f</span>
										Foreign Base Company Sales Income (Total)
										<span class="sty5471SQDotLn">..</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotFrgnBaseCoSalesIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCoSalesIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1f"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="padding-top:2px;padding-bottom:2px;border-top:1px solid black;">
						<strong>Important: </strong> See <span style="font-style:italic;font-weight:bold;"> Computer-Generated Schedule Q </span> in instructions. 
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						For Paperwork Reduction Act Notice, see instructions. 
						<span style="margin-left:50mm;font-weight:normal;">Cat. No. 73414U</span>
						<span style="float:right;">Schedule Q (Form 5471) (12-2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS">
						Schedule Q (Form 5471) (12-2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page2Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(viii)</strong><br /> Current Year Tax on Reattributed Income From Disregarded Payments
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(ix)</strong><br /> Current Year Tax on All Other Disregarded Payments
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(x)</strong><br /> Other Current <br /> Year Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xi)</strong><br /> Net Income <br /> (column (ii) less columns (iii) through (x))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xii)</strong><br /> Foreign Taxes for <br /> Which Credit Allowed <br /> (U.S. Dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xiii)</strong><br /> Average Asset Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">
										<strong>(xiv)</strong><br /> High Tax Election
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										Reserved
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										Reserved
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="styTableCellTextInherit" style="font-weight:bold;padding-left:1mm;">1</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 1a total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">a</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDivIntRntsRyltsAnntsGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/DivIntRntsRyltsAnntsGrp"/>
									<xsl:with-param name="Sep" select="$sep1a"/>
									<xsl:with-param name="Line">1a</xsl:with-param>
								</xsl:call-template>
								<!-- Line 1b total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">b</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetGainCertainPropTransGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainCertainPropTransGrp"/>
									<xsl:with-param name="Sep" select="$sep1b"/>
									<xsl:with-param name="Line">1b</xsl:with-param>
								</xsl:call-template>
								<!-- Line 1c total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">c</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetGainCommoditiesTranGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainCommoditiesTranGrp"/>
									<xsl:with-param name="Sep" select="$sep1c"/>
									<xsl:with-param name="Line">1c</xsl:with-param>
								</xsl:call-template>
								<!-- Line 1d total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">d</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotNetFrgnCurrencyGainGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/NetFrgnCurrencyGainGrp"/>
									<xsl:with-param name="Sep" select="$sep1d"/>
									<xsl:with-param name="Line">1d</xsl:with-param>
								</xsl:call-template>
								<!-- Line 1e total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">e</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotIncmEquivalentToIntGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/IncmEquivalentToIntGrp"/>
									<xsl:with-param name="Sep" select="$sep1e"/>
									<xsl:with-param name="Line">1e</xsl:with-param>
								</xsl:call-template>
								<!-- Line 1f total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">f</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotFrgnBaseCoSalesIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCoSalesIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1f"/>
									<xsl:with-param name="Line">1f</xsl:with-param>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="padding-top:2px;padding-bottom:2px;border-top:1px solid black;">
						<strong>Important: </strong> See <span style="font-style:italic;font-weight:bold;"> Computer-Generated Schedule Q </span> in instructions. 
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule Q (Form 5471) (12-2020)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS">
						Schedule Q (Form 5471) (12-2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<xsl:variable name="sep1g" select="($Print = $Separated) and (count($FormData/FrgnBaseCompanySrvcIncmGrp) &gt; 2)"/>
					<xsl:variable name="sep1h" select="($Print = $Separated) and (count($FormData/FullInclsnFrgnBaseCoIncmGrp) &gt; 2)"/>
					<xsl:variable name="sep1i" select="($Print = $Separated) and (count($FormData/InsuranceIncomeGrp) &gt; 2)"/>
					<xsl:variable name="sep1j" select="($Print = $Separated) and (count($FormData/IntntlBoycottIncomeGrp) &gt; 1)"/>
					<xsl:variable name="sep1k" select="($Print = $Separated) and (count($FormData/BribesKickbackOtherPymtGrp) &gt; 1)"/>
					<xsl:variable name="sep1l" select="($Print = $Separated) and (count($FormData/CFCSection901jIncomeGrp) &gt; 1)"/>
					<xsl:variable name="sep2" select="($Print = $Separated) and (count($FormData/RecapturedSubpartFIncmGrp) &gt; 1)"/>
					<xsl:variable name="sep3" select="($Print = $Separated) and (count($FormData/TestedIncomeGrp) &gt; 2)"/>
					<xsl:variable name="sep4" select="($Print = $Separated) and (count($FormData/ResidualIncomeGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Page3Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:72mm;font-weight:normal;font-style:italic;text-align:left;padding-left:6px;">
										Enter amounts in functional currency of the foreign corporation (unless otherwise noted).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(i)</strong><br /> Country <br /> Code
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(ii)</strong><br /> Gross Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(iii)</strong><br /> Definitely Related Expenses
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(iv)</strong><br /> Related Person Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(v)</strong><br /> Other Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(vi)</strong><br /> Research &amp; Experimental Expenses
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;border-right-width:0px;">
										<strong>(vii)</strong><br /> Other Expenses <br /> (attach schedule)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-top:0px;">1</span>
										Subpart F Income Groups
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 1g total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">g</span>
										Foreign Base Company Services Income (Total)
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotFrgnBaseCompanySrvcIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCompanySrvcIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1g"/>
								</xsl:call-template>
								<!-- Line 1h total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">h</span>
										Full Inclusion Foreign Base Company <br />Income (Total)
										<span class="sty5471SQDotLn">.........</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotFullInclsnFrgnBaseCoIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/FullInclsnFrgnBaseCoIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1h"/>
								</xsl:call-template>
								<!-- Line 1i total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">i</span>
										Insurance Income (Total)
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotalInsuranceIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/InsuranceIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep1i"/>
								</xsl:call-template>
								<!-- Line 1j -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">j</span>
										International Boycott Income
										<span class="sty5471SQDotLn">......</span>
									</td>
									<xsl:call-template name="SingLineSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/IntntlBoycottIncomeGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1j"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/IntntlBoycottIncomeGrp) &gt; 1) and not($sep1j)">
									<xsl:for-each select="$FormData/IntntlBoycottIncomeGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">j</span>
												International Boycott Income
												<span class="sty5471SQDotLn">......</span>
											</td>
											<xsl:call-template name="SingLineSchQ">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1j"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 1k -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">k</span>
										Bribes, Kickbacks, and Other Payments
										<span class="sty5471SQDotLn">...</span>
									</td>
									<xsl:call-template name="SingLineSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/BribesKickbackOtherPymtGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1j"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/BribesKickbackOtherPymtGrp) &gt; 1) and not($sep1j)">
									<xsl:for-each select="$FormData/BribesKickbackOtherPymtGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">k</span>
												Bribes, Kickbacks, and Other Payments
												<span class="sty5471SQDotLn">...</span>
											</td>
											<xsl:call-template name="SingLineSchQ">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1j"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 1l -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">l</span>
										Section 901(j) Income
										<span class="sty5471SQDotLn">........</span>
									</td>
									<xsl:call-template name="SingLineSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/CFCSection901jIncomeGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1l"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/CFCSection901jIncomeGrp) &gt; 1) and not($sep1l)">
									<xsl:for-each select="$FormData/CFCSection901jIncomeGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												<span class="styLNLeftNumBox" style="width:6mm;padding-left:2mm;padding-top:0px;">l</span>
												Section 901(j) Income
											<span class="sty5471SQDotLn">........</span>
											</td>
											<xsl:call-template name="SingLineSchQ">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1l"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 2 -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:0.5mm;padding-top:0px;">2</span>
										Recaptured Subpart F Income
										<span class="sty5471SQDotLn">......</span>
									</td>
									<xsl:call-template name="SingLineSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/RecapturedSubpartFIncmGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep2"/>
										<xsl:with-param name="L2" select="true()"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/RecapturedSubpartFIncmGrp) &gt; 1) and not($sep2)">
									<xsl:for-each select="$FormData/RecapturedSubpartFIncmGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												<span class="styLNLeftNumBox" style="width:6mm;padding-left:0.5mm;padding-top:0px;">2</span>
												Recaptured Subpart F Income
												<span class="sty5471SQDotLn">......</span>
											</td>
											<xsl:call-template name="SingLineSchQ">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep2"/>
												<xsl:with-param name="L2" select="true()"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 3 total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:0.5mm;padding-top:0px;">3</span>
										Tested Income Group (Total)
										<span class="sty5471SQDotLn">......</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTestedIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep3"/>
								</xsl:call-template>
								<!-- Line 4 total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:0.5mm;padding-top:0px;">4</span>
										Residual Income Group (Total)
										<span class="sty5471SQDotLn">......</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/TotalResidualIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQ">
									<xsl:with-param name="TargetNode" select="$FormData/ResidualIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep4"/>
								</xsl:call-template>
								<!-- Line 5 total -->
								<tr>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										<span class="styLNLeftNumBox" style="width:6mm;padding-left:0.5mm;padding-top:0px;">5</span>
										Total
										<span class="sty5471SQDotLn">..............</span>
									</td>
									<xsl:call-template name="TotCellsSchQ">
										<xsl:with-param name="TargetNode" select="$FormData/CFCTotalIncomeGrp"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="padding-top:2px;padding-bottom:2px;border-top:1px solid black;">
						<strong>Important: </strong> See <span style="font-style:italic;font-weight:bold;"> Computer-Generated Schedule Q </span> in instructions. 
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule Q (Form 5471) (12-2020)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS">
						Schedule Q (Form 5471) (12-2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page4Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(viii)</strong><br /> Current Year Tax on Reattributed Income From Disregarded Payments
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(ix)</strong><br /> Current Year Tax on All Other Disregarded Payments
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(x)</strong><br /> Other Current <br /> Year Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xi)</strong><br /> Net Income <br /> (column (ii) less columns (iii) through (x))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xii)</strong><br /> Foreign Taxes for <br /> Which Credit Allowed <br /> (U.S. Dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xiii)</strong><br /> Average Asset Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">
										<strong>(xiv)</strong><br /> High Tax Election
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										Reserved
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										Reserved
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="styTableCellTextInherit" style="font-weight:bold;padding-left:1mm;">1</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 1g total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">g</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotFrgnBaseCompanySrvcIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCompanySrvcIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1g"/>
								</xsl:call-template>
								<!-- Line 1h total -->
								<tr style="vertical-align:top;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">h</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotFullInclsnFrgnBaseCoIncmGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/FullInclsnFrgnBaseCoIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep1h"/>
								</xsl:call-template>
								<!-- Line 1i total -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">i</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotalInsuranceIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/InsuranceIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep1i"/>
								</xsl:call-template>
								<!-- Line 1j -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">j</td>
									<xsl:call-template name="SingLineSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/IntntlBoycottIncomeGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1j"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/IntntlBoycottIncomeGrp) &gt; 1) and not($sep1j)">
									<xsl:for-each select="$FormData/IntntlBoycottIncomeGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">j</td>
											<xsl:call-template name="SingLineSchQp2">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1j"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 1k -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">k</td>
									<xsl:call-template name="SingLineSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/BribesKickbackOtherPymtGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1j"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/BribesKickbackOtherPymtGrp) &gt; 1) and not($sep1j)">
									<xsl:for-each select="$FormData/BribesKickbackOtherPymtGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">k</td>
											<xsl:call-template name="SingLineSchQp2">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1j"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 1l -->
								<tr>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">l</td>
									<xsl:call-template name="SingLineSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/CFCSection901jIncomeGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep1l"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/CFCSection901jIncomeGrp) &gt; 1) and not($sep1l)">
									<xsl:for-each select="$FormData/CFCSection901jIncomeGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">l</td>
											<xsl:call-template name="SingLineSchQp2">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep1l"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 2 -->
								<tr>
									<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;">2</td>
									<xsl:call-template name="SingLineSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/RecapturedSubpartFIncmGrp[1]"/>
										<xsl:with-param name="Sep" select="$sep2"/>
										<xsl:with-param name="L2" select="true()"/>
									</xsl:call-template>
								</tr>
								<xsl:if test="(count($FormData/RecapturedSubpartFIncmGrp) &gt; 1) and not($sep2)">
									<xsl:for-each select="$FormData/RecapturedSubpartFIncmGrp[position() &gt; 1]">
										<tr>
											<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;">2</td>
											<xsl:call-template name="SingLineSchQp2">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Sep" select="$sep2"/>
												<xsl:with-param name="L2" select="true()"/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Line 3 total -->
								<tr>
									<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;">3</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTestedIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep3"/>
								</xsl:call-template>
								<!-- Line 4 total -->
								<tr>
									<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;">4</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/TotalResidualIncomeGrp"/>
										<xsl:with-param name="L4" select="true()"/>
									</xsl:call-template>
								</tr>
								<xsl:call-template name="UnitLineSchQp2">
									<xsl:with-param name="TargetNode" select="$FormData/ResidualIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep4"/>
									<xsl:with-param name="L4" select="true()"/>
								</xsl:call-template>
								<!-- Line 5 total -->
								<tr>
									<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;">5</td>
									<xsl:call-template name="TotCellsSchQp2">
										<xsl:with-param name="TargetNode" select="$FormData/CFCTotalIncomeGrp"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="padding-top:2px;padding-bottom:2px;border-top:1px solid black;">
						<strong>Important: </strong> See <span style="font-style:italic;font-weight:bold;"> Computer-Generated Schedule Q </span> in instructions. 
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule Q (Form 5471) (12-2020)</span>
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
					<!-- Reference ID Number -->
					<xsl:if test="(count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						<br />
						<br />
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Line 1a separated table -->
					<xsl:if test="$sep1a">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1a - Dividends, Interest, Rents, Royalties, and Annuities</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/DivIntRntsRyltsAnntsGrp"/>
							<xsl:with-param name="Line">1a</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1b">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1b - Net Gain From Certain Property Transactions</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/NetGainCertainPropTransGrp"/>
							<xsl:with-param name="Line">1b</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1c">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1c - Net Gain From Commodities Transactions</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/NetGainCommoditiesTranGrp"/>
							<xsl:with-param name="Line">1c</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1d">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1d - Net Foreign Currency Gain</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/NetFrgnCurrencyGainGrp"/>
							<xsl:with-param name="Line">1d</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1e">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1e - Income Equivalent to Interest</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/IncmEquivalentToIntGrp"/>
							<xsl:with-param name="Line">1e</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1f">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1f - Foreign Base Company Sales Income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCoSalesIncmGrp"/>
							<xsl:with-param name="Line">1f</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1g">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1g - Foreign Base Company Services Income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnBaseCompanySrvcIncmGrp"/>
							<xsl:with-param name="Line">1g</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1h">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1h - Full Inclusion Foreign Base Company Income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/FullInclsnFrgnBaseCoIncmGrp"/>
							<xsl:with-param name="Line">1h</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1i">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1i - Insurance Income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/InsuranceIncomeGrp"/>
							<xsl:with-param name="Line">1i</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1j">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1j - International Boycott Income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/IntntlBoycottIncomeGrp"/>
							<xsl:with-param name="Line">1j</xsl:with-param>
							<xsl:with-param name="Single" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1k">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1k - Bribes, Kickbacks, and Other Payments</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/BribesKickbackOtherPymtGrp"/>
							<xsl:with-param name="Line">1k</xsl:with-param>
							<xsl:with-param name="Single" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep1l">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1l - Section 901(j) income</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/CFCSection901jIncomeGrp"/>
							<xsl:with-param name="Line">1l</xsl:with-param>
							<xsl:with-param name="Single" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 2 - Recaptured Subpart F Income</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(i)</strong><br /> Country <br /> Code
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(ii)</strong><br /> Gross Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(xi)</strong><br /> Net Income <br /> (column (ii) less columns (iii) through (x))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/RecapturedSubpartFIncmGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 3 - Tested Income Group</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeGrp"/>
							<xsl:with-param name="Line">3</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 4 - Residual Income Group</span>
						<xsl:call-template name="UnitLineSep">
							<xsl:with-param name="TargetNode" select="$FormData/ResidualIncomeGrp"/>
							<xsl:with-param name="Line">4</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="UnitLineSchQ">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:if test="not($Sep)">
		<xsl:for-each select="$TargetNode">
			<tr style="vertical-align:top;">
				<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
					<span class="styLNLeftNumBox" style="width:6mm;padding-top:0px;"></span>
					<strong>(<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RowId"/></xsl:call-template>)</strong> 
					Unit name &#9658; 
					<span style="display:inline;text-decoration:underline;text-decoration-style:dashed;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="QBUName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td class="styTableCellCtrInherit" style="">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="CountryCd"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DefinitelyRltdExpnssAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="RelatedPersonIntExpnsAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="OtherInterestExpenseAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="RsrchExperimentalExpnssAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 1)">
		<tr>
			<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
				<span class="styLNLeftNumBox" style="width:6mm;padding-top:0px;"></span>
				<strong>(1)</strong> 
				Unit name &#9658; 
				<span style="border-bottom:1px dashed black;width:40mm;">&nbsp;</span>
			</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellTextInherit" style="">
				<xsl:if test="$Sep">See Add'l Data</xsl:if>&nbsp;
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 2)">
		<tr>
			<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
				<span class="styLNLeftNumBox" style="width:6mm;padding-top:0px;"></span>
				<strong>(2)</strong> 
				Unit name &#9658; 
				<span style="border-bottom:1px dashed black;width:40mm;">&nbsp;</span>
			</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	</xsl:template>
	<xsl:template name="UnitLineSchQp2">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:param name="Line" select="'1a'"/>
		<xsl:param name="L4" select="false()"/>
		<xsl:if test="not($Sep)">
		<xsl:for-each select="$TargetNode">
			<tr>
				<td class="styTableCellAmtInherit" style="font-weight:bold;padding-right:2px;">
					(<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RowId"/></xsl:call-template>)
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="CYTxReattrIncmDsrgrdPymtAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="CYTaxOnAllOthDsrgrdPymtAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="OtherCurrentYearTaxesAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetIncomeAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:if test="$L4"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ForeignTaxesCreditAllowedAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AverageAssetValueAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellCtrInherit" style="">
					<input type="checkbox" class="styCkboxNM" style="">
						<xsl:attribute name="alt">Line <xsl:value-of select="$Line"/> Unit <xsl:value-of select="RowId"/> High Tax Election</xsl:attribute>
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="HighTaxElectionInd"/>
							<xsl:with-param name="BackupName">HighTaxElection<xsl:value-of select="$Line"/><xsl:value-of select="position()"/></xsl:with-param>
						</xsl:call-template>
					</input>
				</td>
				<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
			</tr>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 1)">
		<tr>
			<td class="styTableCellAmtInherit" style="padding-right:2px;font-weight:bold;">(1)</td>
			<td class="styTableCellTextInherit" style="">
				<xsl:if test="$Sep">See Add'l Data</xsl:if>&nbsp;
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L4"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="">
				<input type="checkbox" class="styCkboxNM" style="" alt="Unit 1 High Tax Election">
					<xsl:attribute name="alt">Line <xsl:value-of select="$Line"/> Unit 1 High Tax Election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">HighTaxElection<xsl:value-of select="$Line"/>-1</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 2)">
		<tr>
			<td class="styTableCellAmtInherit" style="padding-right:2px;font-weight:bold;">(2)</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L4"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="">
				<input type="checkbox" class="styCkboxNM" style="" alt="Unit 2 High Tax Election">
					<xsl:attribute name="alt">Line <xsl:value-of select="$Line"/> Unit 2 High Tax Election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">HighTaxElection<xsl:value-of select="$Line"/>-2</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	</xsl:template>
	<xsl:template name="SingLineSchQ">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:param name="L2" select="false()"/>
		<xsl:if test="not($Sep)">
		<!--<xsl:for-each select="$TargetNode">-->
			<td class="styTableCellCtrInherit" style="">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/CountryCd"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/GrossIncomeAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/DefinitelyRltdExpnssAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/RelatedPersonIntExpnsAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/OtherInterestExpenseAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/RsrchExperimentalExpnssAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;border-right-width:0px;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/OtherExpenseAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
		<!--</xsl:for-each>-->
	</xsl:if>
	<xsl:if test="$Sep">
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellTextInherit" style="">
				See Add'l Data
			</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;"><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
	</xsl:if>
	</xsl:template>
	<xsl:template name="SingLineSchQp2">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:param name="L2" select="false()"/>
		<xsl:if test="not($Sep)">
		<!--<xsl:for-each select="$TargetNode">-->
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/CYTxReattrIncmDsrgrdPymtAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/CYTaxOnAllOthDsrgrdPymtAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/OtherCurrentYearTaxesAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/NetIncomeAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/ForeignTaxesCreditAllowedAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="">
				<xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/AverageAssetValueAmt"/>
					<xsl:with-param name="MaxSize" select="17"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
		<!--</xsl:for-each>-->
	</xsl:if>
	<xsl:if test="$Sep">
			<td class="styTableCellTextInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>See Add'l Data</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style=""><xsl:if test="$L2"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
	</xsl:if>
	</xsl:template>
	<xsl:template name="TotCellsSchQ">
		<xsl:param name="TargetNode"/>
		<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalGrossIncomeAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalDefinitelyRltdExpnssAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalRelatedPersonIntExpnsAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherInterestExpnsAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalRsrchExptlExpnssAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherExpensesAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="TotCellsSchQp2">
		<xsl:param name="TargetNode"/>
		<xsl:param name="L4" select="false()"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotCYTxReattrIncmDsrgrdPymtAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotCYTaxOnAllOthDsrgrdPymtAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalOtherCurrentYearTaxAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalNetIncomeAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:if test="$L4"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalAllowedFrgnTaxCreditAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalAverageAssetValueAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
		<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
		<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
	</xsl:template>
	<xsl:template name="UnitLineSep">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Line"/>
		<xsl:param name="L4" select="false()"/>
		<xsl:param name="Single" select="false()"/>
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<xsl:if test="not($Single)">
						<th class="styDepTblCell" scope="col" style="width:72mm;font-weight:normal;font-style:italic;text-align:left;padding-left:6px;">
							Row ID and Unit Name
						</th>
					</xsl:if>
					<th class="styDepTblCell" scope="col" style="width:10mm;font-weight:normal;">
						<strong>(i)</strong><br /> Country <br /> Code
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(ii)</strong><br /> Gross Income
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(iii)</strong><br /> Definitely Related Expenses
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(iv)</strong><br /> Related Person Interest Expense
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(v)</strong><br /> Other Interest Expense
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(vi)</strong><br /> Research &amp; Experimental Expenses
					</th>
					<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
						<strong>(vii)</strong><br /> Other Expenses <br /> (attach schedule)
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$TargetNode">
					<tr style="vertical-align:top;border-color:black;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:if test="not($Single)">
							<td class="styTableCellTextInherit" style="">
								<strong>(<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RowId"/></xsl:call-template>)</strong> 
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="QBUName/BusinessNameLine2Txt">
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</td>
						</xsl:if>
						<td class="styTableCellCtrInherit" style="">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="CountryCd"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DefinitelyRltdExpnssAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RelatedPersonIntExpnsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherInterestExpenseAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RsrchExperimentalExpnssAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherExpenseAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<xsl:if test="$Single">
						<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">Country Code</th>
					</xsl:if>
					<xsl:if test="not($Single)">
						<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">Row ID</th>
					</xsl:if>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(viii)</strong><br /> Current Year Tax on Reattributed Income From Disregarded Payments
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(ix)</strong><br /> Current Year Tax on All Other Disregarded Payments
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(x)</strong><br /> Other Current <br /> Year Taxes
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(xi)</strong><br /> Net Income <br /> (column (ii) less columns (iii) through (x))
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(xii)</strong><br /> Foreign Taxes for <br /> Which Credit Allowed <br /> (U.S. Dollars)
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						<strong>(xiii)</strong><br /> Average Asset Value
					</th>
					<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">
						<strong>(xiv)</strong><br /> High Tax Election
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						Reserved
					</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
						Reserved
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$TargetNode">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:choose>
							<xsl:when test="$Single">
								<td class="styTableCellCtrInherit" style="">
									<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="CountryCd"/></xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styTableCellAmtInherit" style="font-weight:bold;padding-right:2px;">
									(<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RowId"/></xsl:call-template>)
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CYTxReattrIncmDsrgrdPymtAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CYTaxOnAllOthDsrgrdPymtAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherCurrentYearTaxesAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="NetIncomeAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:if test="$L4"><xsl:attribute name="style">background-color:lightgrey;</xsl:attribute></xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxesCreditAllowedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AverageAssetValueAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellCtrInherit" style="">
							<xsl:choose>
								<xsl:when test="$Single">
									<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
									&nbsp;
								</xsl:when>
								<xsl:otherwise>
									<input type="checkbox" class="styCkboxNM" style="">
										<xsl:attribute name="alt">Line <xsl:value-of select="$Line"/> Unit <xsl:value-of select="RowId"/> High Tax Election</xsl:attribute>
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="HighTaxElectionInd"/>
											<xsl:with-param name="BackupName">HighTaxElection<xsl:value-of select="$Line"/><xsl:value-of select="position()"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
