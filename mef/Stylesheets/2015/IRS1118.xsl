<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/15/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 09/29/2015 - Changes made for UWR 161297 - Jeremy Nichols -->
<!-- 12/09/2015 - Changes made per 2015 pdf review - Jeremy Nichols -->
<!-- 01/26/2016 - Additional changes made per 2015 pdf review - Jeremy Nichols -->
<!-- 01/29/2016 - Changes made for defect 45284 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1118Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1118Data" select="$RtnDoc/IRS1118"/>
	<xsl:param name="Form1118ScheduleA" select="$RtnDoc/IRS1118/IRS1118ScheduleA"/>
	<xsl:param name="Form1118ScheduleB" select="$RtnDoc/IRS1118/IRS1118ScheduleB"/>
	<xsl:param name="Form1118ScheduleC" select="$RtnDoc/IRS1118/IRS1118ScheduleC"/>
	<xsl:param name="Form1118ScheduleD" select="$RtnDoc/IRS1118/IRS1118ScheduleD"/>
	<xsl:param name="Form1118ScheduleE" select="$RtnDoc/IRS1118/IRS1118ScheduleE"/>
	<xsl:param name="Form1118ScheduleF" select="$RtnDoc/IRS1118/IRS1118ScheduleF"/>
	<xsl:param name="Form1118ScheduleG" select="$RtnDoc/IRS1118/IRS1118ScheduleG"/>
	<xsl:param name="Form1118ScheduleH" select="$RtnDoc/IRS1118/IRS1118ScheduleH"/>
	<xsl:param name="RowForHeight" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesSection901jIncmAmt)"/>
	<xsl:param name="RowHeight" select="$RowForHeight*4"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Description" content="IRS Form 1118"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1118Style"/>
						<xsl:call-template name="AddOnStyle"/>
					 </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1118">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<div class="styTBB" style="width:256mm;height:22mm;border-bottom-width:1px;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
							<div style="height:9mm;display:inline;">
								Form<span class="styFormNumber"> 1118</span><br/>            
								(Rev. December 2015)
							</div>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118Data"/>
							</xsl:call-template>
							<br/>
							<div style="height:7mm">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:178mm;height:22mm;">
							<div class="styMainTitle">Foreign Tax Credit—Corporations</div>
							<div class="styFBT">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> Information about Form 1118 and its separate instructions is at <i>www.irs.gov/form1118</i>.
							</div>
							<div class="styFBT" style="height:4mm; margin-top:0px">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> Attach to the corporation’s tax return.          
							</div>
							
							<div style="text-align:center;margin-top:2mm">For calendar year 
								<span style="width: 10mm">
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
							<div style="text-align:center;padding-top:10mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styBB" style="height:9mm;width:256mm;">
						<div class="styNameBox" style="width:189mm;height:9mm;font-size:7pt;">
          Name of corporation<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:65mm;height:9mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Employer identification number<br/>
							<br/>
							<span class="styNormalText">
								<xsl:choose>
									<xsl:when test="$Form1118Data/CorporationEIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1118Data/CorporationEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form1118Data/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1118Data/MissingEINReasonCd"/>
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
					<div class="styBB" style="width:256mm;padding-bottom:1.5mm;">
        Use a <span class="styBoldText">separate</span> Form 1118 for each applicable category of income
        listed below. See <span class="styBoldText">Categories of Income</span> in the instructions.
        Also, see <span class="styBoldText">Specific Instructions</span>.<br/>
        Check only one box on each form.<br/>
						<div style="height:10mm;width:47mm;float:left;padding-top:2mm;padding-bottom:1.5mm;padding-bottom:1mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncPassiveCategoryInd"/>
									<xsl:with-param name="BackupName">IRS1118DataPassiveIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncPassiveCategoryInd"/>
									<xsl:with-param name="BackupName">IRS1118DataPassiveIncome</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;">Passive Category Income</span>
							</label>
							<br/>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncGeneralCategoryInd"/>
									<xsl:with-param name="BackupName">IRS1118DataGeneralCategoryIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncGeneralCategoryInd"/>
									<xsl:with-param name="BackupName">IRS1118DataGeneralCategoryIncome</xsl:with-param>
								</xsl:call-template>General Category Income
          </label>
						</div>
						<div style="height:14mm;width:108mm;float:left;padding-top:1.5mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncSection901jInd"/>
									<xsl:with-param name="BackupName">IRS1118DataSection901jIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncSection901jInd"/>
									<xsl:with-param name="BackupName">IRS1118DataSection901jIncome</xsl:with-param>
								</xsl:call-template>Section 901(j) Income: Name of Sanctioned Country
          </label>
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncSection901jInd/@sanctionedCountryCd"/>
								</xsl:call-template>
							</span>
							<br/>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncResourcedTreatyInd"/>
									<xsl:with-param name="BackupName">IRS1118DataTreatyResourcedIncome</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncResourcedTreatyInd"/>
									<xsl:with-param name="BackupName">IRS1118DataTreatyResourcedIncome</xsl:with-param>
								</xsl:call-template>Income Re-sourced by Treaty
          </label>: Name of Country <img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							<span style="border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 30mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/ForeignIncResourcedTreatyInd/@countryCd"/>
								</xsl:call-template>
							</span>
							<br/>
						</div>
					</div>
					<!--		<div class="pageEnd"/>    treat this -->
					<!--END CATEGORY OF INCOME SECTION -->
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule A</div>
						<div class="styIRS1118TitleDesc" style="width:228.8mm;">Income or (Loss) Before Adjustments
          <span class="styItalicText" style="font-weight:normal">(Report all amounts in U.S. dollars. See<b> Specific instructions</b>.)</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
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
										<span style="width:6mm;height:22mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:21mm;height:22mm;" rowspan="3" scope="col">1. <span class="styNormalText">Foreign Country or U.S. Possession (Enter two-letter code; see instructions. Use a separate line for each.)*</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:229mm;height:5mm;" colspan="9" scope="col">Gross Income or (Loss) From Sources Outside the United States (<span class="styItalicText">INCLUDE</span> Foreign Branch Gross Income here <span class="styItalicText">and</span> on Schedule F)</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;height:9mm;" colspan="2" scope="col">2. <span class="styNormalText">Deemed Dividends (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;height:9mm;" colspan="2" scope="col">3. <span class="styNormalText">Other Dividends</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:18mm;" rowspan="2" scope="col">4. <span class="styNormalText">Interest</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:18mm;" rowspan="2" scope="col">5. <span class="styNormalText">Gross Rents, Royalties, and License Fees</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:18mm;" rowspan="2" scope="col">6. <span class="styNormalText">Gross Income From Performance of Services</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:29mm;height:18mm;" rowspan="2" scope="col">7. <span class="styNormalText">Other (attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:18mm;" rowspan="2" scope="col">8. <span class="styNormalText">Total (add columns 2(a) through 7)</span>
										<span style="width:4px"/>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:9mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:9mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:9mm;" scope="col">(a) <span class="styNormalText">Exclude gross-up</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:9mm;" scope="col">(b) <span class="styNormalText">Gross-up (sec. 78)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 7) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="">
											<td class="styIRS1118TableCellLtr" style="">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="width:21mm;text-align:left;border-color:black;">
												<span class="styTableCellPad"/>
												<!-- this is for new change 1 -->
												<!-- If ForeignCountryOrUSPossession -->
												<xsl:if test="ForeignCountryOrUSPossessionCd != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(NetOperatingLossCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NetOperatingLossCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(ForeignRegulatedInvestmtCompCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(ForeignIncHighTaxedKickOutCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignIncHighTaxedKickOutCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="Section863bIncomeCd != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedDividendsExcldGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedDividendsGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherDividendsExcldGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherDividendsGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InterestReceivedAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GroRentsRyltsLcnsFeesAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;border-color:black;">
												<!-- Form to form link -->
												<div style="float:left; clear:none; width: 4mm">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalGrossIncomeOrLossAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 5) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 6) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="text-align:left;border-color:black;" colspan="2">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styTableCellSmall" style="text-align:left;border-color:black;" colspan="2">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDmdDividendsExcldGrossUpAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeemedDividendsGrossUpAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotOthDividendsExcldGrossUpAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDividendsGrossUpAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalInterestReceivedAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroRentsRyltsLcnsFeesAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGrossIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherIncomeLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotGrossIncomeOrLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<div class="styBB" style="width:256mm;border-bottom-width:0px;">* For section 863(b) income, NOLs, income from RICs, and high-taxed income, use a single line (see instructions). 
						<!-- button display logic -->
						<div class="styGenericDiv" style="width:24mm;text-align:right;border-top-width:0px;border-left:0px solid black;border-right:1px solid black;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'DEDctn' "/>
								<xsl:with-param name="imageID" select=" 'DEDimg' "/>
								<xsl:with-param name="buttonID" select=" 'DEDbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
						<!-- end button display logic -->
					</div>
					<!-- END INCOMEORLOSS TABLE -->
					<!-- BEGIN DEDUCTIONS TABLE -->
					<div class="styTableContainerLandscape" style="height:71mm;width:256mm;border-bottom-width:0px;" id="DEDctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:231mm;font-size:7pt;padding-top:1mm;padding-bottom:1mm;border-left-width:0px;" colspan="9" scope="col">Deductions (<span class="styItalicText">INCLUDE</span> Foreign Branch Deductions here <span class="styItalicText">and</span> on Schedule F)</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:24mm" rowspan="4" scope="col">13. <span class="styNormalText">Total Income or (Loss) Before Adjustments (subtract column 12 from column 8)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellLtr" style="width:17mm;" rowspan="3">
										<span style="width:6mm"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:143mm" colspan="5" scope="col">9. Definitely Allocable Deductions</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="3" scope="col">10. <span class="styNormalText">Apportioned Share of Deductions Not Definitely Allocable (enter amount from applicable line of Schedule H, Part II, column (d))</span>
									</th>
									<!-- 11 -->
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="3" scope="col">11. <span class="styNormalText">Net Operating Loss Deduction</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="3" scope="col">12. <span class="styNormalText">Total Deductions (add columns 9(e) through 11)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:56mm" colspan="2" scope="col">
										<span class="styNormalText">Rental, Royalty, and Licensing Expenses</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">(c) <span class="styNormalText">Expenses Related to Gross Income From Performance of Services</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">(d) <span class="styNormalText">Other Definitely Allocable Deductions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" rowspan="2" scope="col">(e) <span class="styNormalText">Total Definitely Allocable Deductions (add columns 9(a) through 9(d))</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(a) <span class="styNormalText">Depreciation, Depletion, and Amortization</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm" scope="col">(b) <span class="styNormalText">Other Expenses</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 7) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr" style="width:17mm;">
												<span class="styTableCellPad" style="font-weight:bold;border-color:black;width:7mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecDpltnAmortExpnsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="border-color:black;"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherExpensesAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GroIncmRelatedExpensesAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherAllocableDeductionsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<!--10-->
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<!-- 11 -->
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetOperatingLossDeductionAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalDeductionAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:27mm;"/>
											</td>
											<td class="styTableCell" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotIncmOrLossBfrAdjustmentsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad" style="width:24mm;"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows income or (loss) before adjustments Schedule A Deductions-->
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 5) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 6) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr" style="width:17mm;">
												<span class="styTableCellPad" style="font-size:6pt;font-weight:bold">Totals</span>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr">
												<span class="styTableCellPad" style="font-size:6pt;font-weight:bold">Totals</span>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeprecDpltnAmortExpnsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherExpensesAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroIncmRelatedExpensesAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotOtherAllocableDeductionsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotalAllocableDedAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalApportionedShareDedAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalNOLDeductionAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- 12-->
											<td class="styTableCell" style="width:28mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggregateTotalDeductionAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotIncmOrLossBfrAdjAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'DEDctn' "/>
					</xsl:call-template>
					<!-- END DEDUCTIONS TABLE -->
					<xsl:if test="($Print = $Separated)">
						<br/><br/><br/><br/><br/>
					</xsl:if>
					<!--BEGIN FOOTER-->
					<div style="width:256mm;padding-top:0.5mm;border-top:0px solid black;">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right">
						  Cat. No. 10900F 
						  <span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
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
					<div class="styBB" style="width:256mm;float:left;display:table-header-group;">
						<div class="styIRS1118TitleDesc" style="width:252mm;text-align:left;padding-left:0;">Part I—Foreign Taxes Paid, Accrued, and Deemed Paid
						   <span class="styItalicText" style="font-weight:normal">(see instructions)</span>
						</div>
						<div class="styGenericDiv" style="width:3mm">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
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
									<th class="styIRS1118TableCellLtr" style="width:8mm;height:22.5mm;" rowspan="3">
										<span class="styTableCellPad" style="font-weight:bold"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" rowspan="2" colspan="2" style="width:30mm;height:15mm;">
										<br/>
										1. <span class="styNormalText">Credit is Claimed for Taxes (check one):</span>
										<br/>
										<br/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Paid</span>
										</label>
										<span style="width:4mm;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Accrued</span>
										</label>
										<!-- Added to show the pushpins -->
										<br/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
										</xsl:call-template>
										<span style="width:10mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
										</xsl:call-template>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:192mm;height:7.5mm;" colspan="8">2. <span class="styNormalText">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" scope="col" style="height:7.5mm;" rowspan="3">3. <span class="styNormalText">Tax Deemed Paid (from Schedule C- Part I, column 12, Part II, column 8(b), and Part III, column 8)</span>
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 7) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellLtr" scope="row">
												<span class="styTableCellPad" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PaidDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:15mm;text-align:center;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AccruedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldDividendsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldInterestAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxWithheldRentsRyltsLcnsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxPdOrAccrSect863bIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxPdOrAccrFrgnBranchIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxPdOrAccrServicesIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxPdOrAccrOtherIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule B - foreign tax credits -->
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">D</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 5) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">E</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 6) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchBPartI">
										<xsl:with-param name="TargetNode">F</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="text-align:left;">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;border-color:black;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="text-align:left;">
												<span style="font-weight:bold;">Totals </span>(add lines A through F)</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldDividendsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldInterestAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxWithheldRentsRyltsLcnsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrSect863bIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccrFrgnBranchIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrServicesIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrOtherIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:24mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/AggrtTotFrgnTaxesPaidOrAccrAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:25mm;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaidAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'FTPctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE B PART I TABLE -->
					<!-- END SCHEDULE B PART I-->
					<!-- BEGIN SCHEDULE B PART II TITLE -->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc" style="padding-left:0;">Part II—Separate Foreign Tax Credit
							<span class="styItalicText" style="font-weight:normal">(Complete a </span> <span style="width:1mm;" />
							<span class="styItalicText" style="font-weight:bold">separate </span> <span style="width:1mm;" />
							<span class="styItalicText" style="font-weight:normal"> Part II for </span> <span style="width:1mm;" />
							<span class="styItalicText" style="font-weight:bold">each </span> <span style="width:1mm;" />
							<span class="styItalicText" style="font-weight:normal"> applicable category of income.)</span>
						</div>
					</div>
					<!-- END SCHEDULE B PART II TITLE -->
					<!-- BEGIN SCHEDULE B PART II -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">1a</div>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/AggrtTotFrgnTaxesPaidOrAccrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDescLandscape" style="width:184mm">Foreign taxes paid or accrued by the corporation during prior tax years that were suspended due to the rules of section 909 and for which the related income is taken into account by the corporation during the current tax year (see instructions)
						    <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							  </span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;">
							<span style="height:6mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TxsAttributableRelatedIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaidAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ForeignTaxReductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDescLandscape" style="width:184mm;">
          Taxes reclassified under high-tax kickout
          
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
          </span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignIncHighTaxKickOutAdjAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDescLandscape" style="width:184mm;">Enter the sum of any carryover of foreign taxes (from Schedule K, line 3, column (xiv) and from Schedule I, Part III, line 3) plus any carrybacks to the current tax year
          <!-- Form to Form links -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotCYCarryoverFrgnOilAndTxAmt"/>
							</xsl:call-template>
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
							</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;">
							<span style="height:6.5mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotCYCarryoverFrgnOilAndTxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDescLandscape">Total foreign taxes (combine lines 1a through 5)
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
                      <xsl:with-param name="Desc">Form 1118 Line 6 - Total Foreign Tax</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxesAmt/@foreignIncHighTaxedKickOutCd"/>
                    </xsl:call-template>
                    </div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxesAmt"/>
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
								<!-- RIS change -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ScheduleJOrTotalIncmBfrAdjAmt"/>
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
   
          </span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ScheduleJOrTotalIncmBfrAdjAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxableIncomeAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxableIncomeAdjAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/NetTotalTaxableIncomeAdjAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/NumLimitationFractionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDescLandscape">Total U.S. income tax against which credit is allowed (regular tax
						  liability (see section 26(b)) minus American Samoa economic development credit)
						  <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalUSIncomeTaxCrAllowedAmt"/>
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
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/CreditLimitationAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SeparateForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END SCHEDULE B PART II-->
					<!-- BEGIN SCHEDULE B PART III TITLE -->
					<div class="styBB" style="height:8mm;width:256mm;">
						<div class="styIRS1118TitleDesc" style="height:8mm;width:256mm;font-weight:normal;padding-left:0;">
							<b>Part III—Summary of Separate Credits</b> (Enter amounts from Part II, line 12 for each applicable category of income. 
							<b> Do not </b>include taxes paid to sanctioned countries.)
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignPassiveIncTaxCreditAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignGeneralIncTaxCreditAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignIncRsrcdTreatyTaxCrAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/RelatedTaxAdjustmentAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/IntlBoycottCreditReductionAmt"/>
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
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!-- END SCHEDULE B PART III-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE C -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule C</div>
						<span class="styIRS1118TitleDesc">Tax Deemed Paid by Domestic Corporation Filing Return</span>
						<div style="margin-left: 27mm; width: 220mm; float:left; clear:none">
							<span class="styItalicText">Use this schedule to figure the tax deemed paid by the corporation
								  with respect to dividends from a first-tier foreign corporation under section 902(a), and
								  deemed inclusions of earnings from a first- or lower-tier foreign corporation under section
								  960(a). <span class="styBoldText">Report all amounts in U.S. dollars unless otherwise
								  specified. </span>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE C PART I-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;padding-left:0;">Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings</div>
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
						<table class="styTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (see instructions)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 8) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<!-- column 4 -->
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float: left; clear:none;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
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
					
					<div class="styBB" style="width:256mm;float:none;clear:none;border-top-width:0;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;padding-left:0;border-top-width:0;"></div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnB' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DIVDIPST1986ctnB" style="height:auto;width:256mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="height:auto;width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends and Deemed Inclusions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Multiply column 7 by column 9</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" rowspan="2" scope="col">11. <span class="styNormalText">Section 960(c) Limitation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" rowspan="2" scope="col">12. <span class="styNormalText">Tax Deemed Paid (subtract column 11 from column 10)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 8) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsDmdInclsnFuncCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsDmdInclsnUSDollarAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986FrgnIncmTxsDivEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Section960cLimitationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule C Part I -->
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 1) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 2) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 3) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 4) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 5) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 6) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &lt; 7) or ((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchCPartIB"/>
								</xsl:if>
								<!-- End of filler rows -->
								<tr>
									<td class="styIRS1118TableCellNW" style="height:6mm;text-align:left;" colspan="6">
										<span class="styBoldText">Total</span> (Add amounts in column 12. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
										<!--Dotted Line-->
										<span>
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										</span>
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="height:6mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivDmdInclsnPost1986TxDmdPdAmt"/>
												</xsl:call-template>
												<span style="width:1px"/>
											</td>
										</tr>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnB' "/>
					</xsl:call-template>
					<xsl:if test="($Print = $Separated)">
						<br/><br/><br/>
					</xsl:if>
					</div>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE C PART I-->
					
					<!--BEGIN FOOTER-->
					<div style="width:256mm;border-top:1px solid black;">
						<div style="float: left; clear: none;border-bottom:0px solid black;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right;border-bottom:0px solid black;">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd" style="border-bottom:0px solid black;"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div style="width:256mm;border-bottom:1px solid black;">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE C PART II-->
					<div class="styBB" style="width:256mm;display:block;">
						<div class="styTitleName">Schedule C</div>
						<span class="styIRS1118TitleDesc" style="display:inline;">Tax Deemed Paid by Domestic Corporation Filing Return <span style="font-weight:normal;"><i>(Continued)</i></span></span>
					</div>
					<div class="styBB" style="width:256mm;float:none;clear:none;padding-left:0;">
						<div class="styIRS1118TitleDesc" style="width:252mm;padding-left:0;">Part II—Dividends Paid Out of Pre-1987 Accumulated Profits</div>
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
									<th class="styIRS1118TableCellHeaderSmall" style="width:23mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:14mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency computed under section 902) (attach schedule)</span>
										<br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid on Earnings and Profits (E&amp;P) for Tax Year Indicated (in functional currency) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide column 6(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &lt; 6) or ((count($Form1118ScheduleC/DivPaidPre1987AccumProfits) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DivPaidPre1987AccumProfits">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits/AccumulatedProfitsAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EarnAndPrftTaxesPdAndDmdPdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
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
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:1px;" colspan="11">
												<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
												<!--Dotted Line-->
												<span>
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												</span>
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="width:25mm;padding-right:3px;border-bottom-width:1px;">
												<span style="width:24mm;"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;" colspan="11">
												<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
												<!--Dotted Line-->
												<span>
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												</span>
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="border-bottom-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987TaxDmdPdAmt"/>
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
					<xsl:if test="($Print = $Separated)">
						<br/><br/><br/>
					</xsl:if>
					<!-- BEGIN SCHEDULE C PART III-->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;padding-left:0;">Part III—Deemed Inclusions From Pre-1987 Earnings and Profits</div>
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
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:38mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">E&amp;P for Tax Year Indicated (in functional currency translated from U.S. dollars, computed under section 964) (attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Deemed Inclusions</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide column 6(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (multiply column 5 by column 7)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &lt; 6) or ((count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts/EarningsAndProfitsAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EarningsAndProfitsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedInclsnFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedInclsnUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DeemedInclsnEarnPrftsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
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
									<xsl:when test="(count($Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts) &gt; 5) and ($Print = $Separated)">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:1px;border-bottom-width:1px;" colspan="10">
												<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
												<!--Dotted Line-->
												<span>
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												</span>
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td style="border-bottom:1px solid black;">
												<span style="width:20mm;" />
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellNW" style="text-align:left;border-bottom-width:1px;" colspan="10">
												<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
												<!--Dotted Line-->
												<span>
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												  <span style="width:10px"/>.
												</span>
												<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="width:25mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987TaxDmdPdAmt"/>
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
					</div>
					<!-- Set Initial Height of Above Table -->
					<!-- END SCHEDULE C PART III-->
					<!-- END SCHEDULE C -->
					<xsl:if test="($Print = $Separated)">
						<br/><br/>
					</xsl:if>
					<!--BEGIN FOOTER-->
					<div style="width:256mm;border-top:0px solid black;">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">5</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE D -->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule D</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by First- and Second-Tier Foreign Corporations under
          Section 902(b)
        </div>
						<div style="margin-left: 27mm; width: 220mm; float:left; clear:none">
							<i>Use Part I to compute the tax deemed paid by a first-tier foreign
							  corporation with respect to dividends from a second-tier foreign corporation. Use Part II
							  to compute the tax deemed paid by a second-tier foreign corporation with respect to
							  dividends from a third-tier foreign corporation.</i>
							<span class="styBoldText">
								<i> Report all amounts in U.S. dollars unless otherwise specified.</i>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE D PART I-->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc" style="padding-left:0;">Part I—Tax Deemed Paid by First-Tier Foreign Corporations</div>
					</div>
					<!-- BEGIN SCHEDULE D PART I SECTION A -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">Section A—Dividends Paid Out of Post-1986 Undistributed Earnings
						  <span style="font-weight:normal">(Include the column 10 results in Schedule C, Part I,
							column 6(b).)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier"/>
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
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:17mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of second-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:65mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SecondTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float:left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part I Section A -->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartISecA">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartISecA"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '1TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">
					    </div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '1TUEctn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="1TUEctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFirstTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part I Section A2 -->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDivPost19861stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecA2"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '1TUEctn2' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART I SECTION A -->
					<!-- BEGIN SCHEDULE D PART I SECTION B -->
					<div style="width:256mm;height:5mm;float:none;clear:none;display:block;border-bottom:1px solid black;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">Section B—Dividends Paid Out of Pre-1987 Accumulated Profits
						  <span style="font-weight:normal">(Include the column 8(b) results in Schedule C, Part I,
							column 6(b).)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends1stTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '1TAPctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;border-top:1px solid black;display:block;" id="1TAPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="height:auto;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:21mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of second-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:29mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency—see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide column 6(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 6) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends1stTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SecondTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends1stTier/AccumulatedProfitsAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFirstTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part I Section B -->
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 1) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartISecB">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartISecB"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 2) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 3) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 4) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends1stTier) &lt; 5) or ((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartISecB"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends1stTier"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '1TAPctn' "/>
					</xsl:call-template>
					</div>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART I SECTION B -->
					<!-- END SCHEDULE D PART I-->
					
					<!--BEGIN FOOTER-->
					<div style="width:256mm;border-top:0px solid black;">
						<div style="float: left; clear: none;border-bottom:0px solid black;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right;border-bottom:0px solid black;">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd" style="border-bottom:0px solid black;"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div style="width:256mm;border-bottom:1px solid black;">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">6</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE D PART II -->
					<div class="styBB" style="width:256mm;border-top-width:0px;display:block;">
						<div class="styTitleName">Schedule D</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by First- and Second-Tier Foreign Corporations under Section 902(b) <span style="font-weight:normal;"><i>(Continued)</i></span></div>
					</div>
					<!-- BEGIN SCHEDULE D PART II -->
					<div class="styBB" style="width:256mm;">
						<div class="styIRS1118TitleDesc" style="padding-left:0;">Part II—Tax Deemed Paid by Second-Tier Foreign Corporations</div>
					</div>
					<!-- BEGIN SCHEDULE D PART II SECTION A -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">Section A—Dividends Paid Out of Post-1986 Undistributed Earnings
						  <span style="font-weight:normal;display:inline;">(In general, include the column 10 results in Section A, column 6(b), of Part I. However, see instructions for
							Schedule C, Part I, column 6(b) for an exception.)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier"/>
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
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:17mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of third-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:65mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span><br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ThirdTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float:left;clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part II Section A -->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartIISecA">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartIISecA"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA"/>
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
						<xsl:with-param name="containerID" select=" '2TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '2TUEctn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="2TUEctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule E, Part I, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 6) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part II Section A 2-->
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 1) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 2) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 3) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 4) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &lt; 5) or ((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
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
						<xsl:with-param name="containerID" select=" '2TUEctn2' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE D PART II SECTION A -->
					<!-- BEGIN SCHEDULE D PART II SECTION B TABLE -->
					<div style="width:256mm;height:8mm;float:none;clear:none;display:block;;border-bottom:1px solid black;">
						<div class="stySectionDesc" style="width:251.8mm;text-align:left;padding-left:0;">Section B—Dividends Paid Out of Pre-1987 Accumulated Profits
						  <span style="font-weight:normal;display:inline;">(In general, include the column 8(b) results in Section A, column 6(b), of Part I. However, see instructions for
							Schedule C, Part I, column 6(b) for an exception.)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '2TAPctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="border-top:1px solid black;display:block;" id="2TAPctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:21mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of third-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:29mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency—attach schedule)</span><br/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency—see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide column 6(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">In Functional Currency of Third-tier Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 6) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends2ndTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ThirdTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div style="float:left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier/AccumulatedProfitsAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule D Part II Section B -->
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 1) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchDPartIISecB">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchDPartIISecB"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 2) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 3) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 4) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &lt; 5) or ((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchDPartIISecB"/>
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
						<xsl:with-param name="containerID" select=" '2TAPctn' "/>
					</xsl:call-template>
					</div>
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
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">7</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE E-->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule E</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by Certain Third-, Fourth-, and Fifth-Tier Foreign Corporations Under Section 902(b)
        </div>
						<div style="margin-left: 27mm; width: 220mm; float:left; clear:none">
							<i>Use this schedule to report taxes deemed paid with respect to
							  dividends from eligible post-1986 undistributed earnings of fourth-, fifth-, and
							  sixth-tier controlled foreign corporations.</i>
							<span class="styBoldText">
								<i> Report all amounts in U.S. dollars unless otherwise specified.</i>
							</span>
						</div>
					</div>
					<!-- BEGIN SCHEDULE E -->
					<div class="styBB" style="height:8mm;width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">Part I—Tax Deemed Paid by Third-Tier Foreign Corporations
						  <span style="font-weight:normal;display:inline;">(In general, include the column 10 results in Schedule D, Part II, Section A, column 6(b).
							However, see instructions for Schedule C, Part I, column 6(b) for an exception.)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier"/>
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
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Fourth-Tier Foreign Corporation and Its Related Third-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:17mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of fourth-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:65mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="FourthTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part I -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartI">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '3TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					
<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '3TUEctn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN SCHEDULE E PART I-->
					<div class="styTableContainerLandscape" id="3TUEctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part II, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Of Third-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFourthTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part I -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartI2"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '3TUEctn2' "/>
					</xsl:call-template>
					</div>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE E PART I-->

					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">8</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE E PART II-->
					<!-- BEGIN FOURTHTIER_TAX TABLE-->
					<div class="styBB" style="width:256mm;">
						<div class="styTitleName">Schedule E</div>
						<div class="styIRS1118TitleDesc">Tax Deemed Paid by Certain Third-, Fourth-, and Fifth-Tier Foreign Corporations Under Section 902(b) <span style="font-weight:normal"><i>(Continued)</i></span></div>
					</div>
					<div class="styBB" style="height:8mm;width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">Part II—Tax Deemed Paid by Fourth-Tier Foreign Corporations
						  <span style="font-weight:normal;display:inline;">(In general, include the column 10 results in column 6(b) of Part I. However, see instructions
							for Schedule C, Part I, column 6(b) for an exception.)
						  </span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier"/>
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
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Fifth-Tier Foreign Corporation and Its Related Fourth-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:17mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of fifth-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:65mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="FifthTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part II -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '4TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '4TUEctn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:56mm;" id="4TUEctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part III, column 10)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFifthTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFourthTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part II -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartII2"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '4TUEctn2' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END FOURTHTIER_TAX -->
					<!-- END SCHEDULE E PART II-->
					<!-- BEGIN SCHEDULE E PART III-->
					<!-- BEGIN FIFTHTIER_TAX -->
					<div class="styBB" style="height:8mm;width:256mm;float:none;clear:none;display:block;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">Part III—Tax Deemed Paid by Fifth-Tier Foreign Corporations
							 <span style="font-weight:normal;display:inline;">(In general, include the column 10 results in column 6(b) of Part II above. However, see
								instructions for Schedule C, Part I, column 6(b) for an exception.)
							</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '5TUEctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="display:block;" id="5TUEctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:74mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Sixth-Tier Foreign Corporation and Its Related Fifth-Tier Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:17mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of sixth-tier foreign corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:65mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number</span><br/><span class="styNormalText">(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:choose>
													<xsl:when test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SixthTierCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div style="float: left; clear: none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part III -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartIII">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartIII"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '5TUEctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:256mm;float:none;clear:none;">
						<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '5TUEctn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="5TUEctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" rowspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid for Tax Year Indicated</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5 and 6)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:72mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText">Divide column 8(a) by column 4</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:37mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Of Sixth-tier CFC</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:36mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSixthTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFifthTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part III -->
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIII2"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '5TUEctn2' "/>
					</xsl:call-template>
					</div>
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
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">9</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE F AND G-->
					<div class="styBB" style="width:256mm;clear:both;border-bottom-width:0px;">
						<div class="styIRS1118ScheduleCell" style="border-bottom:0px;border-right-width:0px;">
							<!-- BEGIN GROSSINCOME TABLE -->
							<div class="styBB" style="height:8mm;width:127mm;">
								<div class="styTitleName" style="height:4mm;">Schedule F</div>
								<div class="styIRS1118TitleDesc" style="width:95mm;">Gross Income and Definitely Allocable Deductions for Foreign Branches </div>
								<div class="styIRS1118TitleDesc" style="width:9mm;text-align:right;">
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
							<div class="styIRS1118TableContainerSchF" id="FGIctn" style="">
								<!-- print logic -->
								<xsl:call-template name="SetInitialState"/>
								<!-- end -->
								<table class="styTable" cellspacing="0" style="height: 82mm;">
									<thead class="styTableThead">
										<tr>
											<th class="styIRS1118TableCellHeaderSmall" colspan="2" style="width:47mm;border-right-width:1px;">
												<b>1. </b>
												<span class="styNormalText" style="display:inline;"> Foreign Country or U .S. Possession (Enter
												two-letter code from Schedule A, column 1. Use a separate line for each.)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:39mm;">2. <span class="styNormalText">Gross Income</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:39mm;border-right-width:0;">3. <span class="styNormalText">Definitely Allocable Deductions</span>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:if test="(count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &lt; 7) or ((count($Form1118ScheduleF/ForeignGrossIncmAndAllcblDed) &gt; 6) and ($Print != $Separated))">
											<xsl:for-each select="$Form1118ScheduleF/ForeignGrossIncmAndAllcblDed">
												<tr style="">
													<td class="styIRS1118TableCellLtr" style="text-align:center;font-weight:bold;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RowId"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:39mm;text-align:left;border-color:black;">
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
													<td class="styTableCellSmall" style="width:39mm;border-color:black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="width:37mm;border-color:black;border-right-width:0;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
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
												<tr style="border-right-width:0;">
													<td class="styTableCellSmall" colspan="2" style="height:8mm;width:47mm;text-align:left;vertical-align:bottom;border-bottom-width:1px;border-color:black;">
														<span style="font-weight:bold;">Totals </span>(add lines A through F)* <span style="width:10mm;text-align:right;">
															<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
														</span>
													</td>
													<td class="styTableCellSmall" style="height:8mm;width:39mm;vertical-align:bottom;border-bottom-width:1px;border-color:black;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="height:8mm;width:37mm;vertical-align:bottom;border-bottom-width:1px;border-right-width:0;border-color:black;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr style="border-right-width:0;">
													<td class="styTableCellSmall" colspan="2" style="height:8mm;width:47mm;text-align:left;vertical-align:bottom;border-bottom-width:1px;border-color:black;">
														<span style="font-weight:bold;">Totals </span>(add lines A through F)* <span style="width:10mm;text-align:right;">
															<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
														</span>
													</td>
													<td class="styTableCellSmall" style="height:8mm;width:39mm;vertical-align:bottom;border-bottom-width:1px;border-color:black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotalGrossIncomeAmt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCellSmall" style="height:8mm;width:37mm;vertical-align:bottom;border-bottom-width:1px;border-right-width:0px;border-color:black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/AggrgtTotalAllocableDedAmt"/>
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
								<xsl:with-param name="containerHeight" select="12"/>
								<xsl:with-param name="containerID" select=" 'FGIctn' "/>
							</xsl:call-template>
							<!-- END Set Initial Height of Above Table -->
							<!-- END GROSSINCOME TABLE -->
						</div>
						<div class="styIRS1118ScheduleCell" style="border-left-width:1px;border-right-width:0px;border-bottom-width:0px;">
							<div class="styBB">
								<div class="styTitleName">Schedule G</div>
								<div class="styIRS1118TitleDesc" style="width:103mm;height:8mm;">Reductions of Taxes Paid, Accrued, or Deemed Paid</div>
							</div>
							<div style="width:127mm;float:left;clear:none;border-bottom:1pt solid black;font-size:8pt;font-weight:bold;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;">
								Part I -- Reduction Amounts
							</div>
							<div style="width:127mm;float:left;clear:none;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm;text-align:center;float:left;clear:none;border-left-width: 0px">A</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">
									 Reduction of Taxes Under Section 901(e)—Attach separate <br/> schedule
									 <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReductionAmt"/>
									 </xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm;text-align:center;float:left;clear:none;border-left-width: 0px">B</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">Reduction of Foreign Oil and Gas Taxes—Enter
									amount from Schedule I, Part II, line 4</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ReductionForeignOilGasTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:11mm;padding-top:3mm;text-align:center;float:left;clear:none;border-left-width: 0px">C</div>
								<div class="styIRS1118LNDescRed" style="height:11mm;">Reduction of Taxes Due to International Boycott Provisions—Enter appropriate portion of Schedule C (Form 5713), line 2b. <span class="styBoldText">Important:</span> Enter only "specifically attributable taxes" here.</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ForeignTaxCreditReductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;padding-top:2mm;text-align:center;float:left;clear:none;border-left-width: 0px">D</div>
								<div class="styIRS1118LNDescRed" style="height:8mm;">
								  Reduction of Taxes for Section 6038(c) Penalty—Attach separate schedule
								  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPnltyTxReductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPnltyTxReductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<xsl:for-each select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt">
								<xsl:variable name="pos" select="position()"/>
								<div style="width:127mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="border-left-width:0px;text-align:center;float:left;clear:none;height:5mm;">E</div>
									<div class="styIRS1118LNDescRed" style="height:5mm;">Taxes suspended under section 909
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt[$pos]"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt[$pos]"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:for-each>
							<div style="width:127mm;">
								<div class="styIRS1118LNLeftNumBoxB" style="border-left-width:0px;text-align:center;float:left;clear:none;height:5mm;">F</div>
								<div class="styIRS1118LNDescRed" style="height:5mm;">Other Reductions of Taxes—Attach schedule(s)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OtherTaxReductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OtherTaxReductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;height:5mm;">
								<div class="styIRS1118LNDescRed" style="width:92mm;border-left-width:0px;border-bottom-width:0px;padding-top:1mm;padding-left:1mm;font-size:6pt;">
									<span class="styBoldText"> Total</span> (add lines A through F). Enter here and on Schedule B, Part II, line 3
								</div>
								<div class="styIRS1118LNDescRed" style="width:3mm;padding-top:1mm;border-bottom-width:0px;">
									<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
								</div>
								<div class="styLNAmountBox" style="padding-top:1mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ForeignTaxReductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127mm;float:left;clear:none;border-bottom:0pt;border-top:1pt solid black;font-size:8pt;font-weight:bold;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;">
								Part II -- Other Information
							</div>
							<div style="width:127mm;float:left;clear:none;border-bottom:0pt;border-top:1pt solid black;border-left:0pt solid black;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;">
								<span style="width:4mm;vertical-align:top;"></span>  
								<span style="width:122mm;border-left-width:0;">Check this box if, during the tax year, the corporation paid or accrued any foreign tax that was disqualified for credit under section 901(m)
								<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......... </span>
								  <span>
									<xsl:call-template name="PopulateSpan">
									  <xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
									</xsl:call-template>
									<input type="checkbox">
									  <xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
									  </xsl:call-template>
									</input>
								  </span>
								  <label>
									<xsl:call-template name="PopulateLabel">
									  <xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
									</xsl:call-template>
									<span style="font-weight:bold;"> </span>
								  </label>
							   </span>
							</div>
						</div>
					</div>
					
					<!--BEGIN FOOTER-->
					<div style="width:256mm;border-top:1pt solid black;">
						<div style="float:left;clear:none;">
							<div style="width:150mm;padding-top:1mm;font-size:6pt;" class="styItalicText">
								<span class="styBoldText" style="font-style:normal; ">*Note:</span> The Schedule F totals are not carried over to 
								any other Form 1118 Schedule. (These totals were already included in Schedule A.) However, the IRS
							    requires the corporation to complete Schedule F under the authority of section 905(b).
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:100mm;">
								<span style="width:62mm;"/>
								 Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)</div>
						</div>
					</div><div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">10</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE H PART I-->
					<div class="styBB" style="height:4.5mm;width:256mm;display:block;">
						<div class="styTitleName" style="height:4.5mm;">Schedule H</div>
						<div class="styIRS1118TitleDesc">Apportionment of Deductions Not Definitely Allocable
							  <span class="styItalicText">
								<span class="styNormalText">(complete only once)</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;text-align:left;display:block;">
						<div style="width:256mm;text-align:left;font-size:9pt;font-weight:bold;padding-left:0;">Part I—Research and Development Deductions         </div>
					</div>
					<xsl:choose>
						<xsl:when test="( ( (count($Form1118ScheduleH/ResearchDevDedSalesMethod) &gt; 2) or (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesCrtnDivEach1050PFIC) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/RDDeductionsTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/GrossIncomeSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/GrossIncomeTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDedTreatyResourcedIncome) &gt; 1) )                             and ($Print = $Separated))">
							<div style="height:auto;width:256mm;display:block;">
								<table class="styTable" cellspacing="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(a)</span> Sales Method</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(b)</span> Gross Income Method-Check method used:
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>Option 1
												</label>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>Option 2</label>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="3" style="height:17mm;width:25mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;border-bottom-width:0px;">
												<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
													Allocable (enter the sum of all amounts entered in all applicable "R&amp;D Deductions" columns)
											</td>
										</tr>
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(i)</span> Gross Sales</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iii)</span> Gross Sales</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(v)</span> Gross Income</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vii)</span> Gross Income</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:25mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
										</tr>
									</thead>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:4.5mm;">1</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Totals (see instructions)</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod"/>
												<xsl:with-param name="ShortMessage">true</xsl:with-param>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:4.5mm;">2</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Total to be apportioned</td>
										<td class="styShadingCellSmall" style="height:8mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftNumBox" style="height:8mm;width:5mm;padding-top:1mm;">3</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:0mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">a</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">General category income</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">b</td>
										<td class="styIRS1118LNDescRD">Passive category income</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">c</td>
										<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;">d</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div style="height:auto;width:256mm;display:block;">
								<table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(a)</span> Sales Method</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(b)</span> Gross Income Method-Check method used:
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>Option 1
												</label>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>Option 2</label>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="3" style="height:17mm;width:25mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;border-bottom-width:0px;">
												<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
													Allocable (enter the sum of all amounts entered in all applicable "R&amp;D Deductions" columns)
											</td>
										</tr>
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr >
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(i)</span> Gross Sales</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iii)</span> Gross Sales</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(v)</span> Gross Income</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vii)</span> Gross Income</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:25mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
										</tr>
									</thead>
									<tr>
										<td style="height:8mm;width:5mm;font-weight:bold;padding-left:1mm;padding-top:4mm;border-bottom:1px solid black;">1</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;font-size:5pt;padding-top:4mm;">Totals (see instructions)</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTotalsAmount"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTotalsAmount"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:25mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="height:8mm;width:5mm;font-weight:bold;padding-left:1mm;padding-top:4mm;border-bottom:1px solid black;">2</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">Total to be apportioned</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalsApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalsApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalsApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalsApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:25mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftNumBox" style="height:8mm;width:5mm;padding-top:0mm;">3</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:0mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:6mm;">a</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">General category income</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsGeneralCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:25mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsGenCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:6.5mm;">b</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">Passive category income</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomePassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomePassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsPassiveCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:25mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsPssvCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styIRS1118LNDescRD" style="width:8mm;height:12mm;font-size:6pt;font-weight:bold;padding-left:3mm;vertical-align:center;">
											c				
										</td>
										<td class="styIRS1118LNDescRD" style="height:12mm;vertical-align:center;">c Section 901(j) income*</td>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsSection901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsSection901jIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDeductionsSect901jIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsSect901jIncmAmt"/>
										</xsl:call-template>
									</tr>
									<tr>
										<td class="styIRS1118LNDescRD" style="width:8mm;height:12mm;font-size:6pt;font-weight:bold;padding-left:3mm;vertical-align:center;">
											d
										</td>
										<td class="styIRS1118LNDescRD" style="height:12mm;vertical-align:center;">Income re-sourced by treaty*</td>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTreatyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTreatyRscIncmAmt"/>
										</xsl:call-template>
										<xsl:call-template name="AddRowsForSchH">
											<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDeductionsTrtyRscIncmAmt)"/>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsTrtyRscIncmAmt"/>
										</xsl:call-template>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">4</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsTotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
							<!-- Repeat Column Code -->
							<xsl:for-each select="$Form1118ScheduleH/ResearchDevDedSalesMethod">
								<xsl:if test="(position() mod 4) = 3">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<div style="width:256mm;display:block;">
										<table class="styTable" cellspacing="0">
											<thead class="styTableThead">
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:196mm;border-left-width:1px;border-right:0px;" colspan="8">
														<span class="styBoldText">(a)</span> Sales Method
													</td>
												</tr>
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 0]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 1"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 2"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 3"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/SICCd"/>
														</xsl:call-template>)*
													</td>
												</tr>
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(i)</span> Gross Sales</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iii)</span> Gross Sales</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(v)</span> Gross Income</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vii)</span> Gross Income</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:25mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<tr>
													<td style="height:8mm;width:5mm;font-weight:bold;padding-left:1mm;padding-top:4mm;border-bottom:1px solid black;">1</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:60mm;font-size:5pt;padding-top:4mm;">Totals (see instructions)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td style="height:8mm;width:5mm;font-weight:bold;padding-left:1mm;padding-top:4mm;border-bottom:1px solid black;">2</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">Total to be apportioned</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftNumBox" style="height:8mm;width:5mm;padding-top:2.5mm;">3</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:0mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:5mm;">a</td>
													<td class="styIRS1118LNDescRD">General category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">b</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Passive category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">c</td>
													<td class="styIRS1118LNDescRD" style="height:12mm;">Section 901(j) income*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">d</td>
													<td class="styIRS1118LNDescRD" style="height:12mm;vertical-align:top;padding-top:4mm;">Income re-sourced by treaty*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8.5mm;padding-left:1mm;padding-top:2.5mm;border-bottom:1px solid black;">4</td>
													<td class="styIRS1118LNDescRD" style="height:8.5mm;">Total foreign (add lines 3a through 3d)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalForeignAmt"/>
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
							<!-- Repeat Column Code -->
							<xsl:for-each select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod">
								<xsl:if test="(position() mod 4) = 3">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<div style="width:256mm;display:block;">
										<table class="styTable" cellspacing="0">
											<thead class="styTableThead">
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:196mm;border-left-width:1px;border-right:0px;" colspan="8">
														<span class="styBoldText">(b)</span> Gross Income Method
													</td>
												</tr>
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 0]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mmborder-left-width:1px;border-right-width:0px;;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 1"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 2"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 3"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/SICCd"/>
														</xsl:call-template>)*
													</td>
												</tr>
												<tr >
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(i)</span> Gross Sales</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iii)</span> Gross Sales</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(v)</span> Gross Income</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vii)</span> Gross Income</td>
													<td class="styIRS1118TableCellHeaderSmall" style="height:7mm;width:25mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<tr>
													<td style="height:8mm;width:5mm;font-weight:bold;padding-left:1mm;padding-top:4mm;border-bottom:1px solid black;">1</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:60mm;padding-top:4mm;">Totals (see instructions)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;padding-left:1mm;">2</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Total to be apportioned</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:4px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftNumBox" style="height:8mm;width:5mm;padding-top:2.5mm;">3</td>
													<td class="styIRS1118LNDescRD" style="border-bottom-width:0px;height:8mm;width:30mm;">Apportionment among statutory groupings:</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:4px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">a</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">General category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">b</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Passive category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">c</td>
													<td class="styIRS1118LNDescRD" style="height:12mm;vertical-align:top;padding-top:4mm;">Section 901(j) income*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;">d</td>
													<td class="styIRS1118LNDescRD" style="height:12mm;vertical-align:top;padding-top:4mm;">Income re-sourced by treaty*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr>
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:2.5mm;">4</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalForeignAmt"/>
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
					</div>
					</div>
					
					<!--BEGIN FOOTER-->
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">*Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H </span>in instructions</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)</div>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
					<div class="styBB" style="width:256mm">
						<div style="float: left; clear: none">Form 1118 (Rev. 12-2015)</div>
						<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">11</span>
						</div>
					</div>
					<!--END HEADER-->
					
					<!-- BEGIN SCHEDULE H PART II-->
					<div class="styBB" style="border-top-width: 1px; width:256mm;border-top-width:0px;">
						<div class="styTitleName">Schedule H</div>
						<div class="styIRS1118TitleDesc">Apportionment of Deductions Not Definitely Allocable
          <span class="styItalicText">
								<span class="styNormalText">(continued)</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;text-align:left;padding-left:0;">
						<div class="styIRS1118TitleDesc" style="text-align:left;padding-left:0;">Part II—Interest Deductions, All Other Deductions, and Total Deductions
          <!-- The xsl:choose code block below enables this stylesheet to display data from more than one schema version -->
						</div>
					</div>
					<!-- Choose for Separated Repeated Data -->
					<xsl:choose>
						<!-- When Repeated Data exists and the Separated tag is set, create the empty shell -->
						<xsl:when test="(( (count($Form1118ScheduleH/AvgAstValNonfinclDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstValFinclDivFromEach1050) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclDivFromEach1050) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/OthNotAllcblDedDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/TotalsCertainDivFrEach1050PFIC) &gt; 1) or                               (count($Form1118ScheduleH/Section901jIncomeTotalsAmt) &gt; 1) or                               (count($Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt) &gt; 1)                             )                             and ($Print = $Separated))">
							<div style="width:256mm;clear:both;">
								<table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="2" style="height:34mm;width:77mm;border-left-width:0px;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" style="height:22mm;width:60mm;text-align:left;float:none;border-right-width:0px;border-left-width:1px;">
												<span style="width:16px"/>
												<span class="styBoldText">(a)</span>
                Average Value of Assets–<br/>
												<span style="width:48px"/>
                Check method used:<br/>
												<div>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>Fair market value
												</label>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
												</label>
												</div>
												<br/>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
                </label>
												<br/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" style="height:22mm;width:60mm;float:none;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="2" style="height:34mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
              </td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="2" style="height:34mm;width:30mm;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(d)</span>
                Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                corresponding Schedule A.
              </td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(ii)</span> Financial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iv)</span> Financial Corporations</td>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:4mm;">
												<span class="styBoldText">1<span style="width:2px"/>a</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Totals (see instructions)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;text-align:left;">See Add'l Data<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:4.5mm;padding-top:4mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Assets excluded from apportionment formula</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4.5mm;padding-left:1mm;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:12mm;padding-top:4mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
      and 1d from line 1a)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:12mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftNumBox">3</td>
											<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">a</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">General category income</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Passive category income</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Section 901(j) income*</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Income re-sourced by treaty*</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;padding-left:1mm">
												<span class="styBoldText">4</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Total foreign (add lines 3a through 3d)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
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
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="2" style="height:34mm;width:77mm;border-left-width:0px;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" style="height:22mm;width:60mm;text-align:left;float:none;border-right-width:0px;border-left-width:1px;">
												<span style="width:16px"/>
												<span class="styBoldText">(a)</span>
                Average Value of Assets–<br/>
												<span style="width:48px"/>
                Check method used:<br/>
												<div>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>Fair market value
												</label>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
												</label>
												</div>
												<br/>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
                </label>
												<br/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" style="height:22mm;width:60mm;float:none;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="2" style="height:34mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
              </td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="2" style="height:34mm;width:30mm;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(d)</span>
                Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                corresponding Schedule A.
              </td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(ii)</span> Financial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iv)</span> Financial Corporations</td>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;padding-left:1mm;">
												<span class="styBoldText">1<span style="width:2px"/>a</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Totals (see instructions)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">c</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclOthTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclOthTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclOthTempRegsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclOthTempRegAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">d</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Assets excluded from apportionment formula</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclAstExcldAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclAstExcldAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:1px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;">
												<span class="styBoldText">2</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
