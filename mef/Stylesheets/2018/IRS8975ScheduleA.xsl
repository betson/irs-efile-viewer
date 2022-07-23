<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8975ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8975ScheduleA"/>
	<xsl:variable name="ConstituentEntityInfoGrpSize" select="count($FormData/ConstituentEntityInfoGrp)"/>
	<xsl:variable name="CBCAdditionalInfoGrpSize" select="count($FormData/CBCAdditionalInfoGrp)"/>
	<xsl:variable name="RowsToShow" select="12"/>
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
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8975 ScheduleA"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8975ScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:256mm">
				<form name="Form8975ScheduleA">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--Title of Form -->
					<div class="styTBB" style="width:256mm;height: 22mm">
						<div class="styFNBox" style="height: 22mm; width:33mm;font-size: 7pt;">
							<span class="styFormNumber" style="font-size:10pt;">
							SCHEDULE A
							<br/>
							(Form 8975)
						</span>
							<br/>
							<span class="styAgency" style="font-size:7pt">(June 2017)</span>
							<div style="line-height:100%;padding-top:4mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:192mm; height: 22mm;">
							<div class="styFMT" style="line-height:3mm; font-weight: bold; padding-top: 2mm;">
								<div class="styMainTitle">Tax Jurisdiction and Constituent Entity Information<br/>
									<br/>
								</div>
								<span style="font-size:8pt;">
							For reporting period beginning 
								<span style="width:20mm;border-bottom:1 solid black; font-weight: normal;">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
									</span>
							, and ending 
								<span style="width:20mm;border-bottom:1 solid black; font-weight: normal;">
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
									</span>
								</span>
								<span style="font-size:7pt;">
									<img src="{$ImagePath}/8827_Bullet_Title.gif" width="7" height="7" alt="Bullet Image"/>
								A separate Schedule A (Form 8975) is to be completed for each tax jurisdiction of the multinational enterprise group.</span>
								<span style="font-size:7pt;">
									<img src="{$ImagePath}/8827_Bullet_Title.gif" width="7" height="7" alt="Bullet Image"/>							  
								  Information about Schedule A (Form 8975) and its separate instructions is at 
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8975" title="Link to IRS.gov">
										<i>www.irs.gov/form8975.</i>
									</a>
								</span>
								<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:31mm; height: 22mm">
							<div style="padding-top:9mm; font-size:7pt">OMB No. 1545-2272</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- BEGIN NAME OF REPORTING ENTITY AND EIN LINE -->
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:210mm;font-size:7pt;font-weight:normal;height:10mm;">
							<span style="margin-bottom:1mm;">
							Name of the reporting entity
						</span>
							<br/>
							<!-- Choice between 1120, 1041 Return Header Filer info -->
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div style="width:46mm;padding-left:2mm;">
						EIN<br/>
							<br/>
							<span style="width:50mm;text-align:left;font-weight:normal;padding-top:1mm;">
								<!-- Choice between 1120, 1041 Return Header Filer info -->
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--END NAME OF CORPORATION AND EIN LINE -->
					<!--Part I Header-->
					<div class="styBB" style="width:256mm;">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
						Tax Jurisdiction Information. <span style="font-weight:normal;">All financial amounts must be stated in U.S. dollars. See instructions.
						</span>
						</div>
					</div>
					<!--END Part I Header-->
					<!--Part I Tax Jurisdiction row-->
					<div class="styBB" style="width:256mm;">
						<div style="width:135mm;font-size:7pt;font-weight:normal;">
						Tax Jurisdiction
						<br/>
							<!-- Test to display TaxJurisdictionCountry or StatelessCd-->
							<div style="padding-top:1mm;">
								<xsl:choose>
									<xsl:when test="$FormData/TaxJurisdictionCountryCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TaxJurisdictionCountryCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/StatelessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!--END Part I Tax Jurisdiction row-->
					<!-- BEGIN TABLE Part 1 - Tax Jurisdiction Information -->
					<div class="styTableContainer" style="width:256mm;">
						<table class="styTable" cellspacing="0" style="width:256mm;font-size:7pt;">
							<!-- BEGIN TABLE Header Part 1 - Tax Jurisdiction Information -->
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height:5mm; " colspan="3" scope="col">
										<b>1.</b> Revenues
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height: 15mm; width:38mm;" rowspan="2" scope="col">
										<b>2.</b> Profit (loss) before <br/> income tax
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height: 15mm;" rowspan="2" scope="col">
										<b>3.</b> Income tax paid <br/> (on cash basis)
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height:15mm;" rowspan="2" scope="col">
										<b>4.</b> Income tax <br/> accrued—current <br/> year
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height: 15mm;" rowspan="2" scope="col">
										<b>5.</b> Stated capital
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height: 15mm;" rowspan="2" scope="col">
										<b>6.</b> Accumulated <br/> earnings
								</th>
									<th class="styIRS8975SchATableCell" style="vertical-align: top; height:15mm;" rowspan="2" scope="col">
										<b>7.</b> Number of <br/> employees
								</th>
									<th class="styIRS8975SchATableCell" style="border-right: 0; vertical-align: top; height: 15mm;" rowspan="2" scope="col">
										<b>8.</b> Tangible assets <br/> other than cash and <br/> cash equivalents
								</th>
								</tr>
								<tr>
									<th class="styIRS8975SchATableCell" style="width:26mm; height: 10mm;" scope="col">
										<b>(a)</b>
										<br/>Unrelated party
								</th>
									<th class="styIRS8975SchATableCell" style="width:26mm; height: 10mm;" scope="col">
										<b>(b)</b>
										<br/>Related party
								</th>
									<th class="styIRS8975SchATableCell" style="width:26mm; height: 10mm;" scope="col">
										<b>(c)</b>
										<br/>Total
								</th>
								</tr>
							</thead>
							<!--END TABLE HEADER Part 1 - Tax Jurisdiction Information -->
							<tfoot/>
							<!-- BEGIN TABLE CONTENT Part 1 - Tax Jurisdiction Information -->
							<tbody>
								<tr style="height:8mm;">
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedRevenueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/RelatedRevenueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/TotalRevenueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/ProfitOrLossAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxesPaidAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/TaxesAccruedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/CapitalAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/EarningsAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-bottom-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="7"/>
											<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="padding-top: 1mm;border-right-width:0px;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="15"/>
											<xsl:with-param name="TargetNode" select="$FormData/AssetsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
							<!-- END TABLE CONTENT Part 1 - Tax Jurisdiction Information -->
						</table>
					</div>
					<!--END TABLE  Part I - Tax Jurisdiction Information -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!--Part II-->
					<div style="display:block;">
						<!-- BEGIN Part II Header - Constituent Entity Information -->
						<div class="styBB" style="width:256mm;border-top-width:0.5px;">
							<div class="styPartName" style="width:15mm;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
					Constituent Entity Information
						</div>
							<!-- BEGIN Table expand/collapse toggle button end -->
							<!-- Test for size of ConstituentEntityInfoGrp, don't display table expand / colapse toggle button if not needed -->
							<!--							<xsl:if test="$ConstituentEntityInfoGrpSize &gt; $RowsToShow">
								</xsl:if>-->
							<!--  Table expand/collapse toggle button -->
							<xsl:if test="($Print != $Separated) and (count($FormData/ConstituentEntityInfoGrp) &gt; 12)">
								<span style="float:right;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/ConstituentEntityInfoGrp"/>
										<xsl:with-param name="containerHeight" select="12"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'SIctn' "/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<!-- END Table expand/collapse toggle button end-->
						</div>
						<!-- END Part II Header - Constituent Entity Information -->
						<!-- BEGIN TABLE Part II - Constituent Entity Information -->
						<div class="styTableContainerLandscape" style="width:256mm;" id="SIctn">
							<xsl:if test="($Print != $Separated) and (count($FormData/ConstituentEntityInfoGrp) &gt; 12)">
								<xsl:call-template name="SetInitialState"/>
							</xsl:if>
							<table class="styTable" cellspacing="0" style="width:256mm;font-size:7pt;">
								<!-- BEGIN TABLE HEADER  Part II - Constituent Entity Information -->
								<thead class="styTableThead" style="font-weight:normal;width:256mm;">
									<tr>
										<th class="styIRS8975SchATableCell" style="width:60mm;vertical-align: top;" rowspan="2" scope="col">
											<b>1.</b> Constituent entities resident in <br/> the tax jurisdiction
							</th>
										<th class="styIRS8975SchATableCell" style="vertical-align: top; width: 75mm;" rowspan="2" scope="col">
											<b>2.</b> TIN
							</th>
										<th class="styIRS8975SchATableCell" style="width:28mm;vertical-align: top;" rowspan="2" scope="col">
											<b>3.</b> Tax jurisdiction of <br/>organization or <br/>incorporation if<br/>different from tax<br/>jurisdiction of<br/>residence
							</th>
										<th class="styIRS8975SchATableCell" style="border-right: 0; vertical-align: top;height:7mm;" colspan="4" scope="col">
											<b>4.</b> Main business activities
							</th>
									</tr>
									<tr>
										<th class="styIRS8975SchATableCell" style="vertical-align: top; " scope="col" colspan="3">
											<b>(a)</b>
											<br/>Activity code
							</th>
										<th class="styIRS8975SchATableCell" style="vertical-align: top; width:62mm;border-right: 0; " scope="col">
											<b>(b)</b>
											<br/>If you entered the code for “Other,” describe the <br/>business activity
							</th>
									</tr>
								</thead>
								<!-- END TABLE HEADER  Part II - Constituent Entity Information -->
								<tfoot/>
								<!-- BEGIN TABLE CONTENT  Part II - Constituent Entity Information -->
								<tbody>
									<!--display part II data inline when print mode is not separated or if there are up to 12 rows of data in separated mode-->
									<xsl:if test="($Print != $Separated) or (($Print = $Separated)  and (count($FormData/ConstituentEntityInfoGrp) &lt; 13))">
										<xsl:for-each select="$FormData/ConstituentEntityInfoGrp">
											<tr style="vertical-align: top;">
												<td class="styTableCell" style="text-align:left;width:60mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
														<br/>
														<br/>
														<xsl:choose>
															<xsl:when test="USAddress!= ''">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="USAddress"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="ForeignAddress!= ''">
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="ForeignAddress"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</td>
												<td class="styTableCell" style="text-align:left;width:75mm;">
													<xsl:choose>
														<xsl:when test="TaxJurisdictionTIN!= ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="TaxJurisdictionTIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="NoTINCd!= ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="NoTINCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
													<br/>
													<br/>
													<xsl:for-each select="EntityIdentificationNumberGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityIdentificationNum"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="IssuerCountryCd"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="IdentificationNumberTypeDesc"/>
														</xsl:call-template>
														<xsl:if test="position() != last()">
															<br/>
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td class="styTableCell" style="text-align:center;width:28mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
													</xsl:call-template>
												</td>
												<!-- &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& -->
												<!-- &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& -->
												<!-- &&&&&&&&&&&&&& Sub Column 1 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:if test="position() mod 3 = 1">
															<span style="width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="(position() = last()) or ((position() + 1) = last()) or  ((position() + 2) = last())">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</xsl:for-each>
												</td>
												<!-- &&&&&&&&&&&&&& Sub Column 2 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:if test="position() mod 3 = 2">
															<span style=" width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="(position() = last()) or (position() + 1) = last()">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</xsl:for-each>
												</td>
												<!-- &&&&&&&&&&&&&& Sub Column 3 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:variable name="pos" select="position()"/>
														<xsl:if test="position() mod 3 = 0">
															<div style=" width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="position() = last()">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</div>
														</xsl:if>
													</xsl:for-each>
												</td>
												<!-- &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& -->
												<!-- &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="width:62mm;font-size:7pt;border-color:black;border-right:none;text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherInformationTxt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:call-template name="TableIIEmptyRows">
											<xsl:with-param name="NumEmptyRows" select="12-count($FormData/ConstituentEntityInfoGrp)"/>
										</xsl:call-template>
									</xsl:if>
									<!--display empty table with 'see additional data table' message if when print mode is separated AND if there more than 12 rows of data-->
									<xsl:if test="($Print = $Separated) and (count($FormData/ConstituentEntityInfoGrp) &gt; 12)">
										<xsl:call-template name="TableIIEmptyRows">
											<xsl:with-param name="NumEmptyRows" select="12"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:if test="($Print != $Separated) and (count($FormData/ConstituentEntityInfoGrp) &gt; 12)">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/ConstituentEntityInfoGrp"/>
								<xsl:with-param name="containerHeight" select="12"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'SIctn' "/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- END TABLE Part II - Constituent Entity Information -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- PAGE 1 Ends - Page Footer -->
					<div style="width:256mm;clear:both;">
						<div style="width:135mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 69310N</div>
						<div style="float:right;font-weight: bold; " class="styGenericDiv">Schedule A (Form 8975) (6-2017)</div>
					</div>
					<!-- Page 2 BEGINS - Heading -->
					<p style="page-break-before:always;display:block;"/>
					<div style="width:256mm;border-bottom:solid black 2px;padding-top:2mm;">
						<span style="float:left;">Schedule A (Form 8975) (6-2017)</span>
						<span style="float:right;">Page <b>2</b>
						</span>
					</div>
					<!-- End Page 2 heading -->
					<!--Part III-->
					<!-- BEGIN PART III - Additional Information -->
					<div class="styBB" style="width:256mm;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:241mm;border-bottom:solid black 2px;">
					Additional Information
				</div>
						<div style="width:256mm;">
							<div class="styLNDesc" style="width:256mm;font-size:8pt;">
					Enter any additional information related to the information reported in Part I and II.<br/>
								<br/>
							</div>
							<br/>
							<br/>
							<xsl:choose>
								<!--when there is no data for CBCAdditionalInfoGrp-->
								<xsl:when test="not($FormData/CBCAdditionalInfoGrp) or $FormData/CBCAdditionalInfoGrp = ''">
									<xsl:call-template name="EmptyIteratorTemp">
										<xsl:with-param name="NumEmptyRows" select="9"/>
										<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="$FormData/CBCAdditionalInfoGrp">
										<div class="styBB" style="width:256mm;text-align:left;float:none;clear:both;padding-top:1mm;">
											<div style="width:15mm;">
												<xsl:for-each select="CBCSummaryItemReferenceCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
												</xsl:for-each>
											</div>
											<div style="width:240mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AdditionalInformationTxt"/>
												</xsl:call-template>
											</div>
										</div>
									</xsl:for-each>
									<!--render out the correct number of empty rows to match PDF (9 rows)-->
									<xsl:call-template name="EmptyIteratorTemp">
										<xsl:with-param name="NumEmptyRows" select="9 - $CBCAdditionalInfoGrpSize"/>
										<xsl:with-param name="TempToCall" select="'EmptyExplanationLine'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- END PART III - Additional Information -->
					<br/>
					<br/>
					<br/>
					<!-- PAGE 2 Ends - Page Footer -->
					<div style="width:256mm;border-top:solid black 1.5px;">
						<span style="float:right;">
							<b>Schedule A (Form 8975) (6-2017)</b>
						</span>
					</div>
					<!-- Recycle Image -->
					<div align="center" style="width:256mm;padding-top:1mm;clear:both;"/>
					<div class="pageEnd"/>
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						  Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- START SRD Part II Table -->
					<xsl:if test="(($Print = $Separated) and (count($FormData/ConstituentEntityInfoGrp) &gt; 12))">
						<span class="styRepeatingDataTitle">Part II - Constituent Entity Information</span>
						<table cellspacing="0" class="styDepTblLandscape" cellpadding="0" style="font-size:7pt;">
							<thead class="styTableThead" style="width:256mm;">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:60mm;vertical-align: top;" rowspan="2" scope="col">
										<b>1.</b> Constituent entities resident in <br/> the tax jurisdiction
							</th>
									<th class="styDepTblCell" style="vertical-align:top;width:75mm;" rowspan="2" scope="col">
										<b>2.</b> TIN
							</th>
									<th class="styDepTblCell" style="vertical-align: top;width:28mm;" rowspan="2" scope="col">
										<b>3.</b> Tax jurisdiction of <br/>organization or <br/>incorporation if<br/>different from tax<br/>jurisdiction of<br/>residence
							</th>
									<th class="styDepTblCell" style="border-right: 0; vertical-align: top; height: 7mm;" colspan="4" scope="col">
										<b>4.</b> Main business activities
							</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="vertical-align: top; width:22mm;" colspan="3" scope="col">
										<b>(a)</b>
										<br/>Activity code
							</th>
									<th class="styDepTblCell" style="vertical-align: top; width:70mm; " scope="col">
										<b>(b)</b>
										<br/>If you entered the code for “Other,” describe the <br/>business activity
							</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ConstituentEntityInfoGrp">
									<tr style="width:256mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:60mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<br/>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress!= ''">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignAddress!= ''">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
												</xsl:choose>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:75mm;text-align:left;">
											<xsl:choose>
												<xsl:when test="TaxJurisdictionTIN!= ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TaxJurisdictionTIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="NoTINCd!= ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NoTINCd"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:for-each select="EntityIdentificationNumberGrp">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityIdentificationNum"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IssuerCountryCd"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IdentificationNumberTypeDesc"/>
												</xsl:call-template>
												<xsl:if test="position() != last()">
													<br/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="styDepTblCell" style="width:28mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
											</xsl:call-template>
										</td>
											<!-- &&&&&&&&&&&&&& Sub Column 1 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:if test="position() mod 3 = 1">
															<span style="width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="(position() = last()) or ((position() + 1) = last()) or  ((position() + 2) = last())">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</xsl:for-each>
												</td>
												<!-- &&&&&&&&&&&&&& Sub Column 2 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:if test="position() mod 3 = 2">
															<span style=" width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="(position() = last()) or (position() + 1) = last()">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</xsl:for-each>
												</td>
												<!-- &&&&&&&&&&&&&& Sub Column 3 &&&&&&&&&&&&&& -->
												<td class="styTableCell" style="vertical-align:top; width:10mm;text-align:center;">
													<xsl:for-each select="CBCBusinessActivityCd">
														<xsl:variable name="pos" select="position()"/>
														<xsl:if test="position() mod 3 = 0">
															<div style=" width:10mm;height:8mm;border-bottom:1px solid black;">
																<xsl:if test="position() = last()">
																	<xsl:attribute name="style">width:10mm;height:8mm;border-bottom:0;</xsl:attribute>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="."/>
																</xsl:call-template>
															</div>
														</xsl:if>
													</xsl:for-each>
												</td>
										<td class="styDepTblCell" style="width:70mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherInformationTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- END SRD Part II Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!--for populating Part II table-->
	<xsl:template name="ConstituentEntityInfoGrpTemp">
		<xsl:param name="IsSeparated">no</xsl:param>
		<tr style="vertical-align: top;">
			<td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;height:7mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="BusinessName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
					<br/>
					<br/>
					<xsl:choose>
						<xsl:when test="USAddress!= ''">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="USAddress"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="ForeignAddress!= ''">
							<xsl:call-template name="PopulateForeignAddressTemplate">
								<xsl:with-param name="TargetNode" select="ForeignAddress"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$IsSeparated = 'yes' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormData/ConstituentEntityInfoGrp"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-color:black;text-align:center;">
				<xsl:choose>
					<xsl:when test="TaxJurisdictionTIN!= ''">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="TaxJurisdictionTIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="NoTINCd!= ''">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NoTINCd"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;text-align:center;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
				</xsl:call-template>
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="vertical-align:top;width:24mm;font-size:7pt;border-color:black;">
				<xsl:for-each select="CBCBusinessActivityCd">
					<span style="width:24mm; text-align:center;height:5mm;vertical-align:top;">
						<xsl:if test="position() = last()">
							<xsl:attribute name="style">
													width:24mm; text-align:center;height:5mm;vertical-align:top;border-bottom:0;
													</xsl:attribute>
						</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</span>
				</xsl:for-each>
			</td>
			<td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;text-align:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="OtherInformationTxt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="EmptyExplanationLine">
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:param name="CalledTemplate">no</xsl:param>
		<div class="styBB" style="width:256mm;height:7mm;padding-top:3mm;">
			<xsl:if test="$IsSeparated = 'yes' ">
				<xsl:call-template name="PopulateAdditionalDataTableMessage">
					<xsl:with-param name="TargetNode" select="$CalledTemplate"/>
				</xsl:call-template>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
	<xsl:template name="EmptyIteratorTemp">
		<xsl:param name="NumEmptyRows"/>
		<xsl:param name="TempToCall"/>
		<xsl:param name="CalledTemplate" select="$FormData"/>
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:if test="$IsSeparated = 'no' ">
			<xsl:if test="$NumEmptyRows &gt; 0">
				<xsl:choose>
					<xsl:when test="$TempToCall = 'ConstituentEntityInfoGrpTemp'">
						<xsl:call-template name="ConstituentEntityInfoGrpTemp"/>
					</xsl:when>
					<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
						<xsl:call-template name="EmptyExplanationLine"/>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
				<xsl:call-template name="EmptyIteratorTemp">
					<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
					<xsl:with-param name="TempToCall" select="$TempToCall"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
		<!--if Separated print, use the IsSeparated param when calling ConstituentEntityInfoGrpTemp or EmptyExplanationLine -->
		<xsl:if test="$IsSeparated = 'yes' ">
			<xsl:choose>
				<xsl:when test="$TempToCall = 'ConstituentEntityInfoGrpTemp'">
					<xsl:call-template name="ConstituentEntityInfoGrpTemp">
						<xsl:with-param name="IsSeparated">yes</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$TempToCall = 'EmptyExplanationLine'">
					<xsl:call-template name="EmptyExplanationLine">
						<xsl:with-param name="IsSeparated">yes</xsl:with-param>
						<xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:call-template name="EmptyIteratorTemp">
				<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
				<xsl:with-param name="TempToCall" select="$TempToCall"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TableIIEmptyRows">
		<xsl:param name="NumEmptyRows"/>
		<xsl:if test="$NumEmptyRows &gt; 0">
			<tr style="vertical-align: top;height:8mm;">
				<td class="styTableCell" style="text-align:left;width:60mm;">
					<xsl:if test="($Print = $Separated) and ($NumEmptyRows = 12)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/ConstituentEntityInfoGrp"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width:75mm;"/>
				<td class="styTableCell" style="width:28mm;"/>
				<td class="styTableCell" style="width:10mm;"/>
				<td class="styTableCell" style="width:10mm;"/>
				<td class="styTableCell" style="width:10mm;"/>
				<td class="styTableCell" style="width:62mm;border-right:0;"/>
			</tr>
			<xsl:call-template name="TableIIEmptyRows">
				<xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
