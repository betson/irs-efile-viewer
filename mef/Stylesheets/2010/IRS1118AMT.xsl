<?xml version="1.0" encoding="UTF-8"?>

<!-- Last modified on 10/28/2009 by Sandy Cram Updates made per WSP-092600OTH -->
<!-- Last modified on 11/09/2009 by Sandy Cram  Updates made per WSP-092385OTH -->
<!-- Last modified on 1/11/2010 by Sandy Cram  for defect 24350 correction -->
<!-- Last modified on 3/3/2010 by Sandy Cram  for defect 24350 correction -->
<!-- 09/01/10 - Modified by Jeremy Nichols for defect 27058 -->
<!-- 09/03/10 - Modified by Jeremy Nichols to match element names in schema changes for UWR WSP101975OTH -->
<!-- 12/07/10 - Modified revision date per ITAMS #7761023 - Jeremy Nichols -->
<!-- 01/21/2011 - Modified by Jeremy Nichols for defect 27058 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1118AMTStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1118Data" select="$RtnDoc/IRS1118AMT"/>
	<xsl:param name="Form1118ScheduleA" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleA"/>
	<xsl:param name="Form1118ScheduleB" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleB"/>
	<xsl:param name="Form1118ScheduleC" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleC"/>
	<xsl:param name="Form1118ScheduleD" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleD"/>
	<xsl:param name="Form1118ScheduleE" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleE"/>
	<xsl:param name="Form1118ScheduleF" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleF"/>
	<xsl:param name="Form1118ScheduleG" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleG"/>
	<xsl:param name="Form1118ScheduleH" select="$RtnDoc/IRS1118AMT/IRS1118AMTScheduleH"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1118Data)"/>
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
				<meta name="Description" content="IRS Form 1118 AMT"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1118AMTStyle"/>
						<xsl:call-template name="AddOnStyle"/>
			</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1118">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<div class="styTBB" style="width:256mm;height:22mm;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
							<div style="height:10mm">
            Form<span class="styFormNumber"> 1118<br/>
								</span>            
            (Rev. December 2010)
          </div>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118Data"/>
							</xsl:call-template>
							 

							<br/>
							<div style="height:8mm">
								<span class="styAgency">Internal Revenue Service</span>
								<br/>
								<span class="styAgency">Department of the Treasury</span>
							</div>
						</div>
						<div class="styFTBox" style="width:178mm;height:22mm;">
							<div class="styMainTitle">Foreign Tax Credit—Corporations
            
							</div>
							
							<div class="styFBT" style="height:4mm; margin-top:0px">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> See separate instructions.
          </div>
          <div class="styFBT" style="height:4mm; margin-top:0px">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> Attach to the corporation’s tax return.          </div>
							
							<div style="text-align:center;margin-top:2mm">For calendar year 
            <span style="width: 20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>,
            or other tax year beginning 
            <span style="width: 20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,
            and ending 
            <span style="width: 20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:45mm;height:22mm;">
							<div style="text-align:center;padding-top:10mm;">OMB No. 1545-0122</div>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:189mm;height:8mm;font-size:7pt;">
          Name of corporation<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationName/BusinessNameLine2"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:65mm;height:8mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Employer identification number<br/>
							<br/>
							<span class="styNormalText">
								<xsl:choose>
									<xsl:when test="$Form1118Data/CorporationEIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form1118Data/MissingEINReason != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118Data/MissingEINReason"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--BEGIN CATEGORY OF INCOME SECTION -->
					<div class="styBB" style="width:256mm;">
        Use a <span class="styBoldText">separate</span> Form 1118 for each applicable category of income
        listed below. See <span class="styBoldText">Categories of Income</span> in the instructions.
        Also, see <span class="styBoldText">Specific Instructions</span> .<br/>
        Check only one box on each form.<br/>
						<br/>
						<div style="height:16mm;width:47mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/PassiveIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataPassiveIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/PassiveIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataPassiveIncome</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;">Passive Category Income</span>
							</label>
							<br/>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/GeneralLimitationIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataGeneralLimitationIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/GeneralLimitationIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataGeneralLimitationIncome</xsl:with-param>
								</xsl:call-template>General Category Income
          </label>
						</div>
						<div style="height:16mm;width:108mm;float:left;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/Section901jIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataSection901jIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/Section901jIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataSection901jIncome</xsl:with-param>
								</xsl:call-template>Section 901(j) Income: Name of Sanctioned Country
          </label>
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/Section901jIncome/@sanctionedCountryName"/>
								</xsl:call-template>
							</span>
							<br/>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/TreatyResourcedIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataTreatyResourcedIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/TreatyResourcedIncome"/>
									<xsl:with-param name="BackupName">IRS1118DataTreatyResourcedIncome</xsl:with-param>
								</xsl:call-template>Income Re-sourced by Treaty
          </label>: Name of Country <img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 30mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/TreatyResourcedIncome/@countryName"/>
								</xsl:call-template>
							</span>
							<br/>
						</div>
					</div>
					<!--END CATEGORY OF INCOME SECTION -->
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule A</div>
						<div class="styIRS1118TitleDesc" style="width:228.8mm;">Income or (Loss) Before Adjustments
          <span class="styItalicText" style="font-weight:normal">(Report all amounts in U.S. dollars. See <b>Specific Instructions</b>.)</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IBActn' "/>
								<xsl:with-param name="imageID" select=" 'IBAimg' "/>
								<xsl:with-param name="buttonID" select=" 'IBAbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END SCHEDULE A TITLE -->
					<!-- BEGIN INCOMEORLOSS TABLE -->
					<div class="styTableContainerLandscape" id="IBActn" style="height:71mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" rowspan="3">
										<span style="width:4px;height:27mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:21mm;height:27mm;" rowspan="3" scope="col">1. <span class="styNormalText">Foreign Country or U.S. Possession (Enter two-letter code; see instructions. Use a separate line for each.)*</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:229mm;height:5mm;" colspan="9" scope="col">Gross Income or (Loss) From Sources Outside the United States (<span class="styItalicText">INCLUDE</span> Foreign Branch Gross Income here <span class="styItalicText">and</span> on Schedule F)</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;height:11mm;" colspan="2" scope="col">2. <span class="styNormalText">Deemed Dividends (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;height:11mm;" colspan="2" scope="col">3. <span class="styNormalText">Other Dividends</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:22mm;" rowspan="2" scope="col">4. <span class="styNormalText">Interest</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:22mm;" rowspan="2" scope="col">5. <span class="styNormalText">Gross Rents, Royalties, and License Fees</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:22mm;" rowspan="2" scope="col">6. <span class="styNormalText">Gross Income From Performance of Services</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:29mm;height:22mm;" rowspan="2" scope="col">7. <span class="styNormalText">Other (attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:22mm;" rowspan="2" scope="col">8. <span class="styNormalText">Total (add columns 2(a) through 7)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowID"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="width:21mm;text-align:left;">
												<span class="styTableCellPad"/>
												<!-- change 1 -->
												<xsl:if test="ForeignCountryOrUSPossessionCd != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode"
														 select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(ForeignCountryOrUSPossNOL != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="ForeignCountryOrUSPossNOL"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(ForeignCountryOrUSPossRICs != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode"
														 select="ForeignCountryOrUSPossRICs"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(ForeignCountryOrUSPossHTKO != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode"
														 select="ForeignCountryOrUSPossHTKO"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignCountryOrUSPoss863B != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="ForeignCountryOrUSPoss863B"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedDividendsExcludeGrossUp"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedDividendsGrossUp"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Interest"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;">
												<!-- Form to form link -->
												<div style="float:left; clear:none; width: 4mm">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments/OtherIncomeOrLoss"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 1) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchAPartI">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchAPartI">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 2) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 3) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 4) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 5) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 6) or ((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="text-align:left;" colspan="2">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="text-align:left;" colspan="2">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDeemedDivExcludeGrossUp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeemedDividendsGrossUp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDivExcludeGrossUp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDividendsGrossUp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalInterest"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotGrossRentsRoyaltiesLcnsFees"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotPerformanceOfSrvcGrossIncm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherIncomeOrLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/GrandTotGrossIncmOrLossOutsdUS"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<div class="styBB" style="width:256mm">* For section 863(b) income, NOLS, income from RICs, and high-taxed income, use a single line (see instructions).</div>
					<!-- END INCOMEORLOSS TABLE -->
					<!-- BEGIN DEDUCTIONS TABLE -->
					<div class="styBB" style="width:256mm;height:5mm;text-align:center;padding-top:1mm;float:none;clear:none;">
						<div class="styGenericDiv" style="width:251.8mm;"/>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'DEDctn' "/>
								<xsl:with-param name="imageID" select=" 'DEDimg' "/>
								<xsl:with-param name="buttonID" select=" 'DEDbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styIRS1118TableContainerLandscape" style="height:65mm;" id="DEDctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" rowspan="4">
										<span style="width:4px"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:222mm;font-size:7pt;padding-top:1mm;padding-bottom:1mm;" colspan="8" scope="col">Deductions (<span class="styItalicText">INCLUDE</span> Foreign Branch Deductions here <span class="styItalicText">and</span> on Schedule F)</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm" rowspan="4" scope="col">13. <span class="styNormalText">Total Income or (Loss) Before Adjustments (subtract column 12 from column 8)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:160mm" colspan="5" scope="col">9. Definitely Allocable Deductions</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="3" scope="col">10. <span class="styNormalText">Apportioned Share of Deductions Not Definitely Allocable (enter amount from applicable line of Schedule H, Part II, column (d))</span>
									</th>
									<!-- 11 -->
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="3" scope="col">11. <span class="styNormalText">Net Operating Loss Deduction</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="3" scope="col">12. <span class="styNormalText">Total Deductions (add columns 9(e) through 11)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:64mm" colspan="2" scope="col">
										<span class="styNormalText">Rental, Royalty, and Licensing Expenses</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="2" scope="col">(c) <span class="styNormalText">Expenses Related to Gross Income From Performance of Services</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="2" scope="col">(d) <span class="styNormalText">Other Definitely Allocable Deductions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="2" scope="col">(e) <span class="styNormalText">Total Definitely Allocable Deductions (add columns 9(a) through 9(d))</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" scope="col">(a) <span class="styNormalText">Depreciation, Depletion, and Amortization</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" scope="col">(b) <span class="styNormalText">Other Expenses</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 7) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowID"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RentalRoyaltyDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RentalRoyaltyOtherExpenses"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PerfOfServicesGrossIncmExpnss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NotAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- 11 -->
											<td class="styTableCell" style="width:32mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetOperatingLossDeduction"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotIncmOrLossBeforeAdjustments"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows income or (loss) before adjustments Schedule A Deductions-->
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 1) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchAPartII">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchAPartII">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 2) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 3) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 4) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 5) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &lt; 6) or ((count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118Data/IRS1118AMTScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr">
												<span class="styTableCellPad" style="font-weight:bold">Totals</span>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:25mm">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr">
												<span class="styTableCellPad" style="font-weight:bold">Totals</span>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotalRentalRoyaltyDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotalRentalRoyaltyOtherExpnss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotPerfOfSrvcGrossIncmExpnss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotalOtherAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/GrandTotalAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- line 10 -->
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotalNotAllocableDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- line 11 -->
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/TotalNetOperatingLossDeduction"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- line 12 -->
											<td class="styTableCell" style="width:32mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/GrandTotalDeductions"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118Data/IRS1118AMTScheduleA/GrandTotIncmOrLossBeforeAdj"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- END DEDUCTIONS TABLE -->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right">
          Cat. No. 10900F 
          <span style="width:140px"/>
          Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)
        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE B TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule B</div>
						<div class="styIRS1118TitleDesc">
          Foreign Tax Credit
          <span class="styItalicText" style="font-weight:normal">(Report all foreign tax amounts in U.S. dollars.)</span>
						</div>
					</div>
						<!-- END SCHEDULE B TITLE -->
					<!-- BEGIN SCHEDULE B PART I -->
					<!-- BEGIN SCHEDULE B PART I TABLE -->
					<div class="styBB" style="width:256mm;float:none;display:table-header-group;">
						<div class="styIRS1118TitleDesc" style="width:252mm">Part I—Foreign Taxes Paid, Accrued, and Deemed Paid
           <span class="styItalicText" style="font-weight:normal">(see instructions)</span>
							<!--COUNT: <xsl:value-of select="count(Form1118ScheduleB/ForeignTaxesPaidAndAccrued)"/-->
						</div>
						<div class="styGenericDiv" style="width:3mm">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidAndAccrued"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'FTPctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="FTPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="height: 66mm">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" style="height:22.5mm;" rowspan="3">
										<span class="styTableCellPad" style="font-weight:bold"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" rowspan="2" colspan="2" style="width:30mm;height:15mm;">
										<br/>
                1. <span class="styNormalText">Credit is Claimed for Taxes:</span>
										<br/>
										<br/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Paid</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
										</xsl:call-template>
										<!-- Added to show the pushpins -->
										<span style="width:4mm;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Accrued</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
										</xsl:call-template>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:192mm;height:7.5mm;" colspan="8">2. <span class="styNormalText">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="height:7.5mm;" rowspan="3">3. <span class="styNormalText">Tax Deemed Paid (from Schedule C- Part I, column 10, Part II, column 8(b), and Part III, column 8)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:72mm;height:7.5mm;" colspan="3">
										<span class="styNormalText">Tax Withheld at Source on:</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:96mm;height:7.5mm;" colspan="4">
										<span class="styNormalText">Other Foreign Taxes Paid or Accrued On:</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:15mm;" rowspan="2">(h) <span class="styNormalText">Total Foreign Taxes Paid or Accrued (add columns 2(a) through 2(g))</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:15mm;height:7.5mm;">
										<span class="styNormalText">Date Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:15mm;height:7.5mm;">
										<span class="styNormalText">Date Accrued</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(a) <span class="styNormalText">Dividends</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(b) <span class="styNormalText">Interest</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(c) <span class="styNormalText">Rents, Royalties, and License Fees</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(d) <span class="styNormalText">Section 863(b) Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(e) <span class="styNormalText">Foreign Branch Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(f) <span class="styNormalText">Services Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:24mm;height:7.5mm;">(g) <span class="styNormalText">Other</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 7) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleB/ForeignTaxesPaidAndAccrued">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr" scope="row">
												<span class="styTableCellPad" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowID"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="width:15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DatePaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:15mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateAccrued"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldOnDividends"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldOnInterest"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldOnRentsAndRoyalties"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxPdOrAccruedOnSect863bIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxPaidOrAccruedOnBranchIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxPdOrAccruedOnServicesIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxPaidOrAccruedOnOtherIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrued"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule B - foreign tax credits -->
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 1) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchBPartI">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchBPartI">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 2) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 3) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 4) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 5) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &lt; 6) or ((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="text-align:left;">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="text-align:left;">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOnDividends"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOnInterest"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTaxWithheldOnRentsRoyalties"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnSect863bIncm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnBranchIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnServicesIncm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnOtherIncome"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/GrandTotalForeignTaxesPdOrAccr"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidAndAccrued"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'FTPctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE B PART I TABLE -->
					<!-- BEGIN SCHEDULE B PART II TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part II—Separate Foreign Tax Credit
          <span class="styItalicText" style="font-weight:normal">(Complete a </span>
							<span class="styItalicText" style="font-weight:bold">separate</span>
							<span class="styItalicText" style="font-weight:normal"> Part II for </span>
							<span class="styItalicText" style="font-weight:bold">each</span>
							<span class="styItalicText" style="font-weight:normal"> applicable category of income.)</span>
						</div>
					</div>
					<!-- END SCHEDULE B PART II TITLE -->
					<!-- BEGIN SCHEDULE B PART II -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDescLandscape" style="width:184mm">Total foreign taxes paid or accrued (total from Part I, column 2(h))
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/GrandTotalForeignTaxesPdOrAccr"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BVR -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDescLandscape" style="width:184mm">Total taxes deemed paid (total from Part I, column 3)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaid"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDescLandscape" style="width:184mm">
          Reductions of taxes paid, accrued, or deemed
          paid (enter total from Schedule G)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TotalTaxReductions"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDescLandscape" style="width:184mm">
          Taxes reclassified under high-tax kickout
            <!--Dotted Line-->
							<span style="font-weight:bold;;">
								<span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
                 <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TaxesReclassifiedUnderHTKO"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
										<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDescLandscape" style="width:184mm;">Enter the sum of any carryover of foreign taxes (from Schedule K, line 3, column (xiv) plus any carrybacks to the current tax year)
          <!-- Form to Form links -->
							<!--<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalCarryoverOfForeignTaxes"/>
							</xsl:call-template>-->
							<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
							<span style="width:16px"/>.
						          <span style="width:16px"/>.
	                             
          </span>
						</div>
						<div class="styLNAmountBox" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/EnterTheSumOfAnyCarryover"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" />
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDescLandscape">Total foreign taxes (combine lines 1 through 5)
                    <!--Dotted Line-->
                    <span class="styNoAudioRead" style="font-weight:bold;">
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    </span>
                    <!--Pen and ink image -->
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 6 - Total Foreign Tax</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxes/@taxReclassifiedUnderHTKO"/>
                    </xsl:call-template>						
						</div>
						<div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxes"/>
              </xsl:call-template>
            </div>
					</div>
					
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDescLandscape">Enter the amount from the applicable column of Schedule J, Part I, line 11 (see instructions). If Schedule J is <b>not</b> required
          to be completed, enter the result from the "Totals" line of column 13 of the applicable
          Schedule A
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SchJAmountOrTotIncmBeforeAdj"/>
								</xsl:call-template>
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SchJAmountOrTotIncmBeforeAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="styLNDescLandscape" style="width:184mm">Total taxable income from all sources (enter
          taxable income from the corporation's tax return)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox" style="border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxableIncome"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm">b</div>
						<div class="styLNDescLandscape" style="width:184mm">Adjustments to line 8a (see instructions)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxableIncomeAdjustments"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm">c</div>
						<div class="styLNDescLandscape">Subtract line 8b from line 8a
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxableIncomeMinusAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDescLandscape">Divide line 7 by line 8c. Enter the resulting fraction as a decimal (see instructions). If line 7 is greater than line 8c, enter 1
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotIncmDivByTotTaxableLessAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDescLandscape">Total U.S. income tax against which credit is allowed (regular tax liability (see section 26(b)) minus American Samoa economic development credit)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalUSCreditAllowedIncomeTax"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDescLandscape">Credit limitation (multiply line 9 by line 10) (see instructions)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditLimitation"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDescLandscape">
							<span class="styBoldText">Separate foreign tax credit</span>
          (enter the smaller of line 6 or line 11 here and on the appropriate line of Part III)
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SeparateForeignTaxCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END SCHEDULE B PART II-->
					<!-- BEGIN SCHEDULE B PART III TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part III—Summary of Separate Credits
          <span style="font-weight:normal">(Enter amounts from Part II, line 12 for </span>each
          <span style="font-weight:normal">applicable category of income. </span>
							<b> Do not </b>
							<span style="font-weight:normal">include taxes paid to sanctioned countries.)</span>
						</div>
					</div>
					<!-- END SCHEDULE B PART III TITLE -->
					<!-- BEGIN SCHEDULE B PART III -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDescLandscape" style="width:184mm">Credit for taxes on passive category income
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/PassiveIncomeTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDescLandscape" style="width:184mm">Credit for taxes on general category income
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/GeneralIncomeTaxCr"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDescLandscape" style="width:184mm">
          Credit for taxes on income re-sourced by treaty (combine all such credits on this line)
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/TreatyResourcedIncomeTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDescLandscape">Total (add lines 1 through 3)
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/SubTotalSeparateTaxCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDescLandscape">
          Reduction in credit for international boycott operations (see instructions)
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/IntntlBoycottCreditReduction"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDescLandscape">
							<span class="styBoldText">Total foreign tax credit</span>
          (subtract line 5 from line 4). Enter here and on the appropriate line of 
          the corporation's tax return
          <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
						</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/TotalForeignTaxCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END SCHEDULE B PART III-->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
          Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)
        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE C -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule C</div>
						<span class="styIRS1118TitleDesc">Tax Deemed Paid by Domestic Corporation Filing Return</span>
						<div style="margin-left: 14mm; width: 220mm; float:left; clear:none">
							<span class="styItalicText">Use this schedule to figure the tax deemed paid by the corporation
          with respect to dividends from a first-tier foreign corporation under section 902(a), and
          deemed <br/> inclusions of earnings from a first- or lower-tier foreign corporation under section
          960(a). <span class="styBoldText">Report all amounts in U.S. dollars unless otherwise
          specified. </span>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE C PART I-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DIVDIPST1986ctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:29mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends and Deemed Inclusions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:27mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:21mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
										<span style="width:2px"/>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule D, Part I-see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 8) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- column 4 -->
											<td class="styTableCellSmallArial" style="width:29mm;padding-top:4px;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
												<span style="width:1px"/>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DivDeemedInclsnFuncCurrency"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DivDeemedInclsnUSDollars"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:27mm;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:21mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule C Part I -->
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 1) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchCPartI">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchCPartI"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 2) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 3) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 4) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 5) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 6) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 7) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartI"/>
								</xsl:if>
								<!-- End of filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="10">
												<span class="styBoldText">Total</span> (Add amounts in column 10. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmallArial" style="width:25mm;">
												<span style="width:2px;"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="10">
												<span class="styBoldText">Total</span> (Add amounts in column 10. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmallArial" style="width:25mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid1"/>
												</xsl:call-template>
												<span style="width:1px"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE C PART I-->
					<!-- BEGIN SCHEDULE C PART II-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part II—Dividends Paid Out of Pre-1987 Accumulated Profits</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'DIVPRE1987ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:56mm;" id="DIVPRE1987ctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm;" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:34mm;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency computed under section 902) (attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid on Earnings and Profits (E&amp;P) for Tax Year Indicated (in functional currency) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:56mm;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm;" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:56mm;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 6) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DivPaidPre1987AccumProfits">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="width:28mm;text-align:left;padding-right:3px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;padding-right:3px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;padding-right:3px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:34mm">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits/AccumulatedProfits"/>
													</xsl:call-template>
												</div>
												<div style="padding-top:.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
													</xsl:call-template>
													<span style="width:3px;"/>
												</div>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:3px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EarnAndPrftTaxesPdAndDeemedPd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:3px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DivPaidFunctionalCurrency"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:3px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidUSDollars"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:22mm;padding-right:3px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:3px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:25mm;padding-right:3px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule C Part II -->
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 1) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchCPartII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchCPartII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 2) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 3) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 4) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 5) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartII"/>
								</xsl:if>
								<!-- End of filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="8">
												<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;padding-right:3px;"/>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="8">
												<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'DIVPRE1987ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE C PART II-->
					<!-- BEGIN SCHEDULE C PART III-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part III—Deemed Inclusions From Pre-1987 Earnings and Profits</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'DIPRE1987ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DIPRE1987ctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" rowspan="2" scope="col">4. <span class="styNormalText">E&amp;P for Tax Year Indicated (in functional currency translated from U.S. dollars, computed under section 964) (attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:66mm" colspan="2" scope="col">6. <span class="styNormalText">Deemed Inclusions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" rowspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (multiply column 5 by column 7)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 6) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="width:33mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:33mm">
												<div style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts/EarningsAndProfits"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EarningsAndProfits"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:33mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:33mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedInclsnFunctionalCurrency"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:33mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedInclusionsUSDollars"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:33mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DeemedInclsnToEarnPrftsRatio"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule C Part III -->
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 1) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchCPartIII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchCPartIII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 2) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 3) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 4) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 5) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIII"/>
								</xsl:if>
								<!-- End of filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="7">
												<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS1118TableLastCol" id="DIPRE1987spcr"/>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:0px;" colspan="7">
												<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
											<td class="styIRS1118TableCellNW">
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid3"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS1118TableLastCol" id="DIPRE1987spcr"/>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'DIPRE1987ctn' "/>
					</xsl:call-template>
					<!-- Set Initial Height of Above Table -->
					<!-- END SCHEDULE C PART III-->
					<!-- END SCHEDULE C -->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
          Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)
        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE D -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule D</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by First- and Second-Tier Foreign Corporations under Section 902(b)  </div>
						<div style="margin-left: 14mm; width: 220mm; float:left; clear:none">
							<i>Use Part I to compute the tax deemed paid by a first-tier foreign
          corporation with respect to dividends from a second-tier foreign corporation. Use Part II
          to<br/>compute the tax deemed paid by a second-tier foreign corporation with respect to
          dividends from a third-tier foreign corporation.</i>
							<span class="styBoldText">
								<i> Report all amounts in U.S.<br/>dollars unless otherwise
          specified.</i>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE D PART I-->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part I—Tax Deemed Paid by First-Tier Foreign Corporations</div>
					</div>
					<!-- BEGIN SCHEDULE D PART I SECTION A -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;">Section A—Dividends Paid Out of Post-1986 Undistributed Earnings
          <span style="font-weight:normal">(Include the column 10 results in Schedule C, Part I,
            column 6(b).)
          </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '1TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="1TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="text-align:left;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:30mm;padding-right:2px;">
												<div class="styGenericDiv" style="float:left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<div style="padding-top:.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;width:20mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFirstTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:20mm;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part I Section A -->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartISecA">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartISecA"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '1TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART I SECTION A -->
					<!-- BEGIN SCHEDULE D PART I SECTION B -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;">Section B—Dividends Paid Out of Pre-1987 Accumulated Profits
          <span style="font-weight:normal">(Include the column 8(b) results in Schedule C, Part I,
            column 6(b).)
          </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '1TAPctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:50mm;" id="1TAPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm;" rowspan="2" scope="col">1. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:34mm" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency-see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:30mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:48mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Functional Currency of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 6) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends2ndTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="width:28mm;text-align:left;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:34mm;padding-right:2px;">
												<div style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier/AccumulatedProfits"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:28mm;padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFirstTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:30mm;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:24mm;padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:24mm;padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part I Section B -->
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 1) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartISecB">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartISecB"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 2) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 3) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 4) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 5) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '1TAPctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART I SECTION B -->
					<!-- END SCHEDULE D PART I-->
					<!-- BEGIN SCHEDULE D PART II -->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part II—Tax Deemed Paid by Second-Tier Foreign Corporations</div>
					</div>
					<!-- BEGIN SCHEDULE D PART II SECTION A -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;">Section A—Dividends Paid Out of Post-1986 Undistributed Earnings
          <span style="font-weight:normal">(Include the column 10 results in Section A, column 6(b),
            of Part I above.)
          </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends3rdTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '2TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="2TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule E, Part I, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends3rdTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="text-align:left;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:30mm;padding-right:1px;">
												<div class="styGenericDiv" style="float:left;clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends3rdTier/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<div style="padding-top:.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</div>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:18mm;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part II Section A -->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartIISecA">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartIISecA"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends3rdTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '2TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART II SECTION A -->
					<!-- BEGIN SCHEDULE D PART II SECTION B TABLE -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;">Section B—Dividends Paid Out of Pre-1987 Accumulated Profits
          <span style="font-weight:normal">(Include the column 8(b) results in Section A,
            column 6(b), of Part I above.)
          </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends3rdTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '2TAPctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="2TAPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:34mm" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency-attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency-see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:56mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(a) <span class="styNormalText">In Functional Currency of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 6) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends3rdTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="width:28mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:34mm">
												<div style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends3rdTier/AccumulatedProfits"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:28mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:28mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:28mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:28mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:28mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part II Section B -->
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 1) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartIISecB">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartIISecB"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 2) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 3) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 4) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &lt; 5) or ((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends3rdTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '2TAPctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART II SECTION B TABLE -->
					<!-- END SCHEDULE D PART II-->
					<!-- END SCHEDULE D-->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
          Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)
        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">5</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE E-->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule E</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by Certain Third-, Fourth-, and Fifth-Tier Foreign Corporations Under Section 902(b) </div>
						<div style="margin-left: 14mm; width: 220mm; float:left; clear:none">
							<i>Use this schedule to report taxes deemed paid with respect to
          dividends from eligible post-1986 undistributed earnings of fourth-, fifth-, and
          sixth-tier<br/>controlled foreign corporations.</i>
							<span class="styBoldText">
								<i> Report all amounts in U.S. dollars unless otherwise
          specified.</i>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE E -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part I—Tax Deemed Paid by Third-Tier Foreign Corporations
          <span style="font-weight:normal">(Include the column 10 results in Schedule D, Part II
            Section A, column 6(b).)
          </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends4thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '3TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN SCHEDULE E PART I-->
					<div class="styTableContainerLandscape" id="3TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Fourth-Tier Foreign Corporation and Its Related Third-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part II, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Of Third-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 7) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends4thTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="text-align:left;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:38mm;padding-right:2px;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends4thTier/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<div style="padding-top:.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFourthTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:18mm;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part I -->
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 1) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartI">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 2) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 3) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 4) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 5) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends4thTier) &lt; 6) or ((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends4thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '3TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE E PART I-->
					<!-- BEGIN SCHEDULE E PART II-->
					<!-- BEGIN FOURTHTIER_TAX TABLE-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part II—Tax Deemed Paid by Fourth-Tier Foreign Corporations
          <span style="font-weight:normal">(Include the column 10 results in column 6(b) of Part I above.)</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends5thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '4TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:56mm;" id="4TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Fifth-Tier Foreign Corporation and Its Related Fourth-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part III, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(a) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:22mm" scope="col">(b) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 7) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends5thTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="text-align:left;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:38mm;padding-right:2px;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends5thTier/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<div style="padding-top:.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFifthTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFourthTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:18mm;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="padding-right:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part II -->
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 1) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 2) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 3) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 4) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 5) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends5thTier) &lt; 6) or ((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends5thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '4TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END FOURTHTIER_TAX -->
					<!-- END SCHEDULE E PART II-->
					<!-- BEGIN SCHEDULE E PART III-->
					<!-- BEGIN FIFTHTIER_TAX -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm">Part III—Tax Deemed Paid by Fifth-Tier Foreign Corporations
         <span style="font-weight:normal">(Include the column 10 results in column 6(b) of Part II above.)</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends6thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '5TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="5TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Sixth-Tier Foreign Corporation and Its Related Fifth-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" rowspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5 and 6)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:49.5mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" scope="col">(a) <span class="styNormalText">Of Sixth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24.75mm" scope="col">(b) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 7) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends6thTier">
										<tr style="height:6mm;">
											<td class="styTableCellSmallArial" style="width:24.75mm;text-align:left;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine2"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:15mm;text-align:center;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:28mm;padding-right:1px;">
												<div style="float: left; clear: none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends6thTier/Post1986UndistributedEarnings"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24.75mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24.75mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24.75mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24.75mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfSixthTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:24.75mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidOfFifthTierCorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:25mm;padding-right:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmallArial" style="width:25mm;padding-right:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part III -->
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 1) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartIII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartIII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 2) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 3) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 4) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 5) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/UndistrEarnDividends6thTier) &lt; 6) or ((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends6thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '5TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END FIFTHTIER_TAX -->
					<!-- END SCHEDULE E PART III-->
					<!-- END SCHEDULE E-->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
          Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)
        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">6</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE F AND G-->
					<div class="styBB" style="width:256mm;clear:both;border-bottom-width:0px;">
						<div class="styIRS1118ScheduleCell">
							<!-- BEGIN GROSSINCOME TABLE -->
							<div class="styBB" style="width:127mm;">
								<div class="styTitleName">Schedule F</div>
								<div class="styIRS1118TitleDesc" style="width:95mm;height:8mm;">Gross Income and Definitely Allocable Deductions for Foreign Branches</div>
								<div class="styIRS1118TitleDesc" style="width:9mm;height:8mm;text-align:right;">
									<div style="padding-top:3.75mm;">
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed"/>
											<xsl:with-param name="containerHeight" select="7"/>
											<xsl:with-param name="containerID" select=" 'FGIctn' "/>
										</xsl:call-template>
										<!-- end button display logic -->
									</div>
								</div>
							</div>
							<div class="styIRS1118TableContainerSchF" id="FGIctn">
								<!-- print logic -->
								<xsl:call-template name="SetInitialState"/>
								<!-- end -->
								<table class="styTable" cellspacing="0" style="height: 66mm;">
									<thead class="styTableThead">
										<tr>
											<th class="styIRS1118TableCellHeaderSmall" colspan="2" style="width:47mm;height:8mm">
                    1. <span class="styNormalText">Foreign Country or U .S. Possession (Enter
two-letter code from Schedule A, column 1. Use a separate line for each.)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:39mm;height:8mm">2. <span class="styNormalText">Gross Income</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:39mm;height:8mm">3. <span class="styNormalText">Definitely Allocable Deductions</span>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- no change here -->
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 7) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print != $Separated))">
											<xsl:for-each select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed">
												<tr style="height:6mm;">
													<td class="styIRS1118TableCellLtr" style="width:8mm;text-align:center;font-weight:bold;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RowID"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:39mm;text-align:left;">
														<span style="width:4px;"/>
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
														<span style="width:4px;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:39mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncome"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:37mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DefinitelyAllocableDeductions"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Filler rows for Schedule FI -->
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 1) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:choose>
												<xsl:when test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated)">
													<xsl:call-template name="AddRowsForSchF">
														<xsl:with-param name="TargetNode">A</xsl:with-param>
														<xsl:with-param name="ShowMessage">true</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="AddRowsForSchF">
														<xsl:with-param name="TargetNode">A</xsl:with-param>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 2) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchF">
												<xsl:with-param name="TargetNode">B</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 3) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchF">
												<xsl:with-param name="TargetNode">C</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 4) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchF">
												<xsl:with-param name="TargetNode">D</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 5) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchF">
												<xsl:with-param name="TargetNode">E</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 6) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchF">
												<xsl:with-param name="TargetNode">F</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- End of filler rows -->
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated)">
												<tr style="height:6mm;">
													<td class="styTableCellSmall" colspan="2" style="width:47mm;text-align:left;border-bottom-width:0px;">
														<span style="font-weight:bold;">Totals </span>(add lines A through F)* <span style="width:10mm;text-align:right;">
															<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
														</span>
													</td>
													<td class="styTableCellSmall" style="width:39mm;border-bottom-width:0px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:37mm;border-bottom-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr style="height:6mm;">
													<td class="styTableCellSmall" colspan="2" style="width:47mm;text-align:left;border-bottom-width:0px;">
														<span style="font-weight:bold;">Totals </span>(add lines A through F)* <span style="width:10mm;text-align:right;">
															<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
														</span>
													</td>
													<td class="styTableCellSmall" style="width:39mm;border-bottom-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotalGrossIncome"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:37mm;border-bottom-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotDefinitelyAllcblDeductions"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'FGIctn' "/>
							</xsl:call-template>
							<!-- END Set Initial Height of Above Table -->
							<!-- END GROSSINCOME TABLE -->
						</div>
						<div class="styIRS1118ScheduleCell" style="border-right-width:0px;">
							<div class="styBB">
								<div class="styTitleName">Schedule G</div>
								<div class="styIRS1118TitleDesc" style="width:103mm;height:8mm;">Reductions of Taxes Paid, Accrued, or Deemed Paid</div>
							</div>
							<div style="width:127mm;float:left;clear:none;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm; border-left-width: 0px">A</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">
              Reduction of Taxes Under Section 901(e)—Attach separate <br/> schedule
              <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReduction"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReduction"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm; border-left-width: 0px">B</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">Reduction of Foreign Oil and Gas Taxes—Enter