and 1d from line 1a)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotalApprtnAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalApprtnAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalApprtnAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalApprtnAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftNumBox">3</td>
											<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="border-bottom-width:0px;background-color:lightgrey;">
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">a</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">General category income</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclGenCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclGenCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclGenCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclGenCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblGenCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GeneralCategoryIncmTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;">b</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Passive category income</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclPssvCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclPssvCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclPssvCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclPssvCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblPssvCatIncmAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/PassiveCategoryIncmTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
										<tr>
											<td class="styIRS1118LNDescRD" style="width:8mm;height:12mm;font-size:6pt;font-weight:bold;padding-left:3mm;vertical-align:center;">
												c
											</td>
											<td class="styIRS1118LNDescDed" style="height:12mm;vertical-align:center;">Section 901(j) income*</td>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclSection901jIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclSection901jIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/Section901jIncomeTotalsAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/Section901jIncomeTotalsAmt"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styIRS1118LNDescRD" style="width:8mm;height:12mm;font-size:6pt;font-weight:bold;padding-left:3mm;vertical-align:center;">
												d
											</td>
											<td class="styIRS1118LNDescDed" style="height:12mm;vertical-align:center;">Income re-sourced by treaty*</td>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt"/>
											</xsl:call-template>
											<xsl:call-template name="AddRowsForSchH">
												<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt)"/>
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;padding-left:1mm">
												<span class="styBoldText">4</span>
											</td>
											<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Total foreign (add lines 3a through 3d)</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotForeignAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalForeignAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalForeignAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalForeignAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTotalForeignAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalForeignTotalsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					</div>
					<!-- END SCHEDULE H PART II-->
					
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">*Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H </span>in instructions</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2015)</div>
						</div>
					</div>
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="pageEnd"/>
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
						<xsl:call-template name="PopulateLeftoverRow">
						  <xsl:with-param name="Desc">Line 6 - Total Foreign Tax</xsl:with-param>
						  <xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalForeignTaxesAmt/@foreignIncHighTaxedKickOutCd"/>
						  <xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Repeating Data Table for Schedule A Columns 1-8 -->
					<xsl:if test="((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
						<span class="styRepeatingDataTitle">Form 1118, Schedule A, Income or (Loss) Before Adjustments, Table Columns 1-8:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="3" style="width:7mm;">
										<span style="width:4px;height:27mm;"/>
									</th>
									<th class="styDepTblCell" style="width:21mm;height:27mm;" rowspan="3" scope="col">1. <span class="styNormalText">Foreign Country or U.S. Possession (Enter two-letter code; see instructions. Use a separate line for each.)*</span>
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
								<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr" style="text-align:left;padding-left:0mm;">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- this look like blue table change 1 -->
										<td class="styTableCellSmall" style="width:21mm;text-align:left;border-color:black;">
											<span class="styTableCellPad"/>
											<xsl:if test="ForeignCountryOrUSPossessionCd != ' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(NetOperatingLossCd != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NetOperatingLossCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(ForeignRegulatedInvestmtCompCd != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="(ForeignIncHighTaxedKickOutCd != '')">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignIncHighTaxedKickOutCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="Section863bIncomeCd != ' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
												</xsl:call-template>
											</xsl:if>
											<!-- If ForeignCountryOrUSPossession -->
											<!--					<xsl:if test="not(ForeignCountryOrUSPossession='' or not(ForeignCountryOrUSPossession))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossession"/>
												</xsl:call-template>
											</xsl:if>-->
											<!-- Else, ForeignCountryOrUSPoss863B -->
											<!--											<xsl:if test="not(ForeignCountryOrUSPoss863B='' or not(ForeignCountryOrUSPoss863B))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPoss863B"/>
												</xsl:call-template>
											</xsl:if>-->
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedDividendsExcldGrossUpAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedDividendsGrossUpAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherDividendsExcldGrossUpAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherDividendsGrossUpAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InterestReceivedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GroRentsRyltsLcnsFeesAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="width:29mm;border-color:black;">
											<!-- Form to form link -->
											<div style="float: left; clear: none">
												<!--span style="width:2px;"></span-->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalGrossIncomeOrLossAmt"/>
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
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDmdDividendsExcldGrossUpAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeemedDividendsGrossUpAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotOthDividendsExcldGrossUpAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherDividendsGrossUpAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalInterestReceivedAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroRentsRyltsLcnsFeesAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGrossIncomeAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:29mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherIncomeLossAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotGrossIncomeOrLossAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule A Columns 9-12 -->
					<xsl:if test="((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule A, Deductions, Table Columns 9-13:</span>
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
									<!-- new 11-->
									<th class="styDepTblCell" style="width:32mm" rowspan="3" scope="col">11. <span class="styNormalText">
              Net Operating Loss Deduction</span>
									</th>
									<th class="styDepTblCell" style="width:32mm" rowspan="3" scope="col">12. <span class="styNormalText">Total Deductions (add columns 9(e) through 11)</span>
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
								<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeprecDpltnAmortExpnsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherExpensesAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GroIncmRelatedExpensesAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherAllocableDeductionsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- col 10 -->
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--col 11 -->
										<td class="styTableCell" style="width:32mm;border-color:black; ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetOperatingLossDeductionAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalDeductionAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:25mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotIncmOrLossBfrAdjustmentsAmt"/>
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
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeprecDpltnAmortExpnsAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherExpensesAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroIncmRelatedExpensesAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;b">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotOtherAllocableDeductionsAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<!-- mark this as 9e-->
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotalAllocableDedAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<!-- 10 -->
									<td class="styDepTblCell" style="width:32mm;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalApportionedShareDedAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<!-- 11 -->
									<td class="styDepTblCell" style="width:32mm;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalNOLDeductionAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<!-- 12 -->
									<td class="styDepTblCell" style="width:32mm;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggregateTotalDeductionAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotIncmOrLossBfrAdjAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule B, Part I -->
					<xsl:if test="((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
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
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesPaid</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Paid</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesPaidCreditInd"/>
										</xsl:call-template>
										<!-- Added to show the pushpins -->
										<span style="width:2mm;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleBCreditIsClaimedForTaxesAccrued</xsl:with-param>
											</xsl:call-template>
											<span class="styNormalText">Accrued</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/ForeignTaxesAccruedCreditInd"/>
										</xsl:call-template>
									</th>
									<th class="styDepTblCell" scope="col" style="width:192mm;height:7.5mm;" colspan="8">2. <span class="styNormalText">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
									</th>
									<th class="styDepTblCell" scope="col" style="height:7.5mm;" rowspan="3">3. <span class="styNormalText">Tax Deemed Paid (from Schedule C- Part I, column 12, Part II, column 8(b), and Part III, column 8)</span>
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
								<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr" scope="row">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellSmall" style="width:20mm;border-color:black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PaidDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:15mm;border-color:black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AccruedDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldDividendsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldInterestAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldRentsRyltsLcnsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxPdOrAccrSect863bIncmAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxPdOrAccrFrgnBranchIncmAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxPdOrAccrServicesIncmAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxPdOrAccrOtherIncmAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:24mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:25mm;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
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
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldDividendsAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldInterestAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxWithheldRentsRyltsLcnsAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrSect863bIncmAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxPdOrAccrFrgnBranchIncmAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrServicesIncmAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrOtherIncmAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:24mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/AggrtTotFrgnTaxesPaidOrAccrAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="width:25mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxesDeemedPaidAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
												
					<!-- Separated Repeating Data Table for Schedule C, Part I -->
					<xsl:if test="((count($Form1118ScheduleC/DivAndDeemedInclsnPost1986) &gt; 7) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule C, Part I - Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="font-size:5pt;width:251.8mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:14mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends and Deemed Inclusions</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule D, Part I—see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<!-- column 4 -->
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div class="styGenericDiv" style="float: left; clear:none;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986/CYEPPost1986UndistrEarnAmt"/>
											</xsl:call-template>
											</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsDmdInclsnFuncCurAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsDmdInclsnUSDollarAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr style="height:6mm;">
									<td class="styIRS1118TableCellNW" style="text-align:left;" colspan="12">
										<span class="styBoldText">Total</span> (Add amounts in column 12. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
										<!--Dotted Line-->
										<span>
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										</span>
									</td>
								</tr>
							</tbody>
						</table><br/>
						<table class="styDepTblLandscape" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="font-size:5pt;width:80mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">11. <span class="styNormalText">Section 960(c) Limitation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">12. <span class="styNormalText">Tax Deemed Paid (subtract column 11 from column 10)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DivAndDeemedInclsnPost1986">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;width:20mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;width:20mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986FrgnIncmTxsDivEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;width:20mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section960cLimitationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;width:20mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr style="height:6mm;">
									<td class="styIRS1118TableCellNW" style="text-align:left;border-right-width:1px;" colspan="3">
										<span>
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styIRS1118TableCellSmallArial">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivDmdInclsnPost1986TxDmdPdAmt"/>
										</xsl:call-template>
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
									<th class="styDepTblCell" style="width:23mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:14mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency computed under section 902) (attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid on Earnings and Profits (E&amp;P) for Tax Year Indicated (in functional currency) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DivPaidPre1987AccumProfits">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float: left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987AccumProfits/AccumulatedProfitsAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EarnAndPrftTaxesPdAndDmdPdAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
												</xsl:call-template>
											</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;" colspan="11">
										<span class="styBoldText">Total</span> (Add amounts in column 8b. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
										<!--Dotted Line-->
										<span>
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styDepTblCell" style="font-size:5pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DivPaidPre1987TaxDmdPdAmt"/>
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
									<th class="styDepTblCell" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Foreign Corporation (identify DISCs and former DISCs)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">E&amp;P for Tax Year Indicated (in functional currency translated from U.S. dollars, computed under section 964) (attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Deemed Inclusions</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (multiply column 5 by column 7)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987EarnPrfts/EarningsAndProfitsAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsAndProfitsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedInclsnFunctionalCurAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedInclsnUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DeemedInclsnEarnPrftsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" style="text-align:left;" colspan="10">
										<span class="styBoldText">Total</span> (Add amounts in column 8. Enter the result here and include on "Totals" line of Schedule B, Part I, column 3.)
										<!--Dotted Line-->
										<span>
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styDepTblCell" style="width:25mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/DeemedInclsnPre1987TaxDmdPdAmt"/>
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
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:22mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of second-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:28mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>,<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SecondTierCorpEIN"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<div class="styGenericDiv" style="float:left; clear:none">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier/CYEPPost1986UndistrEarnAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsPaidFirstTierCorpAmt"/>
												</xsl:call-template>
											</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part I, Section A - Dividends Paid Out of Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;width:45mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDivPost19861stTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule D, Part I, Section B -->
					<xsl:if test="((count($Form1118ScheduleD/AccumProfitsDividends1stTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part I, Section B - Dividends Paid Out of Pre-1987 Accumulated Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Second-Tier Foreign Corporation and Its Related First-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:12mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of second-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:12mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:12mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:33mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency—see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:5pt;" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">of First-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(a) <span class="styNormalText">Functional Currency of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:5pt;" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends1stTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFirstTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SecondTierCorpEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends1stTier/AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFirstTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule D, Part II, Section A -->
					<xsl:if test="((count($Form1118ScheduleD/UndistrEarnDividends2ndTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II, Section A - Dividends Paid Out of Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:14mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of third-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Schedule E, Part I, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div class="styGenericDiv" style="float:left;clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/UndistrEarnDividends2ndTier/CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II, Section A - Dividends Paid Out of Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;width:45mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/UndistrEarnDividends2ndTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule D, Part II, Section B -->
					<xsl:if test="((count($Form1118ScheduleD/AccumProfitsDividends2ndTier) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II, Section B - Dividends Paid Out of Pre-1987 Accumulated Profits:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Third-Tier Foreign Corporation and Its Related Second-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:12mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of third-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:12mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:12mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:33mm" rowspan="2" scope="col">4. <span class="styNormalText">Accumulated Profits for Tax Year Indicated (in functional currency—attach schedule)</span>
										<br/>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year indicated (in functional currency—see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Divide Column 6(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Tax Deemed Paid (see instructions)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">of Second-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">In Functional Currency of Third-tier Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/AccumProfitsDividends2ndTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedSecondTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ThirdTierCorpEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div style="float:left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/AccumProfitsDividends2ndTier/AccumulatedProfitsAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AccumulatedProfitsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAndDeemedPdAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidSecondTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsPaidAccumPrftsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidFunctionalCurAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDeemedPaidUSDollarsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule E, Part I -->
					<xsl:if test="((count($Form1118ScheduleE/TaxDeemedPaidBy3rdTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part I - Tax Deemed Paid by Third-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Fourth-Tier Foreign Corporation and Its Related Third-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:14mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of fourth-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part II, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Of Third-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FourthTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedThirdTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FourthTierCorpEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier/CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFourthTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidThirdTierCorpAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part I - Tax Deemed Paid by Third-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;width:45mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy3rdTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule E, Part II -->
					<xsl:if test="((count($Form1118ScheduleE/TaxDeemedPaidBy4thTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part II - Tax Deemed Paid by Fourth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Fifth-Tier Foreign Corporation and Its Related Fourth-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:14mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of fifth-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid and Deemed Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5, 6(a), and 6(b))</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Taxes Paid</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Taxes Deemed Paid (from Part III, column 10)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Of Fourth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FifthTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFourthTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FifthTierCorpEIN"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div class="styGenericDiv" style="float: left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier/CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFifthTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFourthTierCorpAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part II - Tax Deemed Paid by Fourth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;width:45mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy4thTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule E, Part III -->
					<xsl:if test="((count($Form1118ScheduleE/TaxDeemedPaidBy5thTier) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part III - Tax Deemed Paid by Fifth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:21mm" rowspan="2" scope="col">1a. <span class="styNormalText">Name of Sixth-Tier Foreign Corporation and Its Related Fifth-Tier Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:14mm" rowspan="2" scope="col">1b. <span class="styNormalText">EIN (if any) of sixth-tier foreign corporation</span>
									</th>
									<th class="styDepTblCell" style="width:45mm" rowspan="2" scope="col">1c. <span class="styNormalText">Reference ID number (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">2. <span class="styNormalText">Tax Year End (Yr-Mo) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm" rowspan="2" scope="col">3. <span class="styNormalText">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm" rowspan="2" scope="col">4. <span class="styNormalText">Post-1986 Undistributed Earnings (in functional currency—attach schedule)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">5. <span class="styNormalText">Opening Balance in Post-1986 Foreign Income Taxes</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">6. <span class="styNormalText">Foreign Taxes Paid for Tax Year Indicated</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">7. <span class="styNormalText">Post-1986 Foreign Income Taxes (add columns 5 and 6)</span>
									</th>
									<th class="styDepTblCell" style="width:40mm" colspan="2" scope="col">8. <span class="styNormalText">Dividends Paid (in functional currency)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" scope="col">(a) <span class="styNormalText">Of Sixth-tier CFC</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" scope="col">(b) <span class="styNormalText">Of Fifth-tier CFC</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SixthTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>,<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedFifthTierCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SixthTierCorpEIN"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<div style="float: left; clear: none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier/CYEPPost1986UndistrEarnAmt"/>
												</xsl:call-template>
											</div>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CYEPPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BalBOYPost1986UndistrEarnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Post1986ForeignIncomeTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidSixthTierCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFifthTierCorpAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part III - Tax Deemed Paid by Fifth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;width:45mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">9. <span class="styNormalText">Divide Column 8(a) by Column 4</span>
									</th>
									<th class="styDepTblCell" style="width:20mm" rowspan="2" scope="col">10. <span class="styNormalText">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPaidBy5thTier">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DividendsEarningsRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
											</xsl:call-template>
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
                    1. <span class="styNormalText">Code for Foreign Country or U.S. Possession (see instructions and use a separate line for each code)     (Use a separate line for each.)</span>
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
												<xsl:with-param name="TargetNode" select="RowId"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="width:39mm;text-align:left;border-color:black;">
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
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellSmall" style="border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
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
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/TotalGrossIncomeAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleF/AggrgtTotalAllocableDedAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Separated Repeating Data Table for Schedule H, Part I -->
					<xsl:if test="( ( (count($Form1118ScheduleH/ResearchDevDedSalesMethod) &gt; 2) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesCrtnDivEach1050PFIC) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/GrossSalesTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedSalesMethod/RDDeductionsTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/GrossIncomeSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/GrossIncomeTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsTreatyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDeductionsSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod/RDDedTreatyResourcedIncome) &gt; 1) )                             and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part I - Research and Development Deductions:</span>
            <table class="styDepTblLandscape" cellspacing="0" style="height:auto;width:256mm;font-size:6pt;">
              <thead>
                <tr class="styDepTblHdr" >
											<td class="styDepTblCell" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(a)</span> Sales Method</td>
											<td class="styDepTblCell" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="4">
												<span class="styBoldText">(b)</span> Gross Income Method-Check method used:
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption1Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption1</xsl:with-param>
													</xsl:call-template>Option 1
												</label>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossIncomeMethodOption2Ind"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHGrossIncomeMethodOption2</xsl:with-param>
													</xsl:call-template>Option 2</label>
											</td>
											<td class="styDepTblCell" rowspan="3" style="height:17mm;width:25mm;padding-top:4mm;border-left-width:1px;border-right-width:0px;border-bottom-width:0px;">
												<span class="styBoldText">(c)</span> Total R&amp;D Deductions Not Definitely
													Allocable (enter the sum of all amounts entered in all applicable "R&amp;D Deductions" columns)
											</td>
										</tr>
										<tr  class="styDepTblHdr">
											<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
												Product line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr  class="styDepTblHdr">
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(i)</span> Gross Sales</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iii)</span> Gross Sales</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(v)</span> Gross Income</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
											<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(vii)</span> Gross Income</td>
											<td class="styDepTblCell" style="height:7mm;width:25mm;border-left-width:1px;border-right-width:0px;">
												<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
										</tr>
              </thead>
              <tr class="styDepTblRow1">
								<td class="styLNLeftLtrBoxBB" style="height:8mm;width:8mm;padding-left:1mm;padding-top:1.5mm;border-bottom-width:0px;">1</td>
                <td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;font-size:5pt;">Totals (see instructions)</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTotalsAmount"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTotalsAmount"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalsAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styDepTblHdr" style="height:8mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;border-top-width:1px;border-bottom-width:0px;padding-left:1mm;">2</td>
                <td class="styIRS1118LNDescRD" style="height:8mm;">Total to be apportioned</td>
				<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>
				</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalsApprtnAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
				<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>
				</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalsApprtnAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
				<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>
				</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalsApprtnAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
				<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>
				</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalsApprtnAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
				<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>
				</td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styLNLeftLtrBoxBB" style="height:8mm;border-top-width:1px;border-bottom-width:0px;">3</td>
                <td class="styIRS1118LNDescRD" style="height:8mm;border-bottom-width:0px;'">Apportionment among statutory groupings:</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
				<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
					<span style="width:1px;"/>
				</td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;border-bottom-width:0px;">a</td>
                <td class="styIRS1118LNDescRD">General category income</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsGeneralCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsGenCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;border-top-width:1px;border-bottom-width:0px;">b</td>
                <td class="styIRS1118LNDescRD">Passive category income</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomePassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomePassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsPassiveCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsPssvCatIncmAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:2.5mm;border-top-width:1px;border-bottom-width:1px;">c</td>
                <td class="styIRS1118LNDescRD">Section 901(j) income*</td>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsSection901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsSection901jIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDeductionsSect901jIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsSect901jIncmAmt"/>
                </xsl:call-template>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4mm;border-top-width:0px;border-bottom-width:0px;">d</td>
                <td class="styIRS1118LNDescRD" style="height:12mm;">Income re-sourced by treaty*</td>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTreatyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTreatyRscIncmAmt"/>
                </xsl:call-template>
                <xsl:call-template name="AddRowsForSchH">
                  <xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TotRDDeductionsTrtyRscIncmAmt)"/>
                  <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsTrtyRscIncmAmt"/>
                </xsl:call-template>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:1mm;border-top-width:1px;border-bottom-width:0px;">4</td>
                <td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/GrossSalesTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[1]/RDDeductionsTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/GrossSalesTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[2]/RDDeductionsTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/GrossIncomeTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[1]/RDDeductionsTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/GrossIncomeTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[2]/RDDeductionsTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRDDeductionsTotalForeignAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            </table>
						<xsl:for-each select="$Form1118ScheduleH/ResearchDevDedSalesMethod">
							<xsl:if test="(position() mod 4) = 3">
								<xsl:variable name="curPos">
									<xsl:value-of select="position()"/>
								</xsl:variable>
								<br/>
								<div class="pageEnd"/>
								<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part I - Research and Development Deductions (Continued):</span>
								<div style="height:auto;width:231mm;clear:both;">
								<table class="styDepTblLandscape" cellspacing="0" cellpadding="0" style="font-size:6pt;height:auto;width:231mm;">
											<thead class="styTableThead">
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
														<span style="width:1px;"/>
													</td>
													<td class="styDepTblCell" style="height:5mm;width:196mm;border-left-width:1px;border-right:0px;" colspan="8">
														<span class="styBoldText">(a)</span> Sales Method
													</td>
												</tr>
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 0]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 1"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 2"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 3"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/SICCd"/>
														</xsl:call-template>)*
													</td>
												</tr>
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(i)</span> Gross Sales</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iii)</span> Gross Sales</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(v)</span> Gross Income</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vii)</span> Gross Income</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<tr class="styDepTblRow1">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;width:8mm;padding-top:4.5mm;padding-left:1mm;">1</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">Totals (see instructions)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTotalsAmount"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;padding-left:1mm;border-bottom-width:0px;">2</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:30mm;padding-top:4mm;">Total to be apportioned</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow1">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;padding-right:2.5mm;border-top-width:1px;border-bottom-width:0px;">3</td>
													<td class="styIRS1118LNDescRD" style="border-bottom-width:0px;height:8mm;">Apportionment among statutory groupings:</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;border-bottom-width:1px;">a</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">General category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow1">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;border-top-width:0px;border-bottom-width:1px;">b</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Passive category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4.5mm;border-top-width:0px;border-bottom-width:0px;">c</td>
													<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr class="styDepTblRow1">
													<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4.5mm;border-top-width:1px;border-bottom-width:0px;">d</td>
													<td class="styIRS1118LNDescRD" style="height:12mm;">Income re-sourced by treaty*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr class="styDepTblRow2">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;padding-left:1mm;border-top-width:1px;border-bottom-width:0px;">4</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 1]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 2]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/GrossSalesTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedSalesMethod[$curPos + 3]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</tbody>
										</table>	
								</div>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod">
							<xsl:if test="(position() mod 4) = 3">
								<xsl:variable name="curPos">
									<xsl:value-of select="position()"/>
								</xsl:variable>
								<br/>
								<div class="pageEnd"/>
								<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part I - Research and Development Deductions (Continued):</span>
								<div style="height:auto;width:231mm;clear:both;">
									<table class="styDepTblLandscape" cellspacing="0" cellpadding="0" style="height:auto;width;231mm;font-size:6pt;">
											<thead class="styTableThead">
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" colspan="2" rowspan="3" style="height:17mm;width:35mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
														<span style="width:1px;"/>
													</td>
													<td class="styDepTblCell" style="height:5mm;width:196mm;border-left-width:1px;border-right:0px;" colspan="8">
														<span class="styBoldText">(b)</span> Gross Income Method
													</td>
												</tr>
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 0]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mmborder-left-width:1px;border-right-width:0px;;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 1"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 2"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/SICCd"/>
														</xsl:call-template>)*
													</td>
													<td class="styDepTblCell" style="height:5mm;width:49mm;border-left-width:1px;border-right-width:0px;" colspan="2">
														Product line #<xsl:value-of select="$curPos + 3"/>
														<br/>(SIC Code: <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/SICCd"/>
														</xsl:call-template>)*
													</td>
												</tr>
												<tr class="styDepTblHdr">
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(i)</span> Gross Sales</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(ii)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iii)</span> Gross Sales</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(iv)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(v)</span> Gross Income</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vi)</span> R&amp;D Deductions</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(vii)</span> Gross Income</td>
													<td class="styDepTblCell" style="height:7mm;width:24.5mm;border-left-width:1px;border-right-width:0px;">
														<span class="styBoldText">(viii)</span> R&amp;D Deductions</td>
												</tr>
											</thead>
											<tfoot/>
											<tbody>
												<tr class="styDepTblRow1">
													<td style="height:8mm;width:8mm;padding-top:4mm;padding-left:1mm;font-weight:bold;border-bottom:1px solid black;">1</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;width:27mm;padding-top:4mm;">Totals (see instructions)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalsAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td style="height:8mm;padding-top:4mm;padding-left:1mm;font-weight:bold;border-bottom:1px solid black;">2</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Total to be apportioned</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:24.5mm;border-bottom-width:1px;padding-top:4mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalsApprtnAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow1">
													<td class="styLNLeftNumBox" style="height:8mm;">3</td>
													<td class="styIRS1118LNDescRD" style="border-bottom-width:0px;height:8mm;">Apportionment among statutory groupings:</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
													<td class="styShadingCellSmall" style="height:8mm;width:24.5mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;">
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td style="height:8mm;padding-top:4mm;padding-left:3mm;font-weight:bold;border-bottom:1px solid black;">a</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">General category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsGeneralCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow1">
													<td style="height:8mm;padding-top:4mm;padding-left:3mm;font-weight:bold;border-bottom:1px solid black;">b</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;padding-top:4mm;">Passive category income</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomePassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsPassiveCatIncmAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
												<tr class="styDepTblRow2">
													<td style="height:12mm;font-weight:bold;border-bottom:1px solid black;">c</td>
													<td class="styIRS1118LNDescRD">Section 901(j) income*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeSection901jIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsSection901jIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr class="styDepTblRow1">
													<td style="height:12mm;font-weight:bold;border-bottom:1px solid black;">d</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Income re-sourced by treaty*</td>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count(RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTreatyRscIncmAmt"/>
													</xsl:call-template>
													<xsl:call-template name="AddRowsForSchH">
														<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt)"/>
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTreatyRscIncmAmt"/>
													</xsl:call-template>
												</tr>
												<tr class="styDepTblRow2">
													<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:1mm;border-bottom-width:0px;">4</td>
													<td class="styIRS1118LNDescRD" style="height:8mm;">Total foreign (add lines 3a through 3d)</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 1]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 2]/RDDeductionsTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/GrossIncomeTotalForeignAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ResearchDevDedGrossIncmMethod[$curPos + 3]/RDDeductionsTotalForeignAmt"/>
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
					<xsl:if test="(( (count($Form1118ScheduleH/AvgAstValNonfinclDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstValFinclDivFromEach1050) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclDivFromEach1050) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclSection901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/OthNotAllcblDedDivFrEach1050) &gt; 1) or                               (count($Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt) &gt; 1) or                               (count($Form1118ScheduleH/TotalsCertainDivFrEach1050PFIC) &gt; 1) or                               (count($Form1118ScheduleH/Section901jIncomeTotalsAmt) &gt; 1) or                               (count($Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt) &gt; 1) or                               (count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt) &gt; 1)                             )                             and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule H, Part II - Interest Deductions, All Other Deductions, and Total Deductions:</span>
						<table class="styDepTblLandscape" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
											<td class="styDepTblCell" colspan="2" rowspan="2" style="height:34mm;width:77mm;border-left-width:0px;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" colspan="2" style="height:22mm;width:60mm;text-align:left;float:none;border-right-width:0px;border-left-width:1px;">
												<span style="width:16px"/>
												<span class="styBoldText">(a)</span>
                Average Value of Assets–<br/>
												<span style="width:48px"/>
                Check method used:<br/>
												<div>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFairMrktValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValFairMarketValueMethod</xsl:with-param>
													</xsl:call-template>Fair market value
												</label>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
												</label>
												</div>
												<br/>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
                </label>
												<br/>
											</td>
											<td class="styDepTblCell" colspan="2" style="height:22mm;width:60mm;float:none;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
											<td class="styDepTblCell" rowspan="2" style="height:34mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(c)</span> All Other Deductions Not Definitely Allocable
              </td>
											<td class="styDepTblCell" rowspan="2" style="height:34mm;width:30mm;border-bottom-width:0px;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(d)</span>
                Totals (add the corresponding amounts from column (c), Part I; columns (b)(iii) and (b)(iv), Part II;
                and column (c), Part II). Enter each amount from lines 3a through 3d below in column 10 of the
                corresponding Schedule A.
              </td>
										</tr>
										<tr class="styDepTblHdr">
											<td class="styDepTblCell" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
											<td class="styDepTblCell" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(ii)</span> Financial Corporations</td>
											<td class="styDepTblCell" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
											<td class="styDepTblCell" style="height:12mm;width:30mm;border-right-width:0px;border-left-width:1px;">
												<span class="styBoldText">(iv)</span> Financial Corporations</td>
										</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr class="styDepTblRow1">
									<!-- Set the background color for the row -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td style="height:8mm;width:7mm;font-weight:bold;padding-top:4mm;padding-left:1mm;border-bottom:1px solid black;">
										<span class="styBoldText">1<span style="width:2px"/>a</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;width:70mm;padding-top:4mm;">Totals (see instructions)</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">b</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Amounts specifically allocable under Temp. Regs. 1.861-10T(e)</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">c</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Other specific allocations under Temp. Regs. 1.861-10T</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclOthTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclOthTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclOthTempRegsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclOthTempRegAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">d</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Assets excluded from apportionment formula</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclAstExcldAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclAstExcldAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-left:1mm;padding-top:1mm;border-top-width:1px;border-bottom-width:0px;">
										<span class="styBoldText">2</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:1mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
