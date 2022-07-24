<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<!-- 01/05/2021 - Changes made for UWR 241847 - Jeremy Nichols -->
<!-- 01/14/2021 - Changes made for defect 66375 - Jeremy Nichols -->
<!-- 04/23/2021 - Changes made for UWR 243365 - Jeremy Nichols -->
<!-- 10/22/2021 - Changes made for UWR 370191 - Jeremy Nichols -->
<!-- 01/12/2022 - Changes made for KISAM IM1759681 - Jeremy Nichols -->
<!-- 02/22/2022 - Changes made for KISAM IM1801730 - Jeremy Nichols -->
<!-- 03/17/2022 - Changes made for KISAM IM1759681 - Jeremy Nichols -->
<!-- 03/05/2022 - Changes made for defect 68662 - Jeremy Nichols -->
<!-- 03/06/2022 - Changes made for defect 68664 - Jeremy Nichols -->
<!-- 03/06/2022 - Changes made for defect 69133 - Jeremy Nichols -->
<!-- 04/19/2022 - Changes made for KISAM IM01892252 - Jeremy Nichols -->
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
	<xsl:param name="Form1118ScheduleF1" select="$RtnDoc/IRS1118/IRS1118ScheduleF1"/>
	<xsl:param name="Form1118ScheduleF2" select="$RtnDoc/IRS1118/IRS1118ScheduleF2"/>
	<xsl:param name="Form1118ScheduleF3" select="$RtnDoc/IRS1118/IRS1118ScheduleF3"/>
	<xsl:param name="Form1118ScheduleG" select="$RtnDoc/IRS1118/IRS1118ScheduleG"/>
	<xsl:param name="Form1118ScheduleH" select="$RtnDoc/IRS1118/IRS1118ScheduleH"/>
	<xsl:param name="RowForHeight" select="count($Form1118ScheduleH/SalesMethodGroSalesAndRsrchDed[1]/ApportionmentDedSlsMthdGroSls/GrossSalesSection901jIncmAmt)"/>
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
								Form<span class="styFormNumber"> 1118</span>
								<br/>            
								(Rev. December 2021)
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
							<br/>
							<div class="styFBT" style="height:4mm;font-weight:bold;">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> Attach to the corporation’s tax return.          
							</div>
							<br/>
							<div class="styFBT" style="height:4mm;font-weight:bold;">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/> Go to <i>www.irs.gov/Form1118</i> for instructions and the latest information.
							</div>
							<br/>
							<div style="text-align:center;">For calendar year 
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
							<div style="width:45mm;text-align:center;padding-top:4mm;padding-bottom:4mm;border-bottom:1px solid black;">OMB No. 1545-0123</div>
							<div style="width:45mm;text-align:left;padding-left:10mm;padding-top:2mm;">Attachment<br/> Sequence No. <b>118</b>
							</div>
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
						Use a separate Form 1118 for each applicable category of income (see instructions).<br/>
						<div style="width:10mm;text-align:right;padding-left:5.5mm;padding-right:0.5mm;display:inline;">
							a.
						</div>
						<div style="text-align:right;padding-right:1mm;display:inline;">
							Separate Category (Enter code-see instructions.)<span style="width:1mm"/>
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
								<span style="width:19.55px"/>
							</span>
							<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:7px"/>
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
						<div style="width:10mm;text-align:right;padding-left:5.5mm;padding-right:0.5mm;display:inline;">
							b.
						</div>
						<div style="text-align:right;padding-right:1mm;display:inline;">
							If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)<span style="width:1mm"/>
							<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>
							</span>
							<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:7px"/>
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
						<div style="width:10mm;text-align:right;padding-left:5.5mm;padding-right:0.5mm;display:inline;">
							c.
						</div>
						<div style="text-align:right;padding-right:1mm;display:inline;">
							If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)<span style="width:1mm"/>
							<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:15px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>
							</span>
							<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:7px"/>
							<span style="width:25mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118Data/TreatyCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--		<div class="pageEnd"/>    treat this -->
					<!--END CATEGORY OF INCOME SECTION -->
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:261mm;border-bottom-width:0px;">
						<div class="styTitleName">Schedule A</div>
						<div class="styIRS1118TitleDesc" style="width:233.5mm;border-bottom:1px solid black;">Income or (Loss) Before Adjustments
						    <span class="styItalicText" style="font-weight:normal">(Report all amounts in U.S. dollars. See<b> Specific instructions</b>.)</span>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'IBActn' "/>
								<xsl:with-param name="imageID" select=" 'IBAimg' "/>
								<xsl:with-param name="buttonID" select=" 'IBAbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END SCHEDULE A TITLE -->
					<!-- BEGIN INCOMEORLOSS TABLE -->
					<div class="styTableContainerLandscape" id="IBActn" style="height:auto;width:261mm;border-bottom-width:0px;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" rowspan="3">
										<span style="width:11mm;height:22mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:70mm;height:22mm;" rowspan="3" scope="col">1. <span class="styNormalText" style="display:inline;">EIN or Reference ID number (see instructions)*</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:22mm;" rowspan="3" scope="col">2. <span class="styNormalText" style="display:inline;">Foreign Country or U.S. Possession (enter two-letter code-use a separate line for each)(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:175mm;height:5mm;" colspan="5" scope="col">Gross Income or (Loss) From Sources Outside the United States</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:70mm;height:9mm;" colspan="2" scope="col">3. <span class="styNormalText" style="display:inline;">Inclusions Under Sections 951(a)(1) and 951A (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:22mm;" rowspan="3" scope="col">4. <span class="styNormalText" style="display:inline;">Dividends (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:18mm;" rowspan="2" scope="col">5. <span class="styNormalText" style="display:inline;">Interest</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;" scope="col">(a) <span class="styNormalText" style="display:inline;">Exclude Gross-Up</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;" scope="col">(b) <span class="styNormalText" style="display:inline;">Gross-Up (section 78)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="">
											<td class="styIRS1118TableCellLtr" style="">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="text-align:left;border-color:black;">
												<span class="styTableCellPad"/>
												<!-- this is for new change 1 -->
												<!-- If ForeignCountryOrUSPossession -->
												<xsl:if test="(ForeignCorporationEIN != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												</xsl:if>
												<xsl:if test="(ForeignCorpMissingEINReasonCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorpMissingEINReasonCd"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												</xsl:if>
												<xsl:if test="(ForeignBranchOrQBUCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignBranchOrQBUCd"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												</xsl:if>
												<xsl:if test="(ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												</xsl:if>
											</td>
											<td class="styTableCellSmall" style="text-align:left;border-color:black;">
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
												<xsl:if test="Section951AIncomeCd != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Section951AIncomeCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="Section863bIncomeCd != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(Sect965RepatriationIncomeCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Sect965RepatriationIncomeCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(IncmLossBfrAdjFrgnTxsPdAccrGrp/ReattributionIncomeCd != '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IncmLossBfrAdjFrgnTxsPdAccrGrp/ReattributionIncomeCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InclsnSect951AExcldGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InclusionSection951AGrossUpAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												
												<xsl:if test="DividendsAmt != ' '">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DividendsAmt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DividendsExcldGrossUpAmt != ' '">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DividendsExcldGrossUpAmt"/>
													</xsl:call-template>
												</xsl:if>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InterestReceivedAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartI">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or (count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
										<tr style="">
											<td class="styTableCellSmall" style="width:81mm;text-align:left;border-color:black;border-bottom-width:0mm;" colspan="3">
												<span style="font-weight:bold;">Totals </span>(add lines A through C)
												<!--Dotted Line-->
												<span class="styNoAudioRead" style="font-weight:bold;">
													<span style="width:3px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:6px"/>
												</span>
												<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:0mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:0mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:0mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:0mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="">
											<td class="styTableCellSmall" style="text-align:left;border-color:black;border-bottom-width:0mm;" colspan="3">
												<span style="font-weight:bold;">Totals </span>(add lines A through C)
												<!--Dotted Line-->
												<span class="styNoAudioRead" style="font-weight:bold;">
													<span style="width:3px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:16px"/>.
													<span style="width:6px"/>
												</span>
												<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0mm;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotInclsn951AExcldGrossUpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0mm;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotInclusionSec951AGrossUpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0mm;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDividendsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0mm;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalInterestReceivedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'IBActn' "/>
					</xsl:call-template>
					<div class="styBB" style="width:260mm;border-bottom-width:0px;">
						<div style="width:234mm;">
							<span class="styItalicText" style="width:230mm;"/>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'DEDctn' "/>
								<xsl:with-param name="imageID" select=" 'DEDimg' "/>
								<xsl:with-param name="buttonID" select=" 'DEDbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DEDctn" style="height:auto;width:261mm;border-bottom:0;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="border-bottom:0;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" style="border-top:1px solid black;" rowspan="3">
										<span style="width:11mm;height:9mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">6. <span class="styNormalText" style="display:inline;">Gross Rents, Royalties, and License Fees</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">7. <span class="styNormalText" style="display:inline;">Sales</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">8. <span class="styNormalText" style="display:inline;">Gross Income From Performance of Services</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">9. <span class="styNormalText" style="display:inline;">Currency</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">10. <span class="styNormalText" style="display:inline;">Currency Gain Code <br/>(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">11. <span class="styNormalText" style="display:inline;">Other (attach schedule)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;border-top:1px solid black;" scope="col">12. <span class="styNormalText" style="display:inline;">Total (add columns 3(a) through 9 and 11)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="">
											<td class="styIRS1118TableCellLtr" style="">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GroRentsRyltsLcnsFeesAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SalesAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CurrencyGainAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CurrencyGainCd"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:if test="(OtherIncomeLossAmt != '')">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherIncomeLossAmt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(OtherIncomeStatement != '')">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="OtherIncomeStatement"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherIncomeStatement"/>
													</xsl:call-template>
												</xsl:if>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalGrossIncomeOrLossAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or (count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroRentsRyltsLcnsFeesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalSalesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGrossIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalCurrencyGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;background-color:lightgrey;">
												<span style="width:5mm;"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherIncomeLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGrossIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'DEDctn' "/>
					</xsl:call-template>
					<div class="styBB" style="width:260mm;border-bottom-width:0px;">
						<div style="width:234mm;">
							<span class="styItalicText" style="width:230mm;"/>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'DEDctn2' "/>
								<xsl:with-param name="imageID" select=" 'DEDimg2' "/>
								<xsl:with-param name="buttonID" select=" 'DEDbtn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DEDctn2" style="height:auto;width:261mm;border-bottom:0;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="border-bottom:0;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" rowspan="3">
										<span style="width:11mm;height:23mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:210mm;height:5mm;" scope="col" colspan="7">13. <span class="styNormalText" style="display:inline;">Allocable Deductions</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:18mm;" scope="col" rowspan="2">(a) <span class="styNormalText" style="display:inline;">Dividends Received Deduction (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:18mm;" scope="col" rowspan="2">(b) <span class="styNormalText" style="display:inline;">Deduction Allowed Under Section 250(a)(1)(A) - Foreign Derived Intangible Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:18mm;" scope="col" rowspan="2">(c) <span class="styNormalText" style="display:inline;">Deduction Allowed Under Section 250(a)(1)(B) - Global Intangible Low-Taxed Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:70mm;height:9mm;" scope="col" colspan="2">
										<span class="styNormalText" style="display:inline;">Rental, Royalty, and Licensing Expenses</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:18mm;" scope="col" rowspan="2">(f) <span class="styNormalText" style="display:inline;">Expenses Allocable to Sales Income</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;" scope="col" rowspan="2">(g) <span class="styNormalText" style="display:inline;">Expenses Allocable to Gross Income From Performance of Services</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;" scope="col">(d) <span class="styNormalText" style="display:inline ;">Depreciation, Depletion, and Amortization</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;height:9mm;" scope="col">(e) <span class="styNormalText" style="display:inline;">Other Allocable Expenses</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="">
											<td class="styIRS1118TableCellLtr" style="">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsReceivedDeductionAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DedAllwSect250a1AIntangibleAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DedAllwSect250a1BIntangibleAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecDpltnAmortExpnsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherExpensesAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpensesRelatedSalesIncomeAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GroIncmRelatedExpensesAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
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
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartII">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or (count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:35mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDividendsReceivedDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDedSect250a1AIntngblIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotDedSect250a1BIntngblIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalDeprecDpltnAmortExpnsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalOtherExpensesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotExpensesRelatedSalesIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroIncmRelatedExpensesAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'DEDctn2' "/>
					</xsl:call-template>
					<div class="styBB" style="width:260mm;border-bottom-width:0px;">
						<div style="width:234mm;">
							<span class="styItalicText" style="width:230mm;"/>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'DEDctn3' "/>
								<xsl:with-param name="imageID" select=" 'DEDimg3' "/>
								<xsl:with-param name="buttonID" select=" 'DEDbtn3' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" id="DEDctn3" style="height:auto;width:261mm;border-bottom:0;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="border-bottom:0;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellLtr" rowspan="2">
										<span style="width:11mm;height:9mm;"/>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:120mm;height:5mm;" scope="col" colspan="4">13. <span class="styNormalText" style="display:inline;">Allocable Deductions <i>(continued)</i>
										</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col" rowspan="2">14. <span class="styNormalText" style="display:inline;">Apportioned Share of Deductions (enter amount from applicable line of Schedule H, Part I, column (b), and Schedule H, Part II, column (d))</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col" rowspan="2">15. <span class="styNormalText" style="display:inline;">Net Operating Loss Deduction</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col" rowspan="2">16. <span class="styNormalText" style="display:inline;">Total Deductions (add columns 13(k) through 15)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col" rowspan="2">17. <span class="styNormalText" style="display:inline;">Total Income or (Loss) Before Adjustments (subtract column 16 from column 12).</span>
									</th>
								</tr>
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col">(h) <span class="styNormalText" style="display:inline;">Currency Loss</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col">(i) <span class="styNormalText" style="display:inline;">Currency Loss Code <br/>(see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col">
										(j) <span class="styNormalText" style="display:inline;">
										Other Allocable Deductions (attach schedule) (see instructions)
										<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/OtherAllocableDeductionsAmt"/>
											</xsl:call-template>
										</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:32mm;height:9mm;" scope="col">(k) <span class="styNormalText" style="display:inline;">Total Allocable Deductions (add columns 13(a) through 13(h) and 13(j))</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
										<tr style="">
											<td class="styIRS1118TableCellLtr" style="">
												<span class="styTableCellPad" style="font-weight:bold">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CurrencyLossAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CurrencyLossCd"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="OtherAllocableDeductionsAmt"/>
												</xsl:call-template>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherAllocableDeductionsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetOperatingLossDeductionAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalDeductionAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:32mm;text-align:right;border-color:black;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotIncmOrLossBfrAdjustmentsAmt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
									<!-- Filler rows income or (loss) before adjustments Schedule A-->
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchAPartIII">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchAPartIII">
												<xsl:with-param name="TargetNode">A</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartIII">
										<xsl:with-param name="TargetNode">B</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchAPartIII">
										<xsl:with-param name="TargetNode">C</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- End filler rows -->
								<xsl:choose>
									<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or (count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;background-color:lightgrey;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="">
											<td class="styTableCellSmall" style="width:11mm;text-align:left;border-color:black;border-bottom-width:1px;">
												<span style="font-weight:bold;">Totals</span>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalCurrencyLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalGroIncmRelatedExpensesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="width:27mm;border-color:black;border-bottom-width:1px;background-color:lightgrey;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotOtherAllocableDeductionsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotalAllocableDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalApportionedShareDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/TotalNOLDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggregateTotalDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;padding-right:1mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/AggrgtTotIncmOrLossBfrAdjAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'DEDctn3' "/>
					</xsl:call-template>
					<!-- END DEDUCTIONS TABLE -->
					<xsl:if test="($Print = $Separated)">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
					</xsl:if>
					<div style="width:256mm;height:7mm;padding-top:0.5mm;border-top:0px solid black;">
						* For section 863(b) income, NOLs, income from RICs, high-taxed income, section 951A, and reattribution of income by reason of disregarded payments, use a single line (see instructions).  Also, for reporting branches that are QBUs, use a separate line for each such branch.
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm;padding-top:0.5mm;border-top:1px solid black;">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right">
						  Cat. No. 10900F 
						  <span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div class="styBB" style="width:256mm">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
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
						<div class="styBB" style="width:260mm;float:left;display:table-header-group;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:256mm;text-align:left;padding-left:0;border-bottom:1px solid black;">Part I—Foreign Taxes Paid, Accrued, and Deemed Paid
						   <span class="styItalicText" style="font-weight:normal">(see instructions)</span>
							</div>
							<div class="styGenericDiv" style="width:3mm">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="headerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'FTPctn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div style="border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;width: 261mm; height:auto;float:none;clear:both;overflow-y: auto;" id="FTPctn">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styLandscapeTable" cellspacing="0" style="width:256mm;height: auto">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellLtr" style="width:11mm;height:21mm;" rowspan="3">
											<span class="styTableCellPad" style="font-weight:bold"/>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" rowspan="2" colspan="2" style="width:30mm;height:14mm;">
											<br/>
										1. <span class="styNormalText" style="display:inline;">Credit is Claimed for Taxes (check one):</span>
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
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:193mm;height:7mm;" colspan="6">2. <span class="styNormalText" style="display:inline;">Foreign Country or U.S. Posseession (enter two-letter code--use a separate line for each) (see instructions)</span>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:114mm;height:7mm;" colspan="6">
											<span class="styNormalText">Tax Withheld at Source on:</span>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:15mm;height:7mm;">
											<span class="styNormalText">Date Paid</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:15mm;height:7mm;">
											<span class="styNormalText">Date Accrued</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(a) <span class="styNormalText" style="display:inline;">Dividends</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(b) <span class="styNormalText" style="display:inline;">Distributions of Previously Taxed Earnings and Profits</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(c) <span class="styNormalText" style="display:inline;">Branch Remittances</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(d) <span class="styNormalText" style="display:inline;">Interest</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(e) <span class="styNormalText" style="display:inline;">Rents, Royalties, and License Fees</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:19mm;height:7mm;">(f) <span class="styNormalText" style="display:inline;">Other</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellLtr" style="font-size:6pt;" scope="row">
													<span class="styTableCellPad" style="font-weight:bold;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RowId"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;text-align:center;border-color:black;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PaidDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;text-align:center;border-color:black;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AccruedDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldDividendsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldDistributionsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldBranchRemittanceAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldInterestAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldRentsRyltsLcnsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxWithheldOtherAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule B - foreign tax credits -->
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
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
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchBPartI">
											<xsl:with-param name="TargetNode">B</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchBPartI">
											<xsl:with-param name="TargetNode">C</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!-- End filler rows -->
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="text-align:left;border-bottom-width:1px;vertical-align:bottom;">
													<span style="font-weight:bold;">Totals </span>(add lines A through C)</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:1px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellTotal" scope="row" colspan="3" style="font-size:6pt;text-align:left;border-bottom:1px solid black;">
													<span style="font-weight:bold;">Totals </span>(add lines A through C)
												<span style="width:1mm;"/>.
												<span style="width:1mm;"/>
													<img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldDividendsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxWithheldDistributionsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxWthldBranchRemittanceAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldInterestAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotTxWithheldRentsRyltsLcnsAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOtherAmt"/>
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
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="headerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'FTPctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<xsl:if test="($Print = $Separated)">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
						</xsl:if>
						<div class="styBB" style="width:261mm;float:left;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:256mm;text-align:left;padding-left:0;border-bottom:1px solid black;">
						</div>
							<div class="styGenericDiv" style="width:3mm">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="headerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'FTPctn2' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div style="border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;width: 261mm; height:auto;float:none;clear:both;overflow-y: auto;" id="FTPctn2">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styLandscapeTable" cellspacing="0" style="width:256mm;height: auto">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellLtr" style="width:11mm;height:21mm;" rowspan="3">
											<span class="styTableCellPad" style="font-weight:bold"/>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:144mm;height:7mm;" colspan="4">2. <span class="styNormalText" style="display:inline;">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:50mm;height:5mm;" rowspan="3">3. <span class="styNormalText" style="display:inline;">Tax Deemed Paid (see instructions)</span>
											<span style="width:4px"/>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:115mm;height:7mm;" colspan="3">
											<span class="styNormalText">Other Foreign Taxes Paid or Accrued On:</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:45mm;height:14mm;" rowspan="2">(j) <span class="styNormalText" style="display:inline;">Total Foreign Taxes Paid or Accrued (add columns 2(a) through 2(i))</span>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:39mm;height:7mm;">(g) <span class="styNormalText" style="display:inline;">Sales</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:35mm;height:7mm;">(h) <span class="styNormalText" style="display:inline;">Services Income</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" scope="col" style="width:35mm;height:7mm;">(i) <span class="styNormalText" style="display:inline;">Other</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 4) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellLtr" style="width:11mm;font-size:6pt;" scope="row">
													<span class="styTableCellPad" style="font-weight:bold;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RowId"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxPdOrAccrSalesIncomeAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxPdOrAccrServicesIncmAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxPdOrAccrOtherIncmAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule B - foreign tax credits -->
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 1) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchBPartI2">
													<xsl:with-param name="TargetNode">A</xsl:with-param>
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchBPartI2">
													<xsl:with-param name="TargetNode">A</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 2) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchBPartI2">
											<xsl:with-param name="TargetNode">B</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &lt; 3) or ((count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchBPartI2">
											<xsl:with-param name="TargetNode">C</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!-- End filler rows -->
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp) &gt; 3) and ($Print = $Separated)">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellTotal" scope="row" style="width:11mm;text-align:left;border-bottom-width:0px;">
													<b>Totals</b>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellSmall" style="border-color:black;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellTotal" scope="row" style="width:11mm;font-size:6pt;text-align:left;border-bottom-width:0px;">
													<b>Totals</b>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrSalesIncomeAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrServicesIncmAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTxPdOrAccrOtherIncmAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/AggrtTotFrgnTaxesPaidOrAccrAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="font-size:5pt;border-color:black;border-bottom-width:0px;">
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
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="headerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'FTPctn2' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- END SCHEDULE B PART I TABLE -->
						<!-- END SCHEDULE B PART I-->
						<xsl:if test="($Print = $Separated)">
							<br/>
							<br/>
							<span style="height:4mm;"/>
						</xsl:if>
						<!-- BEGIN SCHEDULE B PART II TITLE -->
						<div class="styBB" style="width:256mm;border-top:1px solid black;">
							<div class="styIRS1118TitleDesc" style="padding-left:0;">Part II—Separate Foreign Tax Credit
							<span class="styItalicText" style="font-weight:normal">(Complete a </span>
								<span style="width:1mm;"/>
								<span class="styItalicText" style="font-weight:bold">separate </span>
								<span style="width:1mm;"/>
								<span class="styItalicText" style="font-weight:normal"> Part II for </span>
								<span style="width:1mm;"/>
								<span class="styItalicText" style="font-weight:bold">each </span>
								<span style="width:1mm;"/>
								<span class="styItalicText" style="font-weight:normal"> applicable category of income.)</span>
							</div>
						</div>
						<!-- END SCHEDULE B PART II TITLE -->
						<!-- BEGIN SCHEDULE B PART II -->
						<div style="width:256mm;">
							<div class="styLNLeftNumBoxSD">1a</div>
							<div class="styLNDescLandscape" style="width:184mm">Total foreign taxes paid or accrued (total from Part I, column 2(j))
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
          paid (enter total from Schedule G, Part I)
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
          to be completed, enter the result from the "Totals" line of column 17 of the applicable
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
								<span class="styNoAudioRead" style="font-weight:bold;">.
								<span style="width:16px"/>.
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
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/NumLimitationFractionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:256mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDescLandscape">Total U.S. income tax against which credit is allowed (regular tax
						  liability (see section 26(b)) minus any American Samoa economic development credit)
						  <!--Dotted Line-->
								<span class="styNoAudioRead" style="font-weight:bold;">
									<span style="width:14px"/>.
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
							<div class="styLNDescLandscape">Multiply line 9 by line 10
							<!--Dotted Line-->
								<span class="styNoAudioRead" style="font-weight:bold;">
									<span style="width:14px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
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
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/LmtFrctnTimesTotUSIncmTaxCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:256mm;">
							<div class="styLNLeftNumBox">12</div>
							<div class="styLNDescLandscape">  Increase in limitation (section 960(c)) 
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
							</span>
							</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/IncreaseLimitationSect960cAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:256mm;">
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDescLandscape"> Credit limitation (add lines 11 and 12) (see instructions) 
						  <!--Dotted Line-->
								<span class="styNoAudioRead" style="font-weight:bold;">.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
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
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDescLandscape">
								<span class="styBoldText">Separate foreign tax credit</span>
							(enter the smaller of line 6 or line 13). Enter here and on the appropriate line of Part III
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
								<span style="width:16px"/>
								</span>
								<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
							</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SeparateForeignTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--BEGIN FOOTER-->
						<div style="width:256mm">
							<div style="float: left; clear: none;">
								<span class="styBoldText"/>
							</div>
							<div style="float:right">
								<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
						</div>
						<div class="pageEnd"/>
						<!--END FOOTER-->
						<!--BEGIN HEADER-->
						<div style="display:block;">
							<div class="styBB" style="width:256mm">
								<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
								<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">3</span>
								</div>
							</div>
							<!--END HEADER-->
							<!-- END SCHEDULE B PART II-->
							<!-- BEGIN SCHEDULE B PART III TITLE -->
							<div class="styBB" style="width:256mm;">
								<div class="styTitleName">Schedule B</div>
								<div class="styIRS1118TitleDesc">
						  Foreign Tax Credit
						  <span class="styItalicText" style="font-weight:normal">(continued) (Report all foreign tax amounts in U.S. dollars.)</span>
								</div>
							</div>
							<div class="styBB" style="height:4mm;width:256mm;">
								<div class="styIRS1118TitleDesc" style="height:4mm;width:256mm;font-size:8pt;font-weight:normal;padding-left:0;">
									<b>Part III—Summary of Separate Credits</b> (Enter amounts from Part II, line 14 for <b>each</b> applicable category of income. 
							<b> Do not </b>include taxes paid to sanctioned countries.)
						</div>
							</div>
							<!-- END SCHEDULE B PART III TITLE -->
							<!-- BEGIN SCHEDULE B PART III -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">1</div>
								<div class="styLNDescLandscape" style="width:184mm">Credit for taxes on section 951A category income
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
							</span>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignIncmSection951ACrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.5mm;"/>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="styLNDescLandscape" style="width:184mm">Credit for taxes on foreign branch category income
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
							</span>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignBranchIncomeCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.5mm;"/>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">3</div>
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
								<div class="styLNLeftNumBoxSD">4</div>
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
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="styLNDescLandscape" style="width:184mm">Credit for taxes on section 901(j) category income (combine all such credits on this line)
							<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:3px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
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
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignIncmSection901jCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.5mm;"/>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">6</div>
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
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="styLNDescLandscape">Total (add lines 1 through 6)
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
          </span>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/RelatedTaxAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">8</div>
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
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="styLNDescLandscape">
									<span class="styBoldText">Total foreign tax credit</span>
          (subtract line 8 from line 7). Enter here and on the appropriate line of 
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
								<span style="width:16px"/>
									</span>
									<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
								</div>
								<div class="styLNAmountBoxNBB">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/SummaryOfSeparateCredits/ForeignTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END SCHEDULE B PART III-->
						<!-- BEGIN SCHEDULE C -->
						<div class="styBB" style="width:256mm;">
							<div class="styTitleName">Schedule C</div>
							<span class="styIRS1118TitleDesc">Tax Deemed Paid With Respect to Section 951(a)(1) Inclusions by Domestic Corporation Filing Return (Section 960(a))</span>
							<div style="margin-left: 27mm; width: 232mm; float:left; clear:none">
								<div class="styItalicText" style="display:inline;">Use this schedule to report the tax deemed paid by the corporation with respect to section 951(a)(1) inclusions of earnings from foreign corporations under section 960(a).  
							For each line in Schedule C, include the column 10 amount in column 3 of the line in Schedule B, Part I that corresponds with the identifying number specified in column 1 of Schedule A and that also corresponds with the identifying number entered in column 1b of this Schedule C (see instructions).</div>
								<div class="styGenericDiv" style="width:3.2mm;float:right">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
										<xsl:with-param name="containerHeight" select="6"/>
										<xsl:with-param name="headerHeight" select="2"/>
										<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnA' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
							</div>
						</div>
						<!-- BEGIN SCHEDULE C PART I-->
						<div class="styTableContainerLandscape" style="width:260mm;border-top-width:0px;border-bottom-width:0px;" id="DIVDIPST1986ctnA">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styLandscapeTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="width:259mm;">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:100mm;height:5mm;" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Foreign Corporation</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:80mm;height:5mm;" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Coporation (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:80mm;height:5mm;" scope="col">1c. <span class="styNormalText" style="display:inline;">QBU Reference ID (if applicable)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 7) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:choose>
														<xsl:when test="(MissingEINReasonCd)">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="(ForeignEntityIdentificationGrp)">
																<xsl:for-each select="ForeignEntityIdentificationGrp">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
																	</xsl:call-template>
																	<br/>
																</xsl:for-each>
															</xsl:if>
															<xsl:if test="(ForeignCorporationEIN)">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="QBUReferenceIdNum"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule C Part I -->
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 1) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 7) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchCPartI">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchCPartI"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 2) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartI"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 3) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartI"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 4) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartI"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 5) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartI"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 6) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartI"/>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnA' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<div style="margin-left: 27mm; width: 232mm; float:left; clear:none">
							<div class="styItalicText" style="display:inline;">
								<span style="width:228mm"/>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnB' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- BEGIN SCHEDULE C PART I Continued-->
						<div class="styTableContainerLandscape" style="width:260mm;border-top-width:0px;border-bottom-width:0px;" id="DIVDIPST1986ctnB">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styLandscapeTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="width:259mm;">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:85mm;" rowspan="2" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" rowspan="2" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" rowspan="2" scope="col">4. <span class="styNormalText" style="display:inline;">Functional Currency of Foreign Corporation (enter code - seev instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:115mm;" colspan="3" scope="col">5. <span class="styNormalText" style="display:inline;">Subpart F Income Group</span>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">(a) <span class="styNormalText" style="display:inline;">Reg. sec. 1.960-1(d)(2)(ii)(B)(2)(enter code)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">(b) <span class="styNormalText" style="display:inline;">Reg. sec.  1.904-4(c)(3)(i)-(iv) (enter code)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:85mm;" scope="col">(c) <span class="styNormalText" style="display:inline;">Unit</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 7) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryCd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SubpartFIncomeGrpRegSect1960Cd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SubpartFIncomeGrpRegSect1904Cd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="QBUName"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule C Part I -->
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 1) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 7) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchCPartICont">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchCPartICont"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 2) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 3) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 4) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 5) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 6) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartICont"/>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnB' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<div style="margin-left: 27mm; width: 232mm; float:left; clear:none">
							<div class="styItalicText" style="display:inline;">
								<span style="width:228mm"/>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnC' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- BEGIN SCHEDULE C PART I Continued-->
						<div class="styTableContainerLandscape" style="width:260mm;border-top-width:0px;border-bottom-width:0px;" id="DIVDIPST1986ctnC">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styLandscapeTable" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="width:259mm;">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;" rowspan="2" scope="col">6. <span class="styNormalText" style="display:inline;">Total Net Income in Subpart F Income Group (in functional currency of foreign corporation)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;" rowspan="2" scope="col">7. <span class="styNormalText" style="display:inline;">Total Current Year Taxes in Subpart F Income Group (in U.S. dollars)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:80mm;" colspan="2" scope="col">8. <span class="styNormalText" style="display:inline;">Section 951(a)(1) Inclusion Attributable to Subpart F Income Group</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;" rowspan="2" scope="col">9. <span class="styNormalText" style="display:inline;">Divide column 8(a) by column 6</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:50mm;" rowspan="2" scope="col">10. <span class="styNormalText" style="display:inline;">Tax Deemed Paid (multiply column 7 by column 9)</span>
										</th>
									</tr>
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;" scope="col">(a) <span class="styNormalText" style="display:inline;">Functional Currency</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:40mm;" scope="col">(b) <span class="styNormalText" style="display:inline;">U.S. Dollars</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 7) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotNetIncmSubpartFIncmGrpAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotCYTaxesSubpartFIncmGrpAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section951a1InclsnFuncCurAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Sect951a1InclsnUSDollarAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FunctionalCurComputationRt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxesDeemedPaidAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule C Part I -->
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 1) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 7) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchCPartIContCont">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchCPartIContCont"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 2) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartIContCont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 3) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartIContCont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 4) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartIContCont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 5) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartIContCont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &lt; 6) or ((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchCPartIContCont"/>
									</xsl:if>
									<tr>
										<td class="styIRS1118TableCellNW" style="height:5mm;text-align:left;" colspan="5">
											<span class="styBoldText">Total</span> (add amounts in column 10).
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
										  <span style="width:10px"/>.
										  <span style="width:10px"/>
											</span>
											<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="height:5mm;padding-bottom:0mm;">
											<br/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxesDeemedPaidAmt"/>
											</xsl:call-template>
											<span style="width:1px"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'DIVDIPST1986ctnC' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<xsl:if test="($Print = $Separated)">
							<br/>
							<br/>
							<br/>
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
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
					</div>
					<div class="pageEnd" style="border-bottom:0px solid black;"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div style="width:256mm;border-bottom:1px solid black;">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
							<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">4</span>
							</div>
						</div>
						<!--END HEADER-->
						<!-- BEGIN SCHEDULE D -->
						<div class="styBB" style="width:256mm;">
							<div class="styTitleName">Schedule D</div>
							<span class="styIRS1118TitleDesc">Tax Deemed Paid With Respect to Section 951A Income by Domestic Corporation Filing the Return (Section 960(d))</span>
							<div style="margin-left: 27mm; width: 256mm; float:left; clear:none">
								<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/>
								<div class="styItalicText" style="display:inline;">Use this schedule to figure the tax deemed paid by the corporation with respect to section 951A inclusions of earnings from foreign corporations under section 960(d).</div>
							</div>
						</div>
						<!-- BEGIN SCHEDULE D PART I-->
						<div class="styBB" style="width:260mm;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:255.5mm;padding-left:0;border-bottom:1px solid black;">Part I—Foreign Corporation’s Tested Income and Foreign Taxes</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" '1TUEctnA' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div class="styTableContainerLandscape" style="width:261mm;border-bottom-width:0px;" id="1TUEctnA">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:98mm;" rowspan="2" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Foreign Corporation</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:48mm;" rowspan="2" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:38mm;" rowspan="2" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:38mm;" rowspan="2" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:48mm;" rowspan="2" scope="col">4. <span class="styNormalText" style="display:inline;">Pro Rata Share of CFC's Tested Income</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 6) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp">
											<tr style="">
												<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:if test="(MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:if test="(ForeignCorporationEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:if test="(ForeignEntityIdentificationGrp)">
														<xsl:for-each select="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryCd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule D Part I Section A -->
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 1) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchDPartISecA">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchDPartISecA"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 2) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecA"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 3) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecA"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 4) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecA"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 5) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecA"/>
									</xsl:if>
									<!-- End of filler rows -->
									<tr style="height:5mm;">
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;padding-left:1mm;border-top:1px solid black;border-bottom-width:0px;" colspan="4">
											<b>Total</b> (add amounts in column 4)
										<!--Dotted Line-->
											<span>.
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
										  <span style="width:5px"/>
											</span>
											<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="border-top:1px solid black;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/TotProRataShrCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" '1TUEctnA' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<div class="styBB" style="width:260mm;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:255.5mm;padding-left:0;border-bottom:1px solid black;">
								<span style="width:225mm;"/>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" '1TUEctnB' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div class="styTableContainerLandscape" style="width:261mm;border-bottom-width:0px;" id="1TUEctnB">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" rowspan="2" scope="col">5. <span class="styNormalText" style="display:inline;">Pro Rata Share of CFC’s Tested Income From Applicable Form 8992 Schedule (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" rowspan="2" scope="col">6. <span class="styNormalText" style="display:inline;">CFC’s Tested Income From Applicable Form 8992 Schedule (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" rowspan="2" scope="col">7. <span class="styNormalText" style="display:inline;">Divide Column 5 by Column 6</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" rowspan="2" scope="col">8. <span class="styNormalText" style="display:inline;">CFC’s Tested Foreign Income Taxes From Schedule Q (Form 5471) (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" rowspan="2" scope="col">9. <span class="styNormalText" style="display:inline;">Pro Rata Share of Tested Foreign Income Taxes Paid or Accrued by CFC (multiply column 7 by column 8)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 6) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp">
											<tr style="">
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CFCTestedIncomeComputationRt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CFCTestedForeignTaxesAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CFCTestedForeignTaxesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ShareFrgnIncmTxPdOrAccrCFCAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule D Part I Section A -->
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 1) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchDPartISecACont">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchDPartISecACont"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 2) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecACont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 3) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecACont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 4) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecACont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &lt; 5) or ((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartISecACont"/>
									</xsl:if>
									<!-- End of filler rows -->
									<tr style="height:5mm;">
										<td class="styIRS1118TableCellSmallArial" style="border-top:1px solid black;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/TotProRataShrCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;padding-left:1mm;border-top:1px solid black;border-bottom-width:1px;" colspan="3">
											<b>Total</b> (add amounts in column 5)
									</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;background-color:lightgrey;border-top:1px solid black;border-bottom-width:1px;">
											<span style="width:10mm;"/>
										</td>
									</tr>
									<tr style="height:5mm;">
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;padding-left:1mm;border-top:0px;border-bottom-width:1px;" colspan="4">
											<b>Total</b> (add amounts in column 9)
										<!--Dotted Line-->
											<span>.
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
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>
											</span>
											<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;border-top:0px;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/TotShrFrgnIncmTxPdOrAccrCFCAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" '1TUEctnB' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<xsl:if test="($Print = $Separated)">
							<span style="height:4mm;"/>
						</xsl:if>
						<!-- BEGIN SCHEDULE D PART II -->
						<div class="styBB" style="width:260mm;border-top:0px solid black;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:256mm;padding-left:0;border-bottom:1px solid black;">Part II—Foreign Income Tax Deemed Paid</div>
							<div class="styGenericDiv" style="width:3.2mm;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" '2TUEctn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div class="styTableContainerLandscape" id="2TUEctn" style="width:260mm;border-bottom-width:0px;">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:64mm;font-size:6pt;" scope="col">1. <span class="styNormalText" style="display:inline;">Global Intangible Low-Taxed Income <br/>(Section 951A Inclusion)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:64mm;font-size:6pt;" scope="col">2. <span class="styNormalText" style="display:inline;">
												<b>Inclusion Percentage.</b>
												<br/>Divide Part II, Column 1, by <br/>Part I, Column 5 Total</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:64mm;font-size:6pt;" scope="col">3. <span class="styNormalText" style="display:inline;">Multiply Part I, Column 9 Total, by Part II, Column 2 Percentage</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:64mm;font-size:6pt;" scope="col">4. <span class="styNormalText" style="display:inline;">Tax Deemed Paid (Multiply Part II, column 3, by 80% (0.80). Enter the result here and include on the line of Schedule B, Part I, column 3 that corresponds with the line with "951A" in column 2 of Schedule A.)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 6) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GlobalIntangibleLowTxIncmAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GlobalDivideTotalProRataRt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalCFCAmtTimesProrataRtAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxDeemedPd951AInclsnAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule D Part II Section A -->
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 1) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchDPartIISecA2">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 2) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 3) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 4) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &lt; 5) or ((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchDPartIISecA2"/>
									</xsl:if>
									<!-- End of filler rows -->
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" '2TUEctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
					</div>
					<!-- END SCHEDULE D PART II-->
					<!-- END SCHEDULE D-->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div class="styBB" style="width:256mm">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
							<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">5</span>
							</div>
						</div>
						<!--END HEADER-->
						<!-- BEGIN SCHEDULE E-->
						<div class="styBB" style="width:256mm;height:9mm;">
							<div class="styTitleName">Schedule E</div>
							<div class="styIRS1118TitleDesc">Tax Deemed Paid With Respect to Previously Taxed Earnings and Profits (PTEP) by Domestic Corporation Filing the Return (Section 960(b))
						</div>
						</div>
						<!-- BEGIN SCHEDULE E -->
						<div style="display:block;">
							<div class="styBB" style="width:256mm;float:none;clear:none;">
								<div class="styIRS1118TitleDesc" style="width:251.8mm;text-align:left;padding-left:0;">
							Part I — Tax Deemed Paid by Domestic Corporation
						</div>
							</div>
							<div style="width: 259mm;border-bottom:1px solid black;">
								<div style="width: 253.5mm;font-size:7pt;display:inline;border-bottom:0px solid black;">Use this part to report the tax deemed paid by the domestic corporation with respect to distributions of PTEP from first-tier foreign corporations under section 960(b).  For each line in Schedule E, Part I, include the column 11 amount in column 3 of the line in Schedule B, Part I that corresponds with the identifying number specified in column 1 of Schedule A and that also corresponds with the identifying number specified in column 1b of this Schedule E, Part I (see instructions).<span style="width:28mm;"/>
								</div>
								<div class="styGenericDiv" style="width:3.2mm;float:right">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp"/>
										<xsl:with-param name="containerHeight" select="6"/>
										<xsl:with-param name="headerHeight" select="2"/>
										<xsl:with-param name="containerID" select=" '3TUEctnA' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
							</div>
							<!-- BEGIN SCHEDULE E PART I-->
							<div class="styTableContainerLandscape" id="3TUEctnA" style="width:260mm;border-bottom-width:0px;">
								<!-- print logic -->
								<xsl:call-template name="SetInitialState"/>
								<!-- end -->
								<table class="styTable" cellspacing="0" style="bordder-bottom-width:0px;">
									<thead class="styTableThead">
										<tr>
											<th class="styIRS1118TableCellHeaderSmall" style="width:55mm;" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Distributing Foreign Corporation</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:55mm;" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">4. <span class="styNormalText" style="display:inline;">Functional Currency of the Distributing Foreign Corporation</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">5. <span class="styNormalText" style="display:inline;">PTEP Group (enter code)</span>
											</th>
											<th class="styIRS1118TableCellHeaderSmall" style="width:30mm;" scope="col">6. <span class="styNormalText" style="display:inline;">Annual PTEP account (enter year)</span>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print != $Separated))">
											<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp">
												<tr style="height:6mm;">
													<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
														<xsl:choose>
															<xsl:when test="(MissingEINReasonCd)">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="(ForeignEntityIdentificationGrp)">
																	<xsl:for-each select="ForeignEntityIdentificationGrp">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
																		</xsl:call-template>
																		<br/>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="(DistributingForeignCorpEIN)">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
																	</xsl:call-template>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
														</xsl:call-template>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CountryCd"/>
														</xsl:call-template>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
														</xsl:call-template>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
														</xsl:call-template>
													</td>
													<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Filler rows for Schedule E Part I -->
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:choose>
												<xsl:when test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated)">
													<xsl:call-template name="AddRowsForSchEPartI">
														<xsl:with-param name="ShowMessage">true</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="AddRowsForSchEPartI"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:if>
										<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
											<xsl:call-template name="AddRowsForSchEPartI"/>
										</xsl:if>
										<!-- End of filler rows -->
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '3TUEctnA' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						</div>
						<div style="width: 259mm;border-bottom:1px solid black;">
							<div style="width: 253.5mm;font-size:7pt;display:inline;border-bottom:0px solid black;">
								<span style="width:28mm;"/>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" '3TUEctnB' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- BEGIN SCHEDULE E PART I-->
						<div class="styTableContainerLandscape" id="3TUEctnB" style="width:260mm;border-bottom-width:0px;">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0" style="bordder-bottom-width:0px;">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" scope="col">7. <span class="styNormalText" style="display:inline;">Total Amount of PTEP in the PTEP Group Within an Annual PTEP Account</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" scope="col">8. <span class="styNormalText" style="display:inline;">Total Amount of the PTEP group taxes with respect to PTEP group within an Annual PTEP Account</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" scope="col">9. <span class="styNormalText" style="display:inline;">Distribution from the PTEP Group within an Annual PTEP Account</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" scope="col">10. <span class="styNormalText" style="display:inline;">Divide column 9 by column 7 </span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:52mm;" scope="col">11. <span class="styNormalText" style="display:inline;">Foreign income taxes properly attributable to PTEP and not previously deemed paid (multiply column 8 by column 10)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 7) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PTEPComputationRt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule E Part I -->
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 1) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchEPartICont">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchEPartICont"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 2) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 3) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 4) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 5) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartICont"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &lt; 6) or ((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartICont"/>
									</xsl:if>
									<!-- End of filler rows -->
									<tr style="height:6mm;">
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:7pt;bordder-bottom-width:0px;" colspan="4">
											<b>Total</b> (add amounts in column 11).
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
													  <span style="width:10px"/>
											</span>
											<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;bordder-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp/TotalTaxDeemedPdSection960bAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" '3TUEctnB' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div class="styBB" style="width:256mm">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
							<div style="float:right">
							  Page <span class="styBoldText" style="font-size: 8pt">6</span>
							</div>
						</div>
					</div><!--END HEADER-->
					<div style="display:block;">
						<!-- BEGIN SCHEDULE E-->
						<div class="styBB" style="width:256mm;height:9mm;">
							<div class="styTitleName">Schedule E</div>
							<div class="styIRS1118TitleDesc">
								Tax Deemed Paid With Respect to Previously Taxed Earnings and Profits (PTEP) by Domestic Corporation Filing the Return (Section 960(b))<span style="font-weight:normal;font-style:italic">(continued)</span>
							</div>
						</div>
						<div class="styBB" style="width:260mm;border-top-width:0px;border-bottom-width:0px;">
							<div class="styIRS1118TitleDesc" style="width:255mm;height:5mm;text-align:left;vertical-align:center;padding-left:0;border-top-width:0px;border-bottom:1px solid black;">Part II—Tax Deemed Paid by First- and Lower-Tier Foreign Corporations
						</div>
							<div style="height:7mm;width: 259mm;vertical-align:center;border-bottom:1px solid black;">
								<div style="width: 256mm;font-size:7pt;display:inline;">Use this part to report the tax deemed paid by a foreign corporation with respect to distributions of PTEP from lower-tier foreign corporations under section 960(b) that relate to distributions reported in Part I (see instructions).</div>
								<div class="styGenericDiv" style="width:3.2mm;float:right">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
										<xsl:with-param name="containerHeight" select="6"/>
										<xsl:with-param name="headerHeight" select="2"/>
										<xsl:with-param name="containerID" select=" '4TUEctnA' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
							</div>
						</div>
						<div class="styTableContainerLandscape" style="height:auto;width:260mm;border-bottom-width:0px;display:block;" id="4TUEctnA">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0" style="width:256mm;">
								<thead class="styTableThead">
									<tr>
										<th class="styIRS1118TableCellHeaderSmall" style="width:130mm;" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Distributing Foreign Corporation</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:60mm;" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
										</th>
										<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 7) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print != $Separated))">
										<xsl:for-each select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp">
											<tr style="height:6mm;">
												<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:choose>
														<xsl:when test="(MissingEINReasonCd)">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="(ForeignEntityIdentificationGrp)">
																<xsl:for-each select="ForeignEntityIdentificationGrp">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
																	</xsl:call-template>
																	<br/>
																</xsl:for-each>
															</xsl:if>
															<xsl:if test="(DistributingForeignCorpEIN)">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryCd"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Filler rows for Schedule E Part II -->
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 1) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:choose>
											<xsl:when test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated)">
												<xsl:call-template name="AddRowsForSchEPartII">
													<xsl:with-param name="ShowMessage">true</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="AddRowsForSchEPartII"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 2) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartII"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 3) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartII"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 4) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartII"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 5) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartII"/>
									</xsl:if>
									<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 6) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
										<xsl:call-template name="AddRowsForSchEPartII"/>
									</xsl:if>
									<!-- End of filler rows -->
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" '4TUEctnA' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
					</div>
					<!-- END SCHEDULE E-->
					<div style="width: 259mm;vertical-align:center;border-bottom:1px solid black;">
						<div style="width: 256mm;font-size:7pt;display:inline;">
							<span style="width:25mm;"/>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '4TUEctnB' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;width:260mm;border-bottom-width:0px;display:block;" id="4TUEctnB">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:130mm;" scope="col">4a. <span class="styNormalText" style="display:inline;">Name of Recipient Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:60mm;" scope="col">4b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">5. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">6. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 7) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
												<xsl:choose>
													<xsl:when test="(LowerTierRecipientFrgnCorpGrp/MissingEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:if test="(LowerTierRecipientFrgnCorpGrp/ForeignEntityIdentificationGrp)">
															<xsl:for-each select="LowerTierRecipientFrgnCorpGrp/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="node()"/>
																</xsl:call-template>
																<br/>
															</xsl:for-each>
														</xsl:if>
														<xsl:if test="(LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpEIN)">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpEIN"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/TaxYearEndMonthYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/CountryCd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part II -->
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 1) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartIICont">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartIICont"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 2) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIICont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 3) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIICont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 4) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIICont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 5) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIICont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 6) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIICont"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '4TUEctnB' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div style="width: 259mm;vertical-align:center;border-bottom:1px solid black;">
						<div style="width: 256mm;font-size:7pt;display:inline;">
							<span style="width:25mm;"/>
						</div>
						<div class="styGenericDiv" style="width:3.2mm;float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '4TUEctnC' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;width:260mm;border-bottom-width:0px;display:block;" id="4TUEctnC">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">7. <span class="styNormalText" style="display:inline;">Functional Currency of the Distributing Foreign Corporation</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;" scope="col">8. <span class="styNormalText" style="display:inline;">PTEP Group (enter code)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;" scope="col">9. <span class="styNormalText" style="display:inline;">Annual PTEP account (enter year)</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">10. <span class="styNormalText" style="display:inline;">Total Amount of PTEP in the PTEP Group Within an Annual PTEP Account</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">11. <span class="styNormalText" style="display:inline;">Total Amount of the PTEP group taxes with respect to PTEP group Within an Annual PTEP Account</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">12. <span class="styNormalText" style="display:inline;">PTEP Distributed</span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">13. <span class="styNormalText" style="display:inline;">Divide column 12 by column 10 </span>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:35mm;" scope="col">14. <span class="styNormalText" style="display:inline;">Foreign income taxes properly attributable to PTEP and not previously deemed paid (multiply column 11 by column 13)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 7) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print != $Separated))">
									<xsl:for-each select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp">
										<tr style="height:6mm;">
											<td class="styIRS1118TableCellSmallArial" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PTEPComputationRt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS1118TableCellSmallArial" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Filler rows for Schedule E Part II -->
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 1) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:choose>
										<xsl:when test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated)">
											<xsl:call-template name="AddRowsForSchEPartIIContCont">
												<xsl:with-param name="ShowMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 2) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 3) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 4) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 5) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
								</xsl:if>
								<xsl:if test="(count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &lt; 6) or ((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="AddRowsForSchEPartIIContCont"/>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" '4TUEctnC' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END SCHEDULE E-->
					<!--BEGIN FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:140px"/>
						  Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div class="styBB" style="width:256mm">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
							<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">7</span>
							</div>
						</div>
						<!--END HEADER-->
						<!-- BEGIN SCHEDULE F-1 -->
						<div class="styBB" style="width:256mm;">
							<div class="styTitleName">Schedule F</div>
							<span class="styIRS1118TitleDesc" style="width:229mm;display:inline;">Reserved</span>
						</div>
						<!-- BEGIN SCHEDULE G-->
						<div class="styBB" style="width:256mm;clear:both;border-left-width:0px;border-bottom-width:0px;">
							<div class="styIRS1118ScheduleCell" style="width:256;border-left-width:1px;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;">
								<div class="styBB" style="width:256mm;">
									<div class="styTitleName">Schedule G</div>
									<div class="styIRS1118TitleDesc" style="width:103mm;height:4mm;">Reductions of Taxes Paid, Accrued, or Deemed Paid</div>
								</div>
								<div style="width:256mm;float:left;clear:none;border-bottom:1pt solid black;font-size:8pt;font-weight:bold;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;">
								Part I -- Reduction Amounts
							</div>
								<div style="width:256mm;float:left;clear:none;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;text-align:center;padding-top:2mm;float:left;clear:none;border-left-width:0px">A</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:8mm;padding-top:2mm;">
									 Reduction of Taxes Under Section 901(e)—Attach separate schedule
									 <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReductionAmt"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................... </span>
									</div>
									<div class="styLNAmountBox" style="height:8mm;padding-top:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Section901eTaxReductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;text-align:center;float:left;clear:none;padding-top:0.5mm;border-left-width: 0px">B</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Reduction of Foreign Oil and Gas Taxes—Enter
									amount from Schedule I, Part II, line 4<span style="width:3mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................... </span>
									</div>
									<div class="styLNAmountBox" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ReductionForeignOilGasTaxesAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:8mm;text-align:center;float:left;clear:none;padding-top:0.5mm;border-left-width: 0px">C</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:8mm;">Reduction of Taxes Due to International Boycott Provisions—Enter appropriate portion from Schedule C (Form 5713) (see instructions). <span class="styBoldText">Important:</span> Enter only "specifically attributable taxes" here.<span style="width:2mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................................... </span>
									</div>
									<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ForeignTaxCreditReductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;padding-top:0.5mm;text-align:center;float:left;clear:none;border-left-width: 0px">D</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">
								  Reduction of Taxes for Section 6038(c) Penalty—Attach separate schedule
								  <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPnltyTxReductionAmt"/>
										</xsl:call-template>
										<span style="width:3mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....................... </span>
									</div>
									<div class="styLNAmountBox" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/Sect6038cPnltyTxReductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<xsl:choose>
									<xsl:when test="count($Form1118ScheduleG/TaxesSuspendedUnderSect909Amt) &lt; 1">
										<div style="width:256mm;">
											<div class="styIRS1118LNLeftNumBoxB" style="border-left-width:0px;text-align:center;padding-top:0.5mm;float:left;clear:none;height:5mm;">E</div>
											<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Taxes suspended under section 909
											<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt"/>
												</xsl:call-template>
												<span style="width:1mm;"/>
												<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................................. </span>
											</div>
											<div class="styLNAmountBox" style="height:5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt"/>
												</xsl:call-template>
											</div>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt">
											<xsl:variable name="pos" select="position()"/>
											<div style="width:256mm;">
												<div class="styIRS1118LNLeftNumBoxB" style="border-left-width:0px;text-align:center;padding-top:0.5mm;float:left;clear:none;height:5mm;">E</div>
												<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Taxes suspended under section 909
												<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt[$pos]"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
													<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................................. </span>
												</div>
												<div class="styLNAmountBox" style="height:5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/TaxesSuspendedUnderSect909Amt[$pos]"/>
													</xsl:call-template>
												</div>
											</div>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;text-align:center;float:left;clear:none;padding-top:0.5mm;border-left-width: 0px">F</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Reduction for disallowed taxes under section 965(g)<span style="width:1.5mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............................. </span>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/RedDsallwTaxesUnderSect965gAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;text-align:center;float:left;clear:none;padding-top:0.5mm;border-left-width: 0px">G</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Reduction for disallowed taxes under section 245A<span style="width:3.25mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............................. </span>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/RedDsallwTaxesUnderSect245AAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;text-align:center;float:left;clear:none;padding-top:0.5mm;border-left-width: 0px">H</div>
									<div class="styIRS1118LNDescRed" style="width:216mm;height:5mm;">Other reductions in taxes (attach schedule—see instructions)<span style="width:1mm;"/>
										<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............................ </span>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/OtherTaxReductionsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;height:8mm;">
									<div class="styIRS1118LNDescRed" style="height:8mm;width:221mm;border-left-width:0px;border-bottom-width:0px;padding-top:4mm;padding-left:1mm;font-size:7pt;">
										<span class="styBoldText"> Total</span> (add lines A through F). Enter here and on Schedule B, Part II, line 3
									<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................... </span>
									</div>
									<div class="styIRS1118LNDescRed" style="height:8mm;width:3mm;border-bottom-width:0px;padding-top:4mm;">
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</div>
									<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/ForeignTaxReductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:256mm;float:left;clear:none;border-bottom:0pt;border-top:1pt solid black;font-size:8pt;font-weight:bold;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;">
								Part II -- Other Information
							</div>
								<div style="width:256mm;height:5.2mm;float:left;clear:none;border-bottom:0pt;border-top:1pt solid black;border-left:0pt solid black;padding-left:1mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;padding-top:1.5mm;border-left-width:0px;border-bottom-width:0px;text-align:center;float:left;clear:none;;">I</div>
									<span style="width:245mm;height:5mm;border-left-width:0;">Check this box if, during the tax year, the corporation paid or accrued any foreign tax that was disqualified for credit under section 901(m)
								<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............ </span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="Line G Credit Under Section 901 M">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
													<xsl:with-param name="BackupName">IRS1118ScheduleGCorpPayAccrFrgnTaxSect901mInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTaxSect901mInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleGCorpPayAccrFrgnTaxSect901mInd</xsl:with-param>
											</xsl:call-template>
											<span style="font-weight:bold;"> </span>
										</label>
									</span>
								</div>
								<div style="width:256mm;height:5.2mm;float:left;clear:none;border-bottom:0pt;border-top:1pt solid black;border-left:0pt solid black;padding-left:1mm;">
									<div class="styIRS1118LNLeftNumBoxB" style="height:5mm;padding-top:1.5mm;border-left-width:0px;border-bottom-width:0px;text-align:center;float:left;clear:none;;">J</div>
									<span style="width:246mm;height:5mm;border-left-width:0;">Check this box if, during the tax year, the corporation paid or accrued any foreign tax that was disqualified for credit under Section 901(j), (k) or (l)
								<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:0.5mm;">.......... </span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTxSect901jklInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="Line H Credit Under Section 901 J K Or L">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTxSect901jklInd"/>
													<xsl:with-param name="BackupName">IRS1118ScheduleGCorpPayAccrFrgnTxSect901jklInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleG/CorpPayAccrFrgnTxSect901jklInd"/>
												<xsl:with-param name="BackupName">IRS1118ScheduleGCorpPayAccrFrgnTxSect901jklInd</xsl:with-param>
											</xsl:call-template>
											<span style="font-weight:bold;"> </span>
										</label>
									</span>
								</div>
							</div>
						</div>
						<!--BEGIN FOOTER-->
						<div style="width:256mm;border-top:1pt solid black;">
							<div style="float:right;clear:none;">
								<div style="width:100mm;">
									<span style="width:62mm;"/>
								 Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)</div>
							</div>
						</div>
						<div class="pageEnd"/>
						<!--END FOOTER-->
						
						<!--BEGIN HEADER-->
						<div style="display:block;">
							<div class="styBB" style="width:256mm">
								<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
								<div style="float:right">
          Page <span class="styBoldText" style="font-size: 8pt">8</span>
								</div>
							</div>
							<!--END HEADER-->
							<!-- BEGIN SCHEDULE H PART I-->
							<div class="styBB" style="height:4.5mm;width:256mm;display:block;">
								<div class="styTitleName" style="height:4.5mm;">Schedule H</div>
								<div class="styIRS1118TitleDesc">Apportionment of Certain Deductions
							  <span class="styItalicText">
										<span class="styNormalText">(complete only once for all categories of income.)</span>
									</span>
								</div>
							</div>
							<div class="styBB" style="width:256mm;text-align:left;display:block;">
								<div style="width:256mm;text-align:left;font-size:9pt;font-weight:bold;padding-left:0;">Part I—Research and Experimental Deductions</div>
							</div>
							<div style="height:auto;width:256mm;display:block;">
								<table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:85mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="6">
												(a) Gross Receipts Method
											</td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="3" style="height:17mm;width:25mm;padding-top:1mm;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
												(b) Total
												R&amp;E Deductions
												(enter the sum of all
												amounts entered in
												all applicable “R&amp;E
												Deductions”
												columns).
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(i) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(ii) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iii) R&amp;E <br/>
												Deductions
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iv) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(v) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(vi) R&amp;E <br/>
												Deductions
											</td>
										</tr>
									</thead>
									<tr>
										<td style="width:5mm;font-weight:bold;padding-left:1mm;border-bottom:1px solid black;">1</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;">
											Totals (see instructions)
											<!--Dotted Line-->
											<span>.
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
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/TotalAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotalAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/TotResearchExperimentalDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/TotalAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotalAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/TotResearchExperimentalDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotREDeductionsEnteredAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;padding-left:1mm;border-bottom:0px solid black;">2</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">Exclusive apportionment (50%) to either:</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">a</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											U.S. source gross intangible income, or
											<!--Dotted Line-->
											<span>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/USSrceGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/USSrceGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotUSSrceGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;">b</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;">
											Foreign source gross intangible income
											<!--Dotted Line-->
											<span>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/FrgnSrceGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/FrgnSrceGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="height:7.5mm;width:5mm;font-weight:bold;vertical-align:top;padding-top:1mm;padding-left:1mm;border-bottom:1px solid black;">3</td>
										<td class="styIRS1118LNDescRD" style="height:7.5mm;width:80mm;text-align:left;">
											Remaining R&amp;E deductions to be apportioned (line 1
											minus line 2a or line 2b)
											<!--Dotted Line-->
											<span>.
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
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/RemainingREDedApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/RemainingREDedApprtnAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;vertical-align:top;padding-top:1mm;padding-left:1mm;border-bottom:0px solid black;">4</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;vertical-align:top;padding-top:1mm;border-bottom:0px solid black;">
											U.S. source gross intangible income/related gross
											receipts/allocated and apportioned R&amp;E deductions
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">a</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>.
											  <span style="width:8px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">b</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">c</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;">d</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:1px solid black;">
											Total line 4
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
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
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/TotalUSSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/USSrceIntngblIncmGroRcptsGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/TotalUSSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotResearchExperimentalDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;vertical-align:top;padding-top:1mm;padding-left:1mm;border-bottom:0px solid black;">5</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;vertical-align:top;padding-top:1mm;padding-top:1mm;border-bottom:0px solid black;">
											Total Foreign source gross intangible income / related gross receipts / allocated and apportioned R&amp;E deductions
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">a</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>.
											  <span style="width:8px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">b</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">c</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;">d</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:1px solid black;">
											Total line 5
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
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
											  <span style="width:10px"/>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/TotalFrgnSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/TotFrgnSrceIntngblIncomeGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/TotalFrgnSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div style="width:256mm;border-bottom:1px solid black;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H</span>
									<span style="width:0.5mm;"/>in instructions</span>
							</div>
						</div>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)</div>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
						<!--BEGIN HEADER-->
						<div style="display:block;">
							<div class="styBB" style="width:256mm">
								<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
								<div style="float:right">
								  Page <span class="styBoldText" style="font-size: 8pt">9</span>
								</div>
							</div>
							<!--END HEADER-->
							<!-- BEGIN SCHEDULE H PART I-->
							<div class="styBB" style="height:4.5mm;width:256mm;display:block;">
								<div class="styTitleName" style="height:4.5mm;">Schedule H</div>
								<div class="styIRS1118TitleDesc">Apportionment of Certain Deductions
							  <span class="styItalicText">
										<span class="styNormalText">(complete only once for all categories of income.)</span>
									</span>
								</div>
							</div>
							<div class="styBB" style="width:256mm;text-align:left;display:block;">
								<div style="width:256mm;text-align:left;font-size:9pt;font-weight:bold;padding-left:0;">Part I—Research and Experimental Deductions</div>
							</div>
							<div style="height:auto;width:256mm;display:block;">
								<table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:85mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="6">
												(a) Gross Receipts Method
											</td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="3" style="height:17mm;width:25mm;padding-top:1mm;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
												(b) Total
												R&amp;E Deductions
												(enter the sum of all
												amounts entered in
												all applicable “R&amp;E
												Deductions”
												columns).
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(i) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(ii) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iii) R&amp;E <br/>
												Deductions
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iv) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(v) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(vi) R&amp;E <br/>
												Deductions
											</td>
										</tr>
									</thead>
									<tr>
										<td style="width:5mm;font-weight:bold;vertical-align:top;padding-top:1mm;padding-left:1mm;border-bottom:0px solid black;">6</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;vertical-align:top;padding-top:1mm;border-bottom:0px solid black;">Foreign source gross intangible income / related gross receipts / allocated and apportioned R&amp;E deductions</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">a</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Enter Code
											<span style="width:30mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect951AFrgnSrceREDedGrp/Section951AIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(1) Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:9px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(2) Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(3) Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:1px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(4) Add lines 6a(1), 6a(2), and 6a(3)
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect951AFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect951AFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(5) Amount of line 3 R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(6) Amount of line 2b R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;padding-bottom:0.5mm;border-bottom:1px solid black;">
											(7) Total R&amp;E deductions for this separate category. Add lines 6a(5)
											<br/><span style="width:4mm;"/>and 6a(6)
											<!--Dotted Line-->
											<span>.
											  <span style="width:3px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect951AFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect951AFrgnSrceREDedGrp/TotREDedSect951ATotCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">b</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Enter Code
											<span style="width:30mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotFrgnBrFrgnSrceREDedGrp/ForeignBranchIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(1) Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:9px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(2) Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(3) Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:1px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(4) Add lines 6a(1), 6a(2), and 6a(3)
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/FrgnBrFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/FrgnBrFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(5) Amount of line 3 R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(6) Amount of line 2b R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;padding-bottom:0.5mm;border-bottom:1px solid black;">
											(7) Total R&amp;E deductions for this separate category. Add lines 6b(5)
											<br/><span style="width:4mm;"/>and 6b(6)
											<!--Dotted Line-->
											<span>.
											  <span style="width:3px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/FrgnBrFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotFrgnBrFrgnSrceREDedGrp/TotREDedFBTotCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
					<div style="width:256mm;padding-bottom:0.5mm;border-bottom:1px solid black;">
						<div style="float:left;clear:none;">
							<div style="width:256mm;">
								<b>Note:</b> Include the amount from column (b) of line 6a(7) in column 14 of the Schedule A that corresponds with the code entered on line 6a. If applicable, you should likewise include
								the amount from column (b) of line 6b(7) in column 14 of the Schedule A that corresponds with the code entered on line 6b. On page 10, you should likewise include the amount(s)
								from column (b) of lines 6c(7), 6d(7), and 6e(7) in column 14 of the Schedule A that corresponds with the code entered on lines 6c, 6d, and 6e, respectively.
							</div>
						</div>
						<div style="float:left;clear:none;padding-top:5mm;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H</span>
									<span style="width:0.5mm;"/>in instructions</span>
							</div>
						</div>
					</div>

					<!--BEGIN FOOTER-->
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)</div>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
						<!--BEGIN HEADER-->
						<div style="display:block;">
							<div class="styBB" style="width:256mm">
								<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
								<div style="float:right">
								  Page <span class="styBoldText" style="font-size: 8pt">10</span>
								</div>
							</div>
							<!--END HEADER-->
							<!-- BEGIN SCHEDULE H PART I-->
							<div class="styBB" style="height:4.5mm;width:256mm;display:block;">
								<div class="styTitleName" style="height:4.5mm;">Schedule H</div>
								<div class="styIRS1118TitleDesc">Apportionment of Certain Deductions
							  <span class="styItalicText">
										<span class="styNormalText">(complete only once for all categories of income.)</span>
									</span>
								</div>
							</div>
							<div class="styBB" style="width:256mm;text-align:left;display:block;">
								<div style="width:256mm;text-align:left;font-size:9pt;font-weight:bold;padding-left:0;">Part I—Research and Experimental Deductions</div>
							</div>
							<div style="height:auto;width:256mm;display:block;">
								<table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:256mm;">
									<thead class="styTableThead">
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" colspan="2" rowspan="3" style="height:17mm;width:85mm;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:98mm;border-left-width:1px;border-right-width:0px;" colspan="6">
												(a) Gross Receipts Method
											</td>
											<td class="styIRS1118TableCellHeaderSmall" rowspan="3" style="height:17mm;width:25mm;padding-top:1mm;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
												(b) Total
												R&amp;E Deductions
												(enter the sum of all
												amounts entered in
												all applicable “R&amp;E
												Deductions”
												columns).
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #1 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:5mm;width:75mm;border-left-width:1px;border-right-width:0px;" colspan="3">
												Product Line #2 (SIC Code: 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/SICCd"/>
												</xsl:call-template>)*
											</td>
										</tr>
										<tr>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(i) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(ii) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iii) R&amp;E <br/>
												Deductions
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(iv) Gross Intangible <br/>
												Income
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(v) Gross <br/>
												Receipts
											</td>
											<td class="styIRS1118TableCellHeaderSmall" style="height:8mm;width:25mm;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;">
												(vi) R&amp;E <br/>
												Deductions
											</td>
										</tr>
									</thead>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">c</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Enter Code
											<span style="width:30mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotPssvCatFrgnSrceREDedGrp/PassiveCategoryIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(1) Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:9px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(2) Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(3) Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:1px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(4) Add lines 6a(1), 6a(2), and 6a(3)
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/PssvCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/PssvCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(5) Amount of line 3 R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(6) Amount of line 2b R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;padding-bottom:0.5mm;border-bottom:1px solid black;">
											(7) Total R&amp;E deductions for this separate category. Add lines 6c(5)
											<br/><span style="width:4mm;"/>and 6c(6)
											<!--Dotted Line-->
											<span>.
											  <span style="width:3px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/PssvCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotPssvCatFrgnSrceREDedGrp/TotREDedPassiveTotalCatIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">d</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Enter Code
											<span style="width:30mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotGenCatFrgnSrceREDedGrp/GeneralCategoryIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(1) Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:9px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(2) Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(3) Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:1px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(4) Add lines 6a(1), 6a(2), and 6a(3)
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/GenCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/GenCatFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(5) Amount of line 3 R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/GenCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/GenCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(6) Amount of line 2b R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/GenCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/GenCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;padding-bottom:0.5mm;border-bottom:1px solid black;">
											(7) Total R&amp;E deductions for this separate category. Add lines 6d(5)
											<br/><span style="width:4mm;"/>and 6d(6)
											<!--Dotted Line-->
											<span>.
											  <span style="width:3px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/GenCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/GenCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotGenCatFrgnSrceREDedGrp/TotREDedGenTotCategoryIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;">e</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											Enter Code
											<span style="width:30mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect901jCatFrgnSrceREDedGrp/Section901jIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(1) Gross Intangible Income / Taxpayer's gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:9px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/TPGroRcptsGroIntngblIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(2) Gross Intangible Income / Controlled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/CtrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(3) Gross Intangible Income / Uncontrolled parties' gross receipts
											<!--Dotted Line-->
											<span>
											  <span style="width:1px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/UnctrlPrtyGroRcptsIntngblAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(4) Add lines 6a(1), 6a(2), and 6a(3)
											<!--Dotted Line-->
											<span>
											  <span style="width:7px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											  <span style="width:10px"/>.
											</span>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/GrossIntangibleIncomeGrp/Sect901jFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REGrossReceiptsGrp/Sect901jFrgnSrceIntngblIncmGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(5) Amount of line 3 R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/USSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:0px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;border-bottom:0px solid black;">
											(6) Amount of line 2b R&amp;E deductions apportioned to this separate
											<br/><span style="width:4mm;"/>category
											<!--Dotted Line-->
											<span>.
											  <span style="width:7px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;text-align:right;padding-right:1mm;border-bottom:1px solid black;"></td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;padding-bottom:0.5mm;border-bottom:1px solid black;">
											(7) Total R&amp;E deductions for this separate category. Add lines 6e(5)
											<br/><span style="width:4mm;"/>and 6e(6)
											<!--Dotted Line-->
											<span>.
											  <span style="width:3px"/>.
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
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/Sect901jCatFrgnSrceREDedGrp/FrgnSourceApprtnREDedSepCatAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect901jCatFrgnSrceREDedGrp/TotREDedSection901jTotIncmAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:5mm;font-weight:bold;vertical-align:top;padding-top:1mm;padding-left:1mm;border-bottom:1px solid black;">7</td>
										<td class="styIRS1118LNDescRD" style="width:80mm;text-align:left;vertical-align:top;padding-top:1mm;padding-bottom:0.5mm;border-bottom:1px solid black;">
											Total foreign-source apportioned R&amp;E deductions (add lines 6a(7), 6b(7), 6c(7), 6d(7), and 6e(7)). This should equal the amount entered on line 5d of this column.
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[1]/REDeductionGrp/TotalFrgnSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/GrossReceiptsMethodGrp[2]/REDeductionGrp/TotalFrgnSourceREDedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="border-left-width:1px;border-right-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
					<div style="width:256mm;padding-bottom:0.5mm;border-bottom:1px solid black;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H</span>
									<span style="width:0.5mm;"/>in instructions</span>
							</div>
						</div>
					</div>

					<!--BEGIN FOOTER-->
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)</div>
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					
					<!--BEGIN HEADER-->
					<div style="display:block;">
						<div class="styBB" style="width:256mm">
							<div style="float: left; clear: none">Form 1118 (Rev. 12-2021)</div>
							<div style="float:right">
						  Page <span class="styBoldText" style="font-size: 8pt">11</span>
							</div>
						</div>
						<!--END HEADER-->
						<!-- BEGIN SCHEDULE H PART II-->
						<div class="styBB" style="border-top-width: 1px; width:256mm;border-top-width:0px;">
							<div class="styTitleName">Schedule H</div>
							<div class="styIRS1118TitleDesc">Apportionment of Certain Deductions
							<span class="styItalicText">
									<span class="styNormalText">(Complete only once for all categories of income.) (continued)</span>
								</span>
							</div>
						</div>
						<div class="styBB" style="width:256mm;text-align:left;display:block;">
							<div class="styIRS1118TitleDesc" style="text-align:left;padding-left:0;">Part II—Interest Deductions, All Other Deductions, and Total Deductions
          <!-- The xsl:choose code block below enables this stylesheet to display data from more than one schema version -->
							</div>
						</div>
						<div style="height:auto;width:260mm;">
							<table class="styTable" style="height:auto;width:256mm;" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<td colspan="2" rowspan="2" scope="col" style="height:34mm;width:82mm;">
											<span style="width:1px;"/>
										</td>
										<td colspan="2" scope="col" style="height:22mm;width:62mm;text-align:left;float:none;border-bottom:1px solid black;border-left:1px solid black;">
											<span style="width:16px"/>
											<span class="styBoldText">(a)</span>
                Average Value of Assets–<br/>
											<span style="width:48px"/>
                Check method used:<br/>
											<div style="padding-left:4mm;">
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAverageValueAssetsGrpAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstVlTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAverageValueAssetsGrpAvgAstValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Tax book value
												</label>
												<br/>
												<span style="width:2mm"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAverageValueAssetsGrpAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstVlAltTaxBookValueMthdInd"/>
														<xsl:with-param name="BackupName">IRS1118ScheduleHAverageValueAssetsGrpAvgAstAltValTaxBookValueMethod</xsl:with-param>
													</xsl:call-template>Alternative tax book value
												</label>
											</div>
											<br/>
										</td>
										<td colspan="2" scope="col" style="height:22mm;width:60mm;float:none;border-bottom:1px solid black;border-left:1px solid black;">
											<span class="styBoldText">(b)</span>
                Interest Deductions
              </td>
										<td rowspan="2" scope="col" style="height:34mm;width:30mm;border-left:1px solid black;">
											<span class="styBoldText">(c)</span> 
												All Other Deductions<br/>
												(attach schedule)<br/>
												(see instructions)
												<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/OthDedNotAllcblTotalsAmt"/>
											</xsl:call-template>
										</td>
										<td rowspan="2" scope="col" style="height:34mm;width:38mm;text-align:center;padding-top:5mm;Padding-left:1mm;border-left:1px solid black;border-bottom:0px solid black;">
											<span class="styBoldText">(d)</span>
												Totals<br/>
												(add the amounts<br/>
												from columns (b)(iii),<br/>
												(b)(iv), and (c))<br/>
												<br/>
												<b>Additional note:</b> With
												respect to each
												applicable statutory
												grouping, enter the
												amount in column (d)
												of line 3a(2), 3b(2),
												3c(2), 3d(2), 3e(2),
												or 3f(2) below in
												column 14 of the
												corresponding
												Schedule A.
												<br/>
											<span style="height:3mm;"/>
										</td>
									</tr>
									<tr>
										<td scope="col" style="height:12mm;width:30mm;border-left:1px solid black;">
											<span class="styBoldText">(i)</span> Nonfinancial Corporations</td>
										<td scope="col" style="height:12mm;width:30mm;border-left:1px solid black;">
											<span class="styBoldText">(ii)</span> Financial Corporations</td>
										<td scope="col" style="height:12mm;width:30mm;border-left:1px solid black;">
											<span class="styBoldText">(iii)</span> Nonfinancial Corporations</td>
										<td scope="col" style="height:12mm;width:30mm;border-left:1px solid black;">
											<span class="styBoldText">(iv)</span> Financial Corporations</td>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;padding-left:1mm;border-bottom:0px solid black;">
											<span class="styBoldText">1<span style="width:2px"/>a</span>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">
												Totals (see instructions)
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
											</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/CorporationTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/CorporationTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/CorporationTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/CorporationTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/OthDedNotAllcblTotalsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:10mm;padding-top:4.5mm;border-bottom:0px solid black;">b</td>
										<td class="styIRS1118LNDescDed" style="height:10mm;padding-top:4mm;">Amounts specifically allocable under Temporary Regulations section 1.861-10T(e)
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/TempRegulationAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/TempRegulationAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/TempRegulationAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/TempRegulationAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;border-bottom-width:0px;background-color:lightgrey;">
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;border-bottom:0px solid black;">c</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Other specific allocations under Temporary Regulations section 1.861-10T</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/OtherAllocUnderTempRegsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/OtherAllocUnderTempRegsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/OtherAllocUnderTempRegsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/OtherAllocUnderTempRegsAmt"/>
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
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">Assets excluded from apportionment formula
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/AssetsExcldApportionmentAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/AssetsExcldApportionmentAmt"/>
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
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:1mm;padding-left:1mm;">
											<span class="styBoldText">2</span>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;">Total to be apportioned (subtract the sum of lines 1b, 1c,
												and 1d from line 1a)
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/TotalApportionedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/TotalApportionedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/TotalApportionedAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/TotalApportionedAmt"/>
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
										<td class="styLNLeftNumBox" style="border-bottom:0px solid black;">3</td>
										<td class="styIRS1118LNDescDed" style="border-bottom-width:0px;'">Apportionment among statutory groupings (see instructions):</td>
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
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												a				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:24mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect951ASect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect951AOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line a 
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect951AAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												b				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:24mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotFrgnBranchSect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotFrgnBranchOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line b
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/ForeignBranchIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotFrgnBranchAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												c				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:24mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotPassiveSect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotPassiveOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line c
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/PassiveCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotPassiveCatAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												d				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:24mm;text-align:center;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotGeneralSect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotGeneralCatOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line d
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotGeneralCatAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												e				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
												<xsl:for-each select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/Section901jIncomeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
												</xsl:for-each>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect901jSect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect901jlOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line e
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotSect901jAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="width:8mm;height:8mm;font-size:6pt;font-weight:bold;text-align:center;vertical-align:center;border-bottom:0px solid black;">
												f				
											</td>
										<td class="styIRS1118LNDescRD" style="height:8mm;vertical-align:center;border-bottom:0px solid black;">Enter Code
												<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
												<xsl:for-each select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/ResourcedTreatyIncomeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
												</xsl:for-each>
											</span>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
										<td class="styShadingCellSmall" style="height:8mm;width:25mm;padding-top:4mm;float:none;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(1) Section 245A dividend
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/Section245ADividendAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRBTSect245AAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;border-bottom:0px solid black;">(2) Other
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRBTOtherCatAggrgtAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td class="styLNLeftLtrBoxBB" style="height:8mm;padding-top:4.5mm;text-align:right;border-bottom:0px solid black;">
											<span style="width:5mm;"/>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;padding-top:4mm;">(3) Total line f
												<span style="width:3px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/GeneralCategoryIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/Section951AIncomeGrp/TotalCategoryIncomeAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/TotRBTAggregateAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="height:8mm;vertical-align:top;padding-top:1.5mm;padding-left:1mm;border-bottom:1px solid black;">
											<span class="styBoldText">4</span>
										</td>
										<td class="styIRS1118LNDescDed" style="height:8mm;vertical-align:center;">
											<b>Total foreign</b> (add lines 3a(3), 3b(3), 3c(3), 3d(3), 3e(3), and 3f(3))
												<span style="width:1px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstNonFinclCorporationsGrp/ApportionmentStatutoryGrp/TotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/AverageValueAssetsGrp/AvgAstFinancialCorporationsGrp/ApportionmentStatutoryGrp/TotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedNonFinclCorporationsGrp/ApportionmentStatutoryGrp/TotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApportionmentInterestDedGrp/IntDedFinancialCorporationsGrp/ApportionmentStatutoryGrp/TotalForeignAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ApprtnAllOtherDedudctionsGrp/ApportionmentStatutoryGrp/TotalForeignAmt"/>
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
									<tr>
										<td style="height:6mm;width:256mm;padding-left:5mm;vertical-align:center;font-weight:bold;border-bottom:1px solid black;" colspan="8">Section 904(b)(4) Adjustments</td>
									</tr>
									<tr>
										<td style="height:10mm;vertical-align:top;padding-top:1mm;;padding-left:1mm;border-bottom:1px solid black;">
											<span class="styBoldText">5</span>
										</td>
										<td class="styIRS1118LNDescDed" style="height:10mm;vertical-align:top;padding-top:1mm;" colspan="6">
											Expenses Allocated and Apportioned to Foreign Source Section 245A Dividend.<br/>  
											Enter the sum of amounts in column (d) of lines 3a(1), 3b(1), 3c(1), 3d(1), 3e(1), and 3f(1).<br/>  
											Include this line 5 result as a negative amount on Schedule B, Part II, line 8b
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
											</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ExpnsAllocFrgnSect245ADivAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<tr>
										<td style="height:7mm;vertical-align:top;padding-top:1mm;;padding-left:1mm;border-bottom:1px solid black;">
											<span class="styBoldText">6</span>
										</td>
										<td class="styIRS1118LNDescDed" style="height:7mm;vertical-align:top;padding-top:1mm;" colspan="6">
											Enter expenses allocated and apportioned to U.S. source section 245A dividend.<br/> 
											Include this line 6 amount as a negative amount on Schedule B, Part II, line 8b
												<span style="width:2px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
												<span style="width:10px;"/>.
											</td>
										<td class="styIRS1118LNAmountBoxSmall" style="height:7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1118ScheduleH/ExpnsAllocUSSect245ADivAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END SCHEDULE H PART II-->
					<div style="width:256mm;">
						<div style="float:left;clear:none;">
							<div style="width:127mm;" class="styItalicText">
								<span class="styBoldText">Important:</span>
								<span class="styItalicText"> See <span class="styBoldText">Computer-Generated Schedule H</span>
									<span style="width:0.5mm;"/>in instructions</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:128mm;">
								<span style="width:90mm;"/>      Form <b style="font-size:8pt;">1118</b> (Rev. 12-2021)</div>
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
									<th class="styDepTblCell" rowspan="4" style="width:14mm;">
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
										<td class="styIRS1118TableCellLtr" style="text-align:left;">
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
								<tr class="styDepTblHdr" style="height:6mm;text-align:left;padding-left:0mm;">
									<td class="styDepTblCell" style="padding-left:0mm;">
										<span class="styTableCellPad" style="font-weight:bold;padding-left:0mm;">Totals</span>
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
									<th class="styDepTblCell" style="width:11mm;height:21mm;" rowspan="3">
										<span class="styTableCellPad" style="font-weight:bold"/>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" colspan="2" style="width:30mm;height:14mm;">
										<br/>
										1. <span class="styNormalText" style="display:inline;">Credit is Claimed for Taxes (check one):</span>
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
									<th class="styDepTblCell" scope="col" style="width:193mm;height:7mm;" colspan="6">2. <span class="styNormalText" style="display:inline;">Foreign Taxes Paid or Accrued (attach schedule showing amounts in foreign currency and conversion rate(s) used)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:114mm;height:7mm;" colspan="6">
										<span class="styNormalText">Tax Withheld at Source on:</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;height:7mm;">
										<span class="styNormalText">Date Paid</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;height:7mm;">
										<span class="styNormalText">Date Accrued</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(a) <span class="styNormalText" style="display:inline;">Dividends</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(b) <span class="styNormalText" style="display:inline;">Distributions of Previously Taxed Income</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(c) <span class="styNormalText" style="display:inline;">Branch Remittances</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(d) <span class="styNormalText" style="display:inline;">Interest</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(e) <span class="styNormalText" style="display:inline;">Rents, Royalties, and License Fees</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;height:7mm;">(f) <span class="styNormalText" style="display:inline;">Other</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleA/IncmLossBfrAdjFrgnTxsPdAccrGrp">
									<tr style="height:6mm;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellLtr" scope="row" style="text-align:left;">
											<span class="styTableCellPad" style="font-weight:bold">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</span>
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
										<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldInterestAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldRentsRyltsLcnsAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellSmall" style="font-size:5pt;border-color:black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxWithheldOtherAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Totals Row -->
								<tr class="styDepTblHdr" style="height:6mm;">
									<td class="styDepTblCell" scope="row" colspan="3" style="text-align:left;">
										<span style="font-weight:bold;">Totals </span>(add lines A through C)</td>
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
									<td class="styDepTblCell" style="border-color:black;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleB/TotalTaxWithheldOtherAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule C, Part I -->
					<xsl:if test="((count($Form1118ScheduleC/Section951a1InclusionsCorpGrp) &gt; 7) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule C, Part I - Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings:</span>
						<table class="styDepTblLandscape" summary="Part I—Dividends and Deemed Inclusions From Post-1986 Undistributed Earnings" cellspacing="0" style="font-size:5pt;width:251.8mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Coporation (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">1c. <span class="styNormalText" style="display:inline;">QBU Reference ID (if applicable)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText" style="display:inline;">Functional Currency of Foreign Corporation (enter code - seev instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:45mm;font-size:5pt;" colspan="3" scope="col">5. <span class="styNormalText" style="display:inline;">Subpart F Income Group</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">6. <span class="styNormalText" style="display:inline;">Total Net Income in Subpart F Income Group (in functional currency of foreign corporation)</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText" style="display:inline;">Total Current Year Taxes in Subpart F Income Group (in U.S. dollars)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" colspan="2" scope="col">8. <span class="styNormalText" style="display:inline;">Section 951(a)(1) Inclusion Attributable to Subpart F Income Group</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText" style="display:inline;">Divide column 8(a) by column 6</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;font-size:5pt;" rowspan="2" scope="col">10. <span class="styNormalText" style="display:inline;">Tax Deemed Paid (multiply column 7 by column 9)</span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:24mm;font-size:5pt;" scope="col">(a) <span class="styNormalText" style="display:inline;">Reg. sec. 1.960-1(d)(2)(ii)(B)(2)(enter code)</span>
									</th>
									<th class="styDepTblCell" style="width:24mm;font-size:5pt;" scope="col">(b) <span class="styNormalText" style="display:inline;">Reg. sec.  1.904-4(c)(3)(i)-(iv) (enter code)</span>
									</th>
									<th class="styDepTblCell" style="width:24mm;font-size:5pt;" scope="col">(c) <span class="styNormalText" style="display:inline;">Unit</span>
									</th>
									<th class="styDepTblCell" style="width:24mm;font-size:5pt;" scope="col">(a) <span class="styNormalText" style="display:inline;">Functional Currency</span>
									</th>
									<th class="styDepTblCell" style="width:24mm;font-size:5pt;" scope="col">(b) <span class="styNormalText" style="display:inline;">U.S. Dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleC/Section951a1InclusionsCorpGrp">
									<tr style="height:6mm;">
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
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:choose>
												<xsl:when test="(MissingEINReasonCd)">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="(ForeignEntityIdentificationGrp)">
														<xsl:for-each select="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="(ForeignCorporationEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QBUReferenceIdNum"/>
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
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SubpartFIncomeGrpRegSect1960Cd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SubpartFIncomeGrpRegSect1904Cd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="text-align:center;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QBUName"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotNetIncmSubpartFIncmGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotCYTaxesSubpartFIncmGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section951a1InclsnFuncCurAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="ont-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect951a1InclsnUSDollarAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FunctionalCurComputationRt"/>
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
								<tr style="height:6mm;">
									<td class="styIRS1118TableCellNW" style="height:5mm;text-align:left;" colspan="14">
										<span class="styBoldText">Total</span> (add amounts in column 10).
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
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>.
										  <span style="width:10px"/>
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleC/TotalTaxesDeemedPaidAmt"/>
										</xsl:call-template>
										<span style="width:1px"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D -->
					<xsl:if test="((count($Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part I - Foreign Corporation’s Tested Income and Foreign Taxes:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:28mm;font-size:5pt;" rowspan="2" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">4. <span class="styNormalText" style="display:inline;">Functional Currency of Foreign Corporation (enter code)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">5. <span class="styNormalText" style="display:inline;">Pro rata share of CFC's tested income from applicable Form 8992 schedule (see instructions))</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">6. <span class="styNormalText" style="display:inline;">CFC's tested income from applicable Form 8992 schedule (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">7. <span class="styNormalText" style="display:inline;">Divide column 5 by column 6</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">8. <span class="styNormalText" style="display:inline;">CFC's tested foreign income taxes from Schedule Q (Form 5471) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;font-size:5pt;" rowspan="2" scope="col">9. <span class="styNormalText" style="display:inline;">Pro rata share of tested foreign income taxes paid or accrued by CFC (Multiply amount in column 7 by amount in column 8)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/ForeignTestedIncmAndFrgnTxGrp">
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
											</xsl:call-template>,<br/>
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
													<xsl:if test="(ForeignEntityIdentificationGrp)">
														<xsl:for-each select="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="(ForeignCorporationEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
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
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CFCTestedIncomeComputationRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CFCTestedForeignTaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareFrgnIncmTxPdOrAccrCFCAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr style="height:5mm;">
									<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:7pt;padding-left:1mm;border-top:1px solid black;border-bottom-width:0px;" colspan="5">
										<b>Total</b> (add amounts in column 5)
										<!--Dotted Line-->
										<span>.
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
										  <span style="width:5px"/>
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;border-top:1px solid black;border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/TotProRataShrCFCTestedIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;background-color:lightgrey;border-top:1px solid black;border-bottom-width:1px;">
										<span style="width:10mm;"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;background-color:lightgrey;border-top:1px solid black;border-bottom-width:1px;">
										<span style="width:10mm;"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;background-color:lightgrey;border-top:1px solid black;border-bottom-width:1px;">
										<span style="width:10mm;"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;background-color:lightgrey;border-top:1px solid black;border-bottom-width:1px;">
										<span style="width:10mm;"/>
									</td>
								</tr>
								<tr style="height:5mm;">
									<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:7pt;padding-left:1mm;border-top:0px;border-bottom-width:1px;" colspan="9">
										<b>Total</b> (add amounts in column 9)
										<!--Dotted Line-->
										<span>.
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
										  <span style="width:10px"/>
										</span>
										<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;border-top:0px;border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleD/TotShrFrgnIncmTxPdOrAccrCFCAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule D, Part II -->
					<xsl:if test="((count($Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp) &gt; 5) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule D, Part II - Foreign Income Tax Deemed Paid:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:6pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:64mm;font-size:6pt;" scope="col">1. <span class="styNormalText" style="display:inline;">Global Intangible Low-Taxed Income <br/>(Section 951A Inclusion)</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-size:6pt;" scope="col">2. <span class="styNormalText" style="display:inline;">Inclusion Percentage. <br/>Divide Part II, Column 1, by <br/>Part I, Column 5 Total</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-size:6pt;" scope="col">3. <span class="styNormalText" style="display:inline;">Multiply Part I, Column 9 Total, by Part II, Column 2 Percentage</span>
									</th>
									<th class="styDepTblCell" style="width:64mm;font-size:6pt;" scope="col">4. <span class="styNormalText" style="display:inline;">Tax Deemed Paid (Multiply Part II, column 3, by 80%. Enter the result here and include on the line of Schedule B, Part I, column 3 that corresponds with the line with "951A" in column 2 of Schedule A.)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleD/GlobalIntangibleLowTxIncmGrp">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GlobalIntangibleLowTxIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GlobalDivideTotalProRataRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalCFCAmtTimesProrataRtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxDeemedPd951AInclsnAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule E, Part I -->
					<xsl:if test="((count($Form1118ScheduleE/TaxDeemedPdSection960bGrp) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part I - Tax Deemed Paid by Third-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:40mm;font-size:6pt;" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Distributing Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:4mm;font-size:6pt;" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:10mm;font-size:6pt;" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:10mm;font-size:6pt;" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">4. <span class="styNormalText" style="display:inline;">Functional Currency of the Distributing Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">5. <span class="styNormalText" style="display:inline;">PTEP Group (enter code)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">6. <span class="styNormalText" style="display:inline;">Annual PTEP account (enter year)</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">7. <span class="styNormalText" style="display:inline;">Total Amount of PTEP in the PTEP Group </span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">8. <span class="styNormalText" style="display:inline;">Total Amount of the PTEP group taxes with respect to PTEP group</span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">9. <span class="styNormalText" style="display:inline;">Distribution from the PTEP Group </span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">10. <span class="styNormalText" style="display:inline;">Divide column 9 by column 7 </span>
									</th>
									<th class="styDepTblCell" style="width:20mm;font-size:6pt;" scope="col">11. <span class="styNormalText" style="display:inline;">Foreign income taxes properly attributable to PTEP and not previously deemed paid (multiply column 8 by column 10)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;text-align:center;">
											<xsl:choose>
												<xsl:when test="(MissingEINReasonCd)">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="(ForeignEntityIdentificationGrp)">
														<xsl:for-each select="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="(DistributingForeignCorpEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PTEPComputationRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr style="height:6mm;">
									<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:7pt;bordder-bottom-width:0px;" colspan="11">
										<b>Total</b> (add amounts in column 11).
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
													  <span style="width:10px"/>
										</span>
										<img src="{$ImagePath}/1118_Bullet_Title.gif" alt="bulletpoint"/>
									</td>
									<td class="styIRS1118TableCellSmallArial" style="font-size:6pt;bordder-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleE/TaxDeemedPdSection960bGrp/TotalTaxDeemedPdSection960bAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- Separated Repeating Data Table for Schedule E, Part II -->
					<xsl:if test="((count($Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp) &gt; 6) and ($Print = $Separated))">
						<br/>
						<span class="styRepeatingDataTitle">Form 1118, Schedule E, Part II - Tax Deemed Paid by Fourth-Tier Foreign Corporations:</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:5pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" scope="col">1a. <span class="styNormalText" style="display:inline;">Name of Distributing Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" scope="col">1b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:7.5mm;font-size:5pt;" scope="col">2. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:7.5mm;font-size:5pt;" scope="col">3. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" scope="col">4a. <span class="styNormalText" style="display:inline;">Name of Recipient Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:30mm;font-size:5pt;" scope="col">4b. <span class="styNormalText" style="display:inline;">EIN or Reference ID Number of the Foreign Corporation (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:7.5mm;font-size:5pt;" scope="col">5. <span class="styNormalText" style="display:inline;">Tax Year End (Year/Month) (see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:7.5mm;font-size:5pt;" scope="col">6. <span class="styNormalText" style="display:inline;">Country of Incorporation (enter country code - see instructions)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">7. <span class="styNormalText" style="display:inline;">Functional Currency of the Distributing Foreign Corporation</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">8. <span class="styNormalText" style="display:inline;">PTEP Group (enter code)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">9. <span class="styNormalText" style="display:inline;">Annual PTEP account (enter year)</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">10. <span class="styNormalText" style="display:inline;">Total Amount of PTEP in the PTEP Group </span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">11. <span class="styNormalText" style="display:inline;">Total Amount of the PTEP group taxes with respect to PTEP group</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">12. <span class="styNormalText" style="display:inline;">PTEP Distributed</span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">13. <span class="styNormalText" style="display:inline;">Divide column 9 by column 7 </span>
									</th>
									<th class="styDepTblCell" style="width:13mm;font-size:6pt;" scope="col">14. <span class="styNormalText" style="display:inline;">Foreign income taxes properly attributable to PTEP and not previously deemed paid (multiply column 8 by column 10)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1118ScheduleE/LowerTierSect960bFrgnCorpGrp">
									<tr style="height:6mm;font-size:5pt;">
										<!-- Set the background color for the row -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
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
													<xsl:if test="(ForeignEntityIdentificationGrp)">
														<xsl:for-each select="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="(DistributingForeignCorpEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
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
										<td class="styIRS1118TableCellSmallArial" style="text-align:left;font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/RecipientForeignCorpName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:choose>
												<xsl:when test="(LowerTierRecipientFrgnCorpGrp/MissingEINReasonCd)">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="(LowerTierRecipientFrgnCorpGrp/ForeignEntityIdentificationGrp)">
														<xsl:for-each select="LowerTierRecipientFrgnCorpGrp/ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="(LowerTierRecipientFrgnCorpGrp/DistributingForeignCorpEIN)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/TaxYearEndMonthYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LowerTierRecipientFrgnCorpGrp/CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PTEPComputationRt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1118TableCellSmallArial" style="font-size:5pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
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
			<td class="styTableCellSmall" style="width:70mm;border-color:black;">
				<span class="styTableCellPad" style="width:69mm;text-align:left;">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchAPartII">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchAPartIII">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchBPartI">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
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
	<xsl:template name="AddRowsForSchBPartI2">
		<xsl:param name="TargetNode"/>
		<xsl:param name="ShowMessage"/>
		<tr style="">
			<td class="styIRS1118TableCellLtr">
				<span class="styBoldText">
					<xsl:value-of select="$TargetNode"/>
				</span>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
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
	<xsl:template name="AddRowsForSchCPartI">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;border-top-width:1px;border-bottom-width:0px;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartICont">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;border-top-width:1px;border-bottom-width:0px;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartIContCont">
		<xsl:param name="ShowMessage"/>
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="text-align:left;border-top-width:1px;border-bottom-width:0px;">
				<xsl:if test="$ShowMessage = 'true'">See Add'l Data</xsl:if>
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styIRS1118TableCellSmallArial" style="border-right-width:1px;border-top-width:1px;border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchCPartIB">
		<xsl:param name="ShowMessage"/>
		<tr>
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
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecACont">
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
			<td class="styIRS1118TableCellSmallArial">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartISecA2">
		<tr style="">
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
		<tr style="height:6mm;">
			<td class="styIRS1118TableCellSmallArial" style="border-bottom-width:0px;">
				<span class="styTableCellPad"/>
			</td>
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchDPartIISecA2">
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
		</tr>
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartICont">
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
		</tr>
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartIICont">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchEPartIIContCont">
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
		</tr>
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
	<xsl:template name="AddRowsForSchF1">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF1B">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF1PartII">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF1PartIIB">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF1PartIII">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF1PartIIIB">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF2">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF2B">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF2BCont">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchF3cont">
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
		</tr>
	</xsl:template>
	<xsl:template name="AddRowsForSchH">
		<xsl:param name="RowCount"/>
		<xsl:param name="TargetNode"/>
		<td class="styIRS1118LNAmountBoxSmall" style="width:24.5mm;">
			<xsl:if test="$RowCount&lt;3">
				<xsl:attribute name="style"><xsl:value-of select="'height:auto;'"/></xsl:attribute>
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