amount from Schedule I, Part II, line 6</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OilGasExtractionTaxReduction"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:11mm;padding-top:3mm; border-left-width: 0px">C</div>
								<div class="styIRS1118LNDescRed" style="height:11mm;">Reduction of Taxes Due to International Boycott Provisions—Enter appropriate portion of Schedule C (Form 5713), line 2b. <span class="styBoldText">Important:</span> Enter only "specifically attributable taxes" here.</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/IntntlBoycottProvisionsTaxRed"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm; border-left-width: 0px">D</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">
              Reduction of Taxes for Section 6038(c) Penalty—Attach separate schedule
              <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPenaltyTaxReduction"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPenaltyTaxReduction"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="border-left-width: 0px;height:5mm;">E</div>
								<div class="styIRS1118LNDescRed" style="height:5mm;">Other Reductions of Taxes—Attach schedule(s)
                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OtherTaxReductions"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OtherTaxReductions"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;height:10mm;">
								<div class="styIRS1118LNDescRed" style="width:92mm;height:26mm;border-left-width:0px;border-bottom-width:0px;padding-top:7mm;font-size:6pt;">
									<span class="styBoldText">Total</span> (add lines A through E). Enter here and on Schedule B, Part II, line 3 </div>
								<div class="styIRS1118LNDescRed" style="width:3mm;height:26mm;padding-top:19mm;border-bottom-width:0px;">
									<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
								</div>
								<div class="styLNAmountBox" style="height:26mm;padding-top:19mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TotalTaxReductions"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText" style="font-style:normal; ">*Note:</span> The Schedule F totals are not carried over to 
                any other Form 1118 Schedule. (These totals were already included in Schedule A.) However, the IRS
               requires the corporation to complete Schedule F under the authority of section 905(b).
            </div>
						</div>
						<!--BEGIN FOOTER-->
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)</div>
						</div>
					</div>
					<!--END FOOTER-->
					<div class="pageEnd"/>
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">7</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE H PART I-->
					<div class="styBB" style="width:256mm;padding-top:2mm;padding-bottom:2mm;">
						<div class="styTitleName">Schedule H</div>
						<div class="styIRS1118TitleDesc">Apportionment of Deductions Not Definitely Allocable
          <span class="styItalicText">
								<span class="styNormalText">(complete only once)</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part I—Research and Development Deductions         </div>
					</div>
					<xsl:choose>
						<xsl:when test="( ( (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed) &gt; 2) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesCrtnDivEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedCertainDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotCrtnDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmCrtnDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncomeSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncomeTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedCertainDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedTreatyResourcedIncome) &gt; 1) )
                            and ($Print = $Separated))">
							<div style="width:256mm;clear:both;">
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<tr class="styBB">
											<td class="styIRS1118TableCell" colspan="2" rowspan="3" style="height:33mm;border-left-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCell" colspan="5" style="height:10mm;">
												<span class="styBoldText">(a)</span> Sales Method</td>
											<td class="styIRS1118TableCell" colspan="2" rowspan="2" style="height:20mm;">
												<span class="styBoldText">(b)</span> Gross Income Method-Check method used:<br/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>Option 1
                </label>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
													</xsl:call-template>Option 2</label>
												<br/>(See instructions)
              </td>
											<td class="styIRS1118TableCell" rowspan="3" style="height:30mm;border-bottom-width:0px;">
												<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
                Allocable (enter all amounts from column (a)(v) or all amounts from column (b)(vii))
              </td>
										</tr>
										<tr class="styBB">
											<td class="styIRS1118TableCell" colspan="2" style="height:10mm;">
                Product line #1 <br/>(SIC Code: <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/SICCode"/>
												</xsl:call-template>)*
              </td>
											<td class="styIRS1118TableCell" colspan="2" style="height:10mm;">
                Product line #2 <br/>(SIC Code: <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/SICCode"/>
												</xsl:call-template>)*
              </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:23mm;">
												<span class="styBoldText">(v)</span> Total R&amp;D Deductions Under Sales Method (add columns (ii) and (iv))</td>
										</tr>
										<tr class="styBB">
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(i)</span> Gross Sales</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(iii)</span> Gross Sales</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(vi)</span> Gross Income</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(vii)</span> Total R&amp;D Deductions Under Gross Income Method</td>
										</tr>
									</thead>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">1</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Totals (see instructions)</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode">$Form1118ScheduleH/ProductLineGrossSalesAndRDDed</xsl:with-param>
												<xsl:with-param name="ShortMessage">true</xsl:with-param>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">2</td>
										<td class="styIRS1118LNDescRD" style="height:4.5mm;">Total to be apportioned</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftNumBox" style="height:8mm;">3</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">a</td>
										<td class="styIRS1118LNDescRD">General category income</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">b</td>
										<td class="styIRS1118LNDescRD">Passive category income</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">c</td>
										<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div style="width:256mm;clear:both;">
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<tr class="styBB">
											<td class="styIRS1118TableCell" colspan="2" rowspan="3" style="height:33mm;border-left-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCell" colspan="5" style="height:10mm;">
												<span class="styBoldText">(a)</span> Sales Method</td>
											<td class="styIRS1118TableCell" colspan="2" rowspan="2" style="height:20mm;">
												<span class="styBoldText">(b)</span> Gross Income Method-Check method used:<br/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>Option 1
                </label>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
													</xsl:call-template>Option 2</label>
												<br/>(See instructions)
              </td>
											<td class="styIRS1118TableCell" rowspan="3" style="height:30mm;border-bottom-width:0px;">
												<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
                Allocable (enter all amounts from column (a)(v) or all amounts from column (b)(vii))
              </td>
										</tr>
										<tr class="styBB">
											<td class="styIRS1118TableCell" colspan="2" style="height:10mm;">
                Product line #1 <br/>(SIC Code: <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/SICCode"/>
												</xsl:call-template>)*
              </td>
											<td class="styIRS1118TableCell" colspan="2" style="height:10mm;">
                Product line #2 <br/>(SIC Code: <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/SICCode"/>
												</xsl:call-template>)*
              </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:23mm;">
												<span class="styBoldText">(v)</span> Total R&amp;D Deductions Under Sales Method (add columns (ii) and (iv))</td>
										</tr>
										<tr class="styBB">
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(i)</span> Gross Sales</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(iii)</span> Gross Sales</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(vi)</span> Gross Income</td>
											<td class="styIRS1118TableCell" style="height:13mm;">
												<span class="styBoldText">(vii)</span> Total R&amp;D Deductions Under Gross Income Method</td>
										</tr>
									</thead>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">1</td>
										<td class="styIRS1118LNDescRD" style="height:4.5mm;">Totals (see instructions)</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotalRDDedTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotalRDDedTotals"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">2</td>
										<td class="styIRS1118LNDescRD" style="height:4.5mm;">Total to be apportioned</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTotalToBeApportioned"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTotalToBeApportioned"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedTotToBeApprtn"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedTotToBeApprtn"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftNumBox" style="height:8mm;">3</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">a</td>
										<td class="styIRS1118LNDescRD">General category income</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesGeneralCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsGeneralCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesGeneralCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsGeneralCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotRDDedGenCatIncm"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeGeneralCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedGenCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedGeneralCategoryIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">b</td>
										<td class="styIRS1118LNDescRD">Passive category income</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesPassiveCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsPassiveCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesPassiveCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsPassiveCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotRDDedPassiveIncm"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomePassiveCatIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedPassiveIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedPassiveCategoryIncome"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB">c</td>
										<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesSection901jIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedSection901jIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesSection901jIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedSection901jIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncomeSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeSection901jIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDedSection901jIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedSection901jIncome"/>
										</xsl:call-template>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTreatyRscIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTreatyRscIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTreatyRscIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTreatyRscIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTreatyRscIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTreatyRscIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTreatyRscIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTreatyRscIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncomeTreatyRscIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTreatyRscIncome"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDedTreatyResourcedIncome)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedTreatyResourcedIncome"/>
										</xsl:call-template>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotalRDDedTotalFrgn"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotalRDDedTotalFrgn"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalRDDedTotalForeign"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
							<!-- Repeat Column Code -->
							<xsl:for-each select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed">
								<xsl:if test="(position() mod 4) = 3">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<div style="width:256mm;clear:both;">
										<table class="styTable" cellspacing="0">
											<thead class="styTableThead">
												<tr>
													<td class="styIRS1118TableCell" colspan="2" rowspan="3" style="height:18mm;border-left-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118TableCell" colspan="8" style="height:4mm;">Sales Method</td>
												</tr>
												<tr>
													<td class="styIRS1118TableCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SICCode"/>
														</xsl:call-template>)*</td>
													<td class="styIRS1118TableCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 1"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/SICCode"/>
														</xsl:call-template>)*</td>
													<td class="styIRS1118TableCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 2"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/SICCode"/>
														</xsl:call-template>)*</td>
													<td class="styIRS1118TableCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 3"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/SICCode"/>
														</xsl:call-template>)*</td>
												</tr>
												<tr>
													<td class="styIRS1118TableCell" style="height:4mm;">Gross Sales</td>
													<td class="styIRS1118TableCell" style="height:4mm;">R&amp;D Deductions</td>
													<td class="styIRS1118TableCell" style="height:4mm;">Gross Sales</td>
													<td class="styIRS1118TableCell" style="height:4mm;">R&amp;D Deductions</td>
													<td class="styIRS1118TableCell" style="height:4mm;">Gross Sales</td>
													<td class="styIRS1118TableCell" style="height:4mm;">R&amp;D Deductions</td>
													<td class="styIRS1118TableCell" style="height:4mm;">Gross Sales</td>
													<td class="styIRS1118TableCell" style="height:4mm;">R&amp;D Deductions</td>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">1</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Totals (see pages 8 and 9 of instructions)</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsTotals"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">2</td>
													<td class="styIRS1118LNDescRD" style="height:4.5mm;">Total to be apportioned</td>
													<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
														<span style="width:4px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDedTotalToBeApportioned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
														<span style="width:4px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTotalToBeApportioned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
														<span style="width:4px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTotalToBeApportioned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
														<span style="width:4px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedTotalToBeApportioned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftNumBox" style="height:8mm;">3</td>
													<td class="styIRS1118LNDescRD" style="border-bottom-width:0px;height:8mm;">Apportionment among statutory groupings:</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;">
														<span style="width:4px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB">a</td>
													<td class="styIRS1118LNDescRD">General category income</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsGeneralCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB">b</td>
													<td class="styIRS1118LNDescRD">Passive category income</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsPassiveCatIncome"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB">c</td>
													<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDedSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="RDDedSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesSection901jIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDedTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="RDDedTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTreatyRscIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTreatyRscIncome"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedTreatyRscIncome"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsTotalForeign"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</xsl:if>
							</xsl:for-each>
							<!-- END Repeat Column Code -->
						</xsl:otherwise>
					</xsl:choose>
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">*Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H </span>in instructions</span>
							</div>
						</div>
						<!--BEGIN FOOTER-->
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)</div>
						</div>
					</div>
					<!--END FOOTER-->
					<div class="pageEnd"/>
					<!-- END SCHEDULE H PART I-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2010)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">8</span>
						</div>
					</div>
					
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE H PART II-->
					<div class="styBB" style="border-top-width: 1px; width:256mm;">
						<div class="styTitleName">Schedule H</div>
						<div class="styIRS1118TitleDesc">Apportionment of Deductions Not Definitely Allocable
          <span class="styItalicText">
								<span class="styNormalText">(continued)</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc">Part II—Interest Deductions, All Other Deductions, and Total Deductions
          <!-- The xsl:choose code block below enables this stylesheet to display data from more than one schema version -->
						</div>
					</div>
					<!-- Choose for Separated Repeated Data -->
					<xsl:choose>
						<!-- When Repeated Data exists and the Separated tag is set, create the empty shell -->
						<xsl:when test="(( (count($Form1118ScheduleH/AvgAstValNonfinclDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclDivFromEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclDivFromEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclTreatyResourcedIncm) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedSect901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsCertainDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsTreatyResourcedIncome) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm) &gt; 1)
                            )
                            and ($Print = $Separated))">
							<div style="width:256mm;clear:both;">
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCell" colspan="2" rowspan="2" style="height:34mm;border-left-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCell" colspan="2" style="height:22mm;text-align:left;float:none;">
												<span style="width:16px"/>
												<span class="styBoldText">(a)</span>
                      Average Value of Assets - <br/>
												<span style="width:48px"/>
                      Check method used:<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>Fair market value
                      </label>
												<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
                      </label>
												<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
                      </label>
												<br/>
											</td>
											<td class="styIRS1118TableCell" colspan="2" style="height:22mm;float:none;">
												<span class="styBoldText">(b)</span>
                      Interest Deductions
                    </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:34mm;">
												<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
                    </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:34mm;border-bottom-width:0px;">
												<span class="styBoldText">(d)</span>
                      Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                      and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                      corresponding Schedule A.
                    </td>
										</tr>
										<tr>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(ii)</span> Financial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(iv)</span> Financial Corporations</td>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
												<span class="styBoldText">1<span style="width:2px"/>a</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Totals (see instructions)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;text-align:left;">See Add'l Data<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Assets excluded from apportionment formula</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
      and 1d from line 1a)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftNumBox">3</td>
											<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">a</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">General category income</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Passive category income</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Section 901(j) income*</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Income re-sourced by treaty*</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm">
												<span class="styBoldText">4</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm">Total foreign (add lines 3a through 3d)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div style="width:256mm;clear:both;">
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCell" colspan="2" rowspan="2" style="height:34mm;border-left-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCell" colspan="2" style="height:22mm;text-align:left;float:none;">
												<span style="width:16px"/>
												<span class="styBoldText">(a)</span>
                Average Value of Assets - <br/>
												<span style="width:48px"/>
                Check method used:<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>Fair market value
                </label>
												<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
                </label>
												<br/>
												<span style="width:4px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
                </label>
												<br/>
											</td>
											<td class="styIRS1118TableCell" colspan="2" style="height:22mm;float:none;">
												<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:34mm;">
												<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
              </td>
											<td class="styIRS1118TableCell" rowspan="2" style="height:34mm;border-bottom-width:0px;">
												<span class="styBoldText">(d)</span>
                Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                corresponding Schedule A.
              </td>
										</tr>
										<tr>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(ii)</span> Financial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCell" style="height:12mm;">
												<span class="styBoldText">(iv)</span> Financial Corporations</td>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
												<span class="styBoldText">1<span style="width:2px"/>a</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Totals (see of instructions)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotals"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotals"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotals"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotals"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDeductionsTotals"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTempRegAmounts"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclOthTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclOthTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclOthTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclOthTempRegAmounts"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Assets excluded from apportionment formula</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclExcludedAst"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclExcludedAst"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