and 1d from line 1a)</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotalApprtnAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalApprtnAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalApprtnAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalApprtnAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-top-width:0px;border-bottom-width:1px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;border-top:1px solid black;">3</td>
									<td class="styIRS1118LNDescDed" style="height:4.5mm;border-bottom-width:0px;padding-top:1mm;'">Apportionment among statutory groupings:</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;border-top-width:0px;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">a</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">General limitation income</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclGenCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclGenCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclGenCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclGenCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblGenCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GeneralCategoryIncmTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;">b</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Passive category income</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclPssvCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclPssvCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclPssvCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclPssvCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblPssvCatIncmAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/PassiveCategoryIncmTotalsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4.5mm;border-bottom-width:0px;">c</td>
									<td class="styIRS1118LNDescDed" style="height:12mm;">Section 901(j) income*</td>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfincl901jIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclSect901jIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclSect901jIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclSection901jIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclSection901jIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblSect901jIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/Section901jIncomeTotalsAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/Section901jIncomeTotalsAmt"/>
									</xsl:call-template>
								</tr>
								<tr class="styDepTblRow1">
									<td class="styLNLeftLtrBoxBB" style="height:12mm;padding-top:4.5mm;border-top-width:1px;border-bottom-width:0px;">d</td>
									<td class="styIRS1118LNDescDed" style="height:12mm;">Income re-sourced by treaty*</td>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTrtyRscIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTrtyRscIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTrtyRscIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTrtyRscIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTrtyRscIncmAmt"/>
									</xsl:call-template>
									<xsl:call-template name="AddRowsForSchH">
										<xsl:with-param name="RowCount" select="count($Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt)"/>
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TreatyResourcedIncomeTotalsAmt"/>
									</xsl:call-template>
								</tr>
								<tr class="styDepTblRow2">
									<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4mm;padding-left:1mm;border-top-width:1px;border-bottom-width:0px;">
										<span class="styBoldText">4</span>
									</td>
									<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Total foreign (add lines 3a through 3d)</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlNonfinclTotForeignAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AvgAstVlFinclTotalForeignAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedNonfinclTotalForeignAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/IntDedFinclTotalForeignAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/OthDedNotAllcblTotalForeignAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotalForeignTotalsAmt"/>
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
		<tr style="height:5mm;">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:21mm;border-color:black;">
				<span class="styTableCellPad" style="width:21mm;text-align:left;">
					<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				</span>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:29mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchAPartII">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="height:5mm;">
			<td class="styIRS1118TableCellLtr" style="width:17mm;">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad" style="width:25mm;text-align:left;">
					<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				</span>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
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
			<td class="styTableCellSmall" style="width:15mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:15mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;text-align:left;border-color:black;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:24mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:25mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartI">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartIB">
		<xsl:param name="ShowMessage"/>
		<tr >
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="width:28mm;text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:22mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:22mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:15mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:34mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:22mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:28mm">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="width:25mm">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartIII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Additional Data Table</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecA">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="font-family:arial;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecA2">
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="width:77mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecB">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
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
	<xsl:template name="AddRowsForSchDPartIISecA2">
		<xsl:call-template name="AddRowsForSchDPartISecA2">
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartIISecB">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
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
	<xsl:template name="AddRowsForSchEPartI2">
		<!-- Filler rows for Schedule E Part I and Part II are identical to the Schedule D Part I section A -->
		<xsl:param name="ShowMessage"/>
		<xsl:call-template name="AddRowsForSchDPartISecA2">
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
	<xsl:template name="AddRowsForSchEPartII2">
		<xsl:param name="ShowMessage"/>
		<xsl:call-template name="AddRowsForSchDPartISecA2">
			<xsl:with-param name="ShowMessage">
				<xsl:value-of select="$ShowMessage"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartIII">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styTableCellSmallArial" style="border-color:black;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartIII2">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF">
		<xsl:param name="ShowMessage"/>
		<xsl:param name="TargetNode"/>
		<tr style="">
			<td class="styIRS1118TableCellLtr" style="width:8mm;text-align:center;font-weight:bold;">
				<xsl:value-of select="$TargetNode"/>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm;text-align:left;border-color:black;">
				<xsl:if test="$ShowMessage = 'true'">See Additional Data Table</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm;border-color:black;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="width:39mm;border-color:black;border-right-width:0;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchH">
		<xsl:param name="RowCount"/>
		<xsl:param name="TargetNode"/>
		<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;">
			<xsl:if test="$RowCount&lt;3">
				<xsl:attribute name="style"><xsl:value-of select="'height:12mm;'"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="$TargetNode">
				<xsl:if test="position() != 1">
					<br/>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$RowCount&gt;1 and position() &lt; $RowCount">
						<span class="styIRS1118UnderlinedText" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</span>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:if test="$RowCount=0">
				<span style="width:1px;"/>
			</xsl:if>
		</td>
	</xsl:template>
</xsl:stylesheet>