and 1d from line 1a)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotToBeApprtn"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotToBeApprtn"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotToBeApprtn"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotToBeApportioned"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftNumBox">3</td>
											<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styShadingCellSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">a</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">General category income</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclGenCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclGenCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonFinclGenCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclGenCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedGeneralCatIncm"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsGeneralCategoryIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Passive category income</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclPassiveIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclPassiveCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonFinclPassiveCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclPassiveCatIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedPassiveIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsPassiveCategoryIncome"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Section 901(j) income*</td>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValNonfinclSect901jIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclSect901jIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValFinclSect901jIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclSect901jIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclSect901jIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclSect901jIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclSection901jIncome)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclSection901jIncome"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthNotAllcblDedSect901jIncome)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedSect901jIncome"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotalsSection901jIncome)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsSection901jIncome"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;">Income re-sourced by treaty*</td>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValFinclTreatyRscIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTreatyRscIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclTreatyRscIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTreatyRscIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclTreatyResourcedIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTreatyResourcedIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotalsTreatyResourcedIncome)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsTreatyResourcedIncome"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm">
												<span class="styBoldText">4</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm">Total foreign (add lines 3a through 3d)</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsTotalForeign"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- END SCHEDULE H PART II-->
					<div class="pageEnd" style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">*Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H </span>in instructions</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2010)</div>
						</div>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$Form1118Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Repeating Data Table for Schedule A Columns 1-8 -->
					<xsl:if test="((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
						<span class="styRepeatingDataTitle">Form 1118, Schedule A, Income or (Loss) Before Adjustments, Table Columns 1-8:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="3">
										<span style="width:4px;height:27mm;"/>
									</th>
									<th class="styDepTblCell" style="width:21mm;height:27mm;" rowspan="3" scope="col">1. <span class="styNormalText">Foreign Country or U.S. Possession (Enter two-letter code from list beginning on page 11 of instructions. Use a separate line for each.)*</span>
									</th>
									<th class="styDepTblCell" style="width:229mm;height:5mm;" colspan="9" scope="col">Gross Income or (Loss) From Sources Outside the United States (<span class="styItalicText">INCLUDE</span> Foreign Branch Gross Income here <span class="styItalicText">and</span> on Schedule F)</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:50mm;height:11mm;" colspan="2" scope="col">2. <span class="styNormalText">Deemed Dividends (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:50mm;height:11mm;" colspan="2" scope="col">3. <span class="styNormalText">Other Dividends</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:22mm;" rowspan="2" scope="col">4. <span class="styNormalText">Interest</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:22mm;" rowspan="2" scope="col">5. <span class="styNormalText">Gross Rents, Royalties, and License Fees</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:22mm;" rowspan="2" scope="col">6. <span class="styNormalText">Gross Income From Performance of Services</span>
									</th>
									<th class="styDepTblCell" style="width:29mm;height:22mm;" rowspan="2" scope="col">7. <span class="styNormalText">Other (attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:22mm;" rowspan="2" scope="col">8. <span class="styNormalText">Total (add columns 2(a) through 7)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:25mm;height:11mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:11mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:11mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;height:11mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowID"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellSmall" style="width:21mm;text-align:left;">
											<span class="styTableCellPad"/>
											<!-- If ForeignCountryOrUSPossession -->
											<xsl:if test="ForeignCountryOrUSPossessionCd != ' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(ForeignCountryOrUSPossNOL != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossNOL"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(ForeignCountryOrUSPossRICs != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossRICs"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(ForeignCountryOrUSPossHTKO != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossHTKO"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignCountryOrUSPoss863B != ' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPoss863B"/>
												</xsl:call-template>
											</xsl:if>
											<!--  <xsl:if test="not(ForeignCountryOrUSPossession='' or not(ForeignCountryOrUSPossession))">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossession"/>
                        </xsl:call-template>
                      </xsl:if>
                      
                      <xsl:if test="not(ForeignCountryOrUSPoss863B='' or not(ForeignCountryOrUSPoss863B))">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPoss863B"/>
                        </xsl:call-template>
                      </xsl:if>     -->
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedDividendsExcludeGrossUp"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedDividendsGrossUp"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherDividendsExcludeGrossUp"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Interest"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="width:29mm;">
											<!-- Form to form link -->
											<div style="float: left; clear: none">
												<!--span style="width:2px;"></span-->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments/OtherIncomeOrLoss"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;" colspan="2">
										<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDeemedDivExcludeGrossUp"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeemedDividendsGrossUp"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDivExcludeGrossUp"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDividendsGrossUp"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalInterest"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotGrossRentsRoyaltiesLcnsFees"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotPerformanceOfSrvcGrossIncm"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:29mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherIncomeOrLoss"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/GrandTotGrossIncmOrLossOutsdUS"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule A Columns 9-12 -->
					<xsl:if test="((count($Form1118ScheduleA/IncomeOrLossBeforeAdjustments) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule A, Income or (Loss) Before Adjustments, Table Columns 9-13:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="4">
										<span style="width:4px"/>
									</th>
									<th class="styDepTblCell" style="width:222mm;font-size:7pt;padding-top:1mm;padding-bottom:1mm;" colspan="8" scope="col">Deductions (<span class="styItalicText">INCLUDE</span> Foreign Branch Deductions here <span class="styItalicText">and</span> on Schedule F)</th>
									<th class="styDepTblCell" style="width:25mm" rowspan="4" scope="col">13. <span class="styNormalText">Total Income or (Loss) Before Adjustments (subtract column 12 from column 8)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:160mm" colspan="5" scope="col">9. Definitely Allocable Deductions</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="3" scope="col">10. <span class="styNormalText">Apportioned Share of Deductions Not Definitely Allocable (enter amount from applicable line of Schedule H, Part II, column (d))</span>
									</th>
									<!-- line 11 -->
									<th class="styDepTblCell" style="width:32mm" rowspan="3" scope="col">11. <span class="styNormalText">Net Operating Loss Deduction</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="3" scope="col">12. <span class="styNormalText">Total Deductions (add columns 9(e) through 10)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:64mm" colspan="2" scope="col">
										<span class="styNormalText">Rental, Royalty, and Licensing Expenses</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="2" scope="col">(c) <span class="styNormalText">Expenses Related to Gross Income From Performance of Services</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="2" scope="col">(d) <span class="styNormalText">Other Definitely Allocable Deductions</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="2" scope="col">(e) <span class="styNormalText">Total Definitely Allocable Deductions (add columns 9(a) through 9(d))</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:32mm" scope="col">(a) <span class="styNormalText">Depreciation, Depletion, and Amortization</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" scope="col">(b) <span class="styNormalText">Other Expenses</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleA/IncomeOrLossBeforeAdjustments">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowID"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RentalRoyaltyDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RentalRoyaltyOtherExpenses"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PerfOfServicesGrossIncmExpnss"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherAllocableDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAllocableDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- line 10 -->
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NotAllocableDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- line 11 -->
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetOperatingLossDeduction"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotIncmOrLossBeforeAdjustments"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell">
										<span class="styTableCellPad" style="font-weight:bold">Totals</span>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalRentalRoyaltyDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalRentalRoyaltyOtherExpnss"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotPerfOfSrvcGrossIncmExpnss"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherAllocableDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/GrandTotalAllocableDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalNotAllocableDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<!-- line 11 -->
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalNetOperatingLossDeduction"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/GrandTotalDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/GrandTotIncmOrLossBeforeAdj"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				
					<!-- Separated Repeating Data Table for Schedule B, Part I -->
					<xsl:if test="((count($Form1118ScheduleB/ForeignTaxesPaidAndAccrued) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule B, Part I - Foreign Taxes Paid, Accrued, and Deemed Paid:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="height: 66mm;font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="height:22.5mm;" rowspan="3">
										<span class="styTableCellPad" style="font-weight:bold"/>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" colspan="2" style="width:30mm;height:15mm;">
										<br/>
                1. <span class="styNormalText">Credit is Claimed for Taxes:</span>
										<br/>
										<br/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Paid</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesPaid"/>
										</xsl:call-template>
										<!-- Added to show the pushpins -->
										<span style="width:2mm;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Accrued</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditIsClaimedForTaxesAccrued"/>
										</xsl:call-template>
									</th>
									<th class="styDepTblCell" scope="col" style="width:192mm;height:7.5mm;" colspan="8">2. <span class="styNormalText">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
									</th>
									<th class="styDepTblCell" scope="col" style="height:7.5mm;" rowspan="3">3. <span class="styNormalText">Tax Deemed Paid (from Schedule C- Part I, column 10, Part II, column 8(b), and Part III, column 8)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:72mm;height:7.5mm;" colspan="3">
										<span class="styNormalText">Tax Withheld at Source on:</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:96mm;height:7.5mm;" colspan="4">
										<span class="styNormalText">Other Foreign Taxes Paid or Accrued On:</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:15mm;" rowspan="2">(h) <span class="styNormalText">Total Foreign Taxes Paid or Accrued (add columns 2(a) through 2(g))</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;height:7.5mm;">
										<span class="styNormalText">Date Paid</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;height:7.5mm;">
										<span class="styNormalText">Date Accrued</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(a) <span class="styNormalText">Dividends</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(b) <span class="styNormalText">Interest</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(c) <span class="styNormalText">Rents, Royalties, and License Fees</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(d) <span class="styNormalText">Section 863(b) Income</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(e) <span class="styNormalText">Foreign Branch Income</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(f) <span class="styNormalText">Services Income</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;height:7.5mm;">(g) <span class="styNormalText">Other</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleB/ForeignTaxesPaidAndAccrued">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr" scope="row">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowID"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellSmall" style="width:20mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DatePaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateAccrued"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldOnDividends"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldOnInterest"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldOnRentsAndRoyalties"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxPdOrAccruedOnSect863bIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxPaidOrAccruedOnBranchIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxPdOrAccruedOnServicesIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxPaidOrAccruedOnOtherIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrued"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" scope="row" colspan="3" style="text-align:left;">
										<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOnDividends"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOnInterest"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTaxWithheldOnRentsRoyalties"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnSect863bIncm"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnBranchIncome"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnServicesIncm"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccruedOnOtherIncome"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/GrandTotalForeignTaxesPdOrAccr"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaid"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule B, Part I -->
					<xsl:if test="($Form1118ScheduleB/TotalForeignTaxes/@taxReclassifiedUnderHTKO)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule B, Part II Line 6. - Foreign Taxes Paid, Accrued, and Deemed Paid:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="height: 8mm;font-size:6pt;">
							<tbody>
								<tr>
									<td class="styDepTblCell" style="height:8mm;">
                    <div style="width:256mm;">
                      <div class="styLNLeftNumBoxSD">6</div>
                      <div class="styLNDescLandscape" style="text-align:left;">Total foreign taxes: HTKO
                              <!--Dotted Line-->
                              <span class="styNoAudioRead" style="font-weight:bold;">
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              <span style="width:16px"/>.
                              </span>					
                          </div>
                          <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxes"/>
                            </xsl:call-template>
                          </div>
                        </div>
                  </td>
								</tr>
							</tbody>
						</table>
					</xsl:if>	
													
<!-- Separated Repeating Data Table for Schedule C, Part I -->
					<xsl:if test="((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule C, Part I - Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends and Deemed Inclusions</span>
									</th>
									<th class="styDepTblCell" style="width:16mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule D, Part I-see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:38mm;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DivDeemedInclsnFuncCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DivDeemedInclsnUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:25mm;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;border-right-width:0px;" colspan="10">
										<span class="styBoldText">Total</span> (Add amounts in column 10. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
									<td class="styDepTblCell">
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid1"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule C, Part II -->
					<xsl:if test="((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule C, Part II - Dividends Paid Out of Pre-1987 Accumulated Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:34mm;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency computed under section 902) (attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid on Earnings and Profits (E&amp;P) for Tax Year Indicated (in functional currency) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:56mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:56mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DivPaidPre1987AccumProfits">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmall" style="width:28mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:34mm">
											<div class="styGenericDiv" style="float: left; clear: none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits/AccumulatedProfits"/>
												</xsl:call-template>
											</div>
											<div style="padding-top:.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</div>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarnAndPrftTaxesPdAndDeemedPd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DivPaidFunctionalCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:22mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;border-right-width:0px;" colspan="8">
										<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
									<td class="styDepTblCell">
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid2"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule C, Part III -->
					<xsl:if test="((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule C, Part III - Deemed Inclusions From Pre-1987 Earnings and Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:33mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:33mm" rowspan="2" scope="col">4. <span class="styNormalText">E&amp;P for Tax Year Indicated (in functional currency translated from U.S. dollars, computed under section 964) (attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:33mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:66mm" colspan="2" scope="col">6. <span class="styNormalText">Deemed Inclusions</span>
									</th>
									<th class="styDepTblCell" style="width:33mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (multiply column 5 by column 7)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:33mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:33mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmall" style="width:33mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:33mm">
											<div style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts/EarningsAndProfits"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsAndProfits"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedInclsnFunctionalCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedInclusionsUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:33mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DeemedInclsnToEarnPrftsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;border-right-width:0px;" colspan="7">
										<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)</td>
									<td class="styDepTblCell">
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styDepTblCell" style="width:25mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxDeemedPaid3"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styIRS1118TableLastCol" id="DIPRE1987spcr"/>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D, Part I, Section A -->
					<xsl:if test="((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part I, Section A - Dividends Paid Out of Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:22mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:38mm;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<div style="padding-top:.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</div>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFirstTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:18mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D, Part I, Section B -->
					<xsl:if test="((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part I, Section B - Dividends Paid Out of Pre-1987 Accumulated Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:34mm" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency-see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:56mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Functional Currency of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends2ndTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmall" style="width:28mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:34mm">
											<div style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier/AccumulatedProfits"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFirstTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:22mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D, Part II, Section A -->
					<xsl:if test="((count($Form1118ScheduleD/UndistrEarnDividends3rdTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II, Section A - Dividends Paid Out of Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule E, Part I, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends3rdTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:38mm;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends3rdTier/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<div style="padding-top:.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</div>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:18mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D, Part II, Section B -->
					<xsl:if test="((count($Form1118ScheduleD/AccumProfitsDividends3rdTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II, Section B - Dividends Paid Out of Pre-1987 Accumulated Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:34mm" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency-attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency-see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:56mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(a) <span class="styNormalText">In Functional Currency of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends3rdTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmall" style="width:28mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:34mm">
											<div style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends3rdTier/AccumulatedProfits"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AccumulatedProfits"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfSecondTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:22mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsPdToAccumProfitsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPdFunctionalCurrency"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:28mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollars"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule E, Part I -->
					<xsl:if test="((count($Form1118ScheduleE/UndistrEarnDividends4thTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part I - Tax Deemed Paid by Third-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Fourth-Tier Foreign Corporation and Its Related Third-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:22mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part II, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Of Third-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends4thTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:38mm;">
											<div class="styGenericDiv" style="float: left;clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends4thTier/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<div style="padding-top:.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</div>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFourthTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfThirdTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:18mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule E, Part II -->
					<xsl:if test="((count($Form1118ScheduleE/UndistrEarnDividends5thTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part II - Tax Deemed Paid by Fourth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Fifth-Tier Foreign Corporation and Its Related Fourth-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:44mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:18mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part III, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(a) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:22mm" scope="col">(b) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends5thTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:38mm;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends5thTier/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<div style="padding-top:.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</div>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFifthTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFourthTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:18mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule E, Part III -->
					<xsl:if test="((count($Form1118ScheduleE/UndistrEarnDividends6thTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part III - Tax Deemed Paid by Fifth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:24.75mm" rowspan="2" scope="col">1. <span class="styNormalText">Name of Sixth-Tier Foreign Corporation and Its Related Fifth-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code from instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency-attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:24.75mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:24.75mm" rowspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:24.75mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5 and 6)</span>
									</th>
									<th class="styDepTblCell" style="width:49.5mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:24.75mm" scope="col">(a) <span class="styNormalText">Of Sixth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:24.75mm" scope="col">(b) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/UndistrEarnDividends6thTier">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellSmallArial" style="width:24.75mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEnd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:28mm;">
											<div style="float: left; clear: none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/UndistrEarnDividends6thTier/Post1986UndistributedEarnings"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986UndistributedEarnings"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:24.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncmTaxOpngBal"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:24.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:24.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxes"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:24.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfSixthTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:24.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidOfFifthTierCorp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:21mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsToEarningsRatio"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmallArial" style="width:25mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaid"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule F -->
					<xsl:if test="((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule F - Gross Income and Definitely Allocable Deductions for Foreign Branches:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;height: 66mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" colspan="2" style="height:8mm">
                    1. <span class="styNormalText">Code for Foreign Country or U.S. Possession (see instructions and use a separate line for each code)    (Use a separate line for each.)</span>
									</th>
									<th class="styDepTblCell" style="height:8mm">2. <span class="styNormalText">Gross Income</span>
									</th>
									<th class="styDepTblCell" style="height:8mm">3. <span class="styNormalText">Definitely Allocable Deductions</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr" style="width:8mm;text-align:center;font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RowID"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:39mm;text-align:left;">
											<span style="width:4px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossIncome"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DefinitelyAllocableDeductions"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" colspan="2" style="width:47mm;text-align:left;">
										<span style="font-weight:bold;">Totals </span>(add lines A through F)* <span style="width:10mm;text-align:right;">
											<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										</span>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotalGrossIncome"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotDefinitelyAllcblDeductions"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule H, Part I -->
					<xsl:if test="( ( (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed) &gt; 2) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesCrtnDivEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/GrossSalesTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedCertainDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed/RDDedTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotCrtnDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmCrtnDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncomeSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncomeTreatyRscIncome) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedCertainDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/TotRDDedTreatyResourcedIncome) &gt; 1) )
                            and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part I - Research and Development Deductions:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="2" rowspan="3" style="height:33mm;border-left-width:0px;">
										<span style="width:1px;"/>
									</td>
									<td class="styDepTblCell" colspan="5" style="height:10mm;">
										<span class="styBoldText">(a)</span> Sales Method</td>
									<td class="styDepTblCell" colspan="2" rowspan="2" style="height:20mm;">
										<span class="styBoldText">(b)</span> Gross Income Method-Check method used:<br/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
											</xsl:call-template>Option 1
                </label>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2"/>
											</xsl:call-template>Option 2</label>
										<br/>(See instructions)
              </td>
									<td class="styDepTblCell" rowspan="3" style="height:30mm;">
										<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
                Allocable (enter all amounts from column (a)(v) or all amounts from column (b)(vii))
              </td>
								</tr>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="2" style="height:10mm;">
                Product line #1 <br/>(SIC Code: <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/SICCode"/>
										</xsl:call-template>)*
              </td>
									<td class="styDepTblCell" colspan="2" style="height:10mm;">
                Product line #2 <br/>(SIC Code: <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/SICCode"/>
										</xsl:call-template>)*
              </td>
									<td class="styDepTblCell" rowspan="2" style="height:23mm;">
										<span class="styBoldText">(v)</span> Total R&amp;D Deductions Under Sales Method (add columns (ii) and (iv))</td>
								</tr>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(i)</span> Gross Sales</td>
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(iii)</span> Gross Sales</td>
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(vi)</span> Gross Income</td>
									<td class="styDepTblCell" style="height:13mm;">
										<span class="styBoldText">(vii)</span> Total R&amp;D Deductions Under Gross Income Method</td>
								</tr>
							</thead>
							<tr class="styDepTblRow1">
								<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">1</td>
								<td class="styIRS1118LNDescRD" style="height:8mm;">Totals (see pages 8 and 9 of instructions)</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotalRDDedTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotalRDDedTotals"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styDepTblRow2">
								<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">2</td>
								<td class="styIRS1118LNDescRD" style="height:4.5mm;">Total to be apportioned</td>
								<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTotalToBeApportioned"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTotalToBeApportioned"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedTotToBeApprtn"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedTotToBeApprtn"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styDepTblRow1">
								<td class="styLNLeftNumBox" style="height:8mm;">3</td>
								<td class="styIRS1118LNDescRD" style="height:8mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styDepTblRow1">
								<td class="styLNLeftLtrBoxBB">a</td>
								<td class="styIRS1118LNDescRD">General category income</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesGeneralCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsGeneralCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesGeneralCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsGeneralCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotRDDedGenCatIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeGeneralCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedGenCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedGeneralCategoryIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styDepTblRow2">
								<td class="styLNLeftLtrBoxBB">b</td>
								<td class="styIRS1118LNDescRD">Passive category income</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesPassiveCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsPassiveCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesPassiveCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsPassiveCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotRDDedPassiveIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomePassiveCatIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedPassiveIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:4.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedPassiveCategoryIncome"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styDepTblRow1">
								<td class="styLNLeftLtrBoxBB">c</td>
								<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesSection901jIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedSection901jIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesSection901jIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedSection901jIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedSect901jIncm"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncomeSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeSection901jIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedSect901jIncm"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDedSection901jIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedSection901jIncome"/>
								</xsl:call-template>
							</tr>
							<tr class="styDepTblRow2">
								<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
								<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTreatyRscIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTreatyRscIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTreatyRscIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDedTreatyRscIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTreatyRscIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTreatyRscIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTreatyRscIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDedTreatyRscIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMthdTotRDDedTreatyRscIncm"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncomeTreatyRscIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTreatyRscIncome"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotRDDedTreatyRscIncm"/>
								</xsl:call-template>
								<xsl:call-template name="AddRowsForSchH">
									<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDedTreatyResourcedIncome)"/>
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDedTreatyResourcedIncome"/>
								</xsl:call-template>
							</tr>
							<tr class="styDepTblRow1">
								<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
								<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/GrossSalesTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[1]/RDDeductionsTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/GrossSalesTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[2]/RDDeductionsTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/SalesMethodTotalRDDedTotalFrgn"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncmTotalRDDedTotalFrgn"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalRDDedTotalForeign"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<xsl:for-each select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed">
							<xsl:if test="(position() mod 4) = 3">
								<xsl:variable name="curPos">
									<xsl:value-of select="position()"/>
								</xsl:variable>
								<br/>
								<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part I - Research and Development Deductions (Continued):</span>
								<div style="width:256mm;clear:both;">
									<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr">
												<td class="styDepTblCell" colspan="2" rowspan="3" style="height:18mm;border-left-width:0px;">
													<span style="width:1px;"/>
												</td>
												<td class="styDepTblCell" colspan="8" style="height:4mm;">Sales Method</td>
											</tr>
											<tr class="styDepTblHdr">
												<td class="styDepTblCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos"/>
													<br/>(SIC Code: <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SICCode"/>
													</xsl:call-template>)*</td>
												<td class="styDepTblCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 1"/>
													<br/>(SIC Code: <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/SICCode"/>
													</xsl:call-template>)*</td>
												<td class="styDepTblCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 2"/>
													<br/>(SIC Code: <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/SICCode"/>
													</xsl:call-template>)*</td>
												<td class="styDepTblCell" colspan="2" style="height:7mm;padding-top:.5mm;">Product line #<xsl:value-of select="$curPos + 3"/>
													<br/>(SIC Code: <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/SICCode"/>
													</xsl:call-template>)*</td>
											</tr>
											<tr class="styDepTblHdr">
												<td class="styDepTblCell" style="height:4mm;">Gross Sales</td>
												<td class="styDepTblCell" style="height:4mm;">R&amp;D Deductions</td>
												<td class="styDepTblCell" style="height:4mm;">Gross Sales</td>
												<td class="styDepTblCell" style="height:4mm;">R&amp;D Deductions</td>
												<td class="styDepTblCell" style="height:4mm;">Gross Sales</td>
												<td class="styDepTblCell" style="height:4mm;">R&amp;D Deductions</td>
												<td class="styDepTblCell" style="height:4mm;">Gross Sales</td>
												<td class="styDepTblCell" style="height:4mm;">R&amp;D Deductions</td>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblRow1">
												<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">1</td>
												<td class="styIRS1118LNDescRD" style="height:8mm;">Totals (see pages 8 and 9 of instructions)</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RDDeductionsTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsTotals"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">2</td>
												<td class="styIRS1118LNDescRD" style="height:4.5mm;">Total to be apportioned</td>
												<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RDDedTotalToBeApportioned"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTotalToBeApportioned"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTotalToBeApportioned"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedTotalToBeApportioned"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styLNLeftNumBox" style="height:8mm;">3</td>
												<td class="styIRS1118LNDescRD" style="border-bottom-width:0px;height:8mm;">Apportionment among statutory groupings:</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
												<td class="styShadingCellSmall" style="height:8mm;padding-top:4mm;border-style:solid;border-color:black;border-bottom-width:1px;">
													<span style="width:4px;"/>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styLNLeftLtrBoxBB">a</td>
												<td class="styIRS1118LNDescRD">General category income</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsGeneralCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styLNLeftLtrBoxBB">b</td>
												<td class="styIRS1118LNDescRD">Passive category income</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:4.5mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsPassiveCatIncome"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styLNLeftLtrBoxBB">c</td>
												<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count(GrossSalesSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="GrossSalesSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count(RDDedSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="RDDedSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesSection901jIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome"/>
												</xsl:call-template>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
												<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count(GrossSalesTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="GrossSalesTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count(RDDedTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="RDDedTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDedTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDedTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTreatyRscIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTreatyRscIncome"/>
												</xsl:call-template>
												<xsl:call-template name="AddRowsForSchH">
													<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedSection901jIncome)"/>
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDedTreatyRscIncome"/>
												</xsl:call-template>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
												<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/GrossSalesTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 1]/RDDeductionsTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/GrossSalesTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 2]/RDDeductionsTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/GrossSalesTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ProductLineGrossSalesAndRDDed[$curPos + 3]/RDDeductionsTotalForeign"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule H, Part II -->
					<xsl:if test="(( (count($Form1118ScheduleH/AvgAstValNonfinclDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclDivFromEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValFinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclSect901jIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedNonfinclTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclDivFromEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/IntDedFinclTreatyResourcedIncm) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedDivFrEach1050) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedSect901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsCertainDivFrEach1050PFIC) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsSection901jIncome) &gt; 1) or
                              (count($Form1118ScheduleH/TotalsTreatyResourcedIncome) &gt; 1) or
                              (count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm) &gt; 1)
                            )
                            and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part II - Interest Deductions, All Other Deductions, and Total Deductions:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="2" rowspan="2" style="height:34mm;border-left-width:0px;">
										<span style="width:1px;"/>
									</td>
									<td class="styDepTblCell" colspan="2" style="height:22mm;text-align:left;float:none;">
										<span style="width:16px"/>
										<span class="styBoldText">(a)</span>
                Average Value of Assets - <br/>
										<span style="width:48px"/>
                Check method used:<br/>
										<span style="width:4px"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFairMarketValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
											</xsl:call-template>Fair market value
                </label>
										<br/>
										<span style="width:4px"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValTaxBookValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
											</xsl:call-template>Tax book value
                </label>
										<br/>
										<span style="width:4px"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstAltValTaxBookValueMethod"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
											</xsl:call-template>Alternative tax book value
                </label>
										<br/>
									</td>
									<td class="styDepTblCell" colspan="2" style="height:22mm;float:none;">
										<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
									<td class="styDepTblCell" rowspan="2" style="height:34mm;">
										<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
              </td>
									<td class="styDepTblCell" rowspan="2" style="height:34mm;">
										<span class="styBoldText">(d)</span>
                Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                corresponding Schedule A.
              </td>
								</tr>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" style="height:12mm;">
										<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
									<td class="styDepTblCell" style="height:12mm;">
										<span class="styBoldText">(ii)</span> Financial Corporations</td>
									<td class="styDepTblCell" style="height:12mm;">
										<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
									<td class="styDepTblCell" style="height:12mm;">
										<span class="styBoldText">(iv)</span> Financial Corporations</td>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr class="styDepTblRow1">
									<!-- Set the background color for the row -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
										<span class="styBoldText">1<span style="width:2px"/>a</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Totals (see instructions)</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDeductionsTotals"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTempRegAmounts"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclOthTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclOthTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclOthTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclOthTempRegAmounts"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Assets excluded from apportionment formula</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclExcludedAst"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclExcludedAst"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm;">
										<span class="styBoldText">2</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
and 1d from line 1a)</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotToBeApprtn"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotToBeApprtn"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotToBeApprtn"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotToBeApportioned"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftNumBox">3</td>
									<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="height:4.5mm;border-style:solid;border-color:black;border-bottom-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">a</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">General category income</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclGenCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclGenCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonFinclGenCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclGenCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedGeneralCatIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsGeneralCategoryIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">b</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Passive category income</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclPassiveIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclPassiveCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonFinclPassiveCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclPassiveCatIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedPassiveIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsPassiveCategoryIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">c</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Section 901(j) income*</td>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValNonfinclSect901jIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclSect901jIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValFinclSect901jIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclSect901jIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclSect901jIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclSect901jIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclSection901jIncome)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclSection901jIncome"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthNotAllcblDedSect901jIncome)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedSect901jIncome"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotalsSection901jIncome)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsSection901jIncome"/>
									</xsl:call-template>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;">d</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;">Income re-sourced by treaty*</td>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTreatyRscIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstValFinclTreatyRscIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTreatyRscIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclTreatyRscIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTreatyRscIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclTreatyResourcedIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTreatyResourcedIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedTreatyRscIncm"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotalsTreatyResourcedIncome)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsTreatyResourcedIncome"/>
									</xsl:call-template>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:4.5mm;padding-left:1mm">
										<span class="styBoldText">4</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm">Total foreign (add lines 3a through 3d)</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValNonfinclTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstValFinclTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthNotAllcblDedTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxSmall" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalsTotalForeign"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddRowsForSchAPartI">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:21mm;">
				<span class="styTableCellPad" style="width:21mm;text-align:left;">
					<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				</span>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:29mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchAPartII">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad" style="width:25mm;text-align:left;">
					<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				</span>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchBPartI">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:25mm;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartI">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:28mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:16mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:25mm;border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmall" style="width:28mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:34mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:22mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:25mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartIII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmall" style="width:33mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Additional Data Table</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:33mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:33mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:33mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:33mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:33mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:25mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecA">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:28mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:18mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecB">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmall" style="width:28mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartIISecA">
		<xsl:param name="ShowMessage"/>
		<xsl:call-template name="AddRowsForSchDPartISecA">
			<xsl:with-param name="ShowMessage">
				<xsl:value-of select="$ShowMessage"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartIISecB">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmall" style="width:28mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartI">
		<!-- Filler rows for Schedule E Part I and Part II are identical to the Schedule D Part I section A -->
		<xsl:param name="ShowMessage"/>
		<xsl:call-template name="AddRowsForSchDPartISecA">
			<xsl:with-param name="ShowMessage">
				<xsl:value-of select="$ShowMessage"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartII">
		<xsl:param name="ShowMessage"/>
		<xsl:call-template name="AddRowsForSchDPartISecA">
			<xsl:with-param name="ShowMessage">
				<xsl:value-of select="$ShowMessage"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartIII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmallArial" style="width:24.75mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:15mm;font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:24.75mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmallArial" style="width:25mm;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF">
		<xsl:param name="ShowMessage"/>
		<xsl:param name="TargetNode"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellLtr" style="width:8mm;text-align:center;font-weight:bold;">
				<xsl:value-of select="$TargetNode"/>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Additional Data Table</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchH">
		<xsl:param name="RowCount"/>
		<xsl:param name="TargetNode"/>
		<td class="styLNAmountBoxSmall" valign="top">
			<xsl:if test="$RowCount&lt;2">
				<xsl:attribute name="style"><xsl:value-of select="'height:8mm;'"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="$TargetNode">
				<xsl:if test="position() != 1">
					<br/>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$RowCount&gt;1">
						<span class="styIRS1118UnderlinedText">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:if test="$RowCount=0">
				<span style="width:1px;"/>
			</xsl:if>
		</td>
	</xsl:template>
</xsl:stylesheet>
