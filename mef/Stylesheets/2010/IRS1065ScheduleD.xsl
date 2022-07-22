<?xml version="1.0" encoding="UTF-8"?>
<!--Created by Doug Peterson 6-27-2006 submitted for inspection 7-13-2006-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleDStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065SchDData" select="$RtnDoc/IRS1065ScheduleD"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065SchDData)"/>
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
				<meta name="Description" content="IRS Form 1065 Schedule D"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065ScheduleD">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:15mm;">
						<div class="styFNBox" style="width:31mm;height:15mm;">
							<div style="height:10mm">
								<span class="styFormNumber" style="font-size:9.5pt;">SCHEDULE D<br/>(Form 1065)<br/>
								</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065SchDData"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:none;padding-bottom:none">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:14mm;">
							<div class="styMainTitle" style="height:5mm;padding-top:1mm;">Capital Gains and Losses</div>
							<br/>
							<span style="width:2mm"/>
							<!--<div class="styFBT" style="height:3mm;padding-top:none;padding:left:none">-->
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<b> Attach to Form 1065.</b>
							<span style="width:6mm;"/>
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<b> See separate instructions.</b>
							<br/>
							<img src="{$ImagePath}/1065SchD_Bullet.gif" alt="Bullet"/>
							<b> Use Schedule D-1 to list additional transactions for lines 1 and 7.</b>
							<!--</div>-->
						</div>
						<div class="styTYBox" style="width:30mm;height:15mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0099</div>
							<div class="styTY" style="height:12.5mm;padding-top:1.5mm;">20<span class="styTYColor">10</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
          Name of partnership<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Start Line 1 -->
					<!-- End Line 1 -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartName" style="height:3.75mm;font-size:9pt">Part I</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt"> 
						 Short-Term Capital Gains and Losses<img src="{$ImagePath}/1065SchD_Longdash.gif"
						  alt="Longdash"/>Assets Held One Year or Less</div>
						<div class="styGenericDiv" style="width:1mm;padding-left:2mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermCapitalGainAndLoss"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'PSOctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- BEGIN PART I TABLE -->
					<div class="styTableContainer" style="height:25.5mm;" id="PSOctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead" style="font-size:6.3pt">
								<tr>
									<th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" scope="col"/>
									<th class="styTableCellHeader" style="width:31mm;font-weight:normal;text-align:left" scope="col">
										<b>(a)</b> Description of property<br/>
										<span style="width:4mm"/>
										(Example: 100 shares<br/>
										<span style="width:12mm"/>of "Z" Co.)</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(month, day, year)</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(month, day, year)</th>
									<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styTableCellHeader" style="width:40mm;font-weight:normal;" scope="col">
										<b>(e)</b> Cost or other basis<br><span style="width:1.5mm"/>(see instructions)</br>
									</th>
									<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:7pt">
								<xsl:if test="($Print != $Separated) 
								    or (count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt;= 5) ">
									<xsl:for-each select="$Form1065SchDData/ShortTermCapitalGainAndLoss">
										<tr style="height:8mm">
											<td class="styTableCell" style="width:4mm;text-align:right;
											    border-right-width:0px;font-weight:bold;" scope="col">
												<span class="styTableCellPad"/>
												<xsl:if test="position() = 1">1</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left;width:51mm;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PropertyDescription"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:1mm;float:left"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DateAcquired"/>
												</xsl:call-template>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:1mm;float:left"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DateSold"/>
												</xsl:call-template>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateSoldVarious"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SalesPrice"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;font-size:6.4pt;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLoss"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt; 1 or
								    ((count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 5) 
								    and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm; text-align:right;
										     border-bottom-width:0px; border-right-width:0px; font-weight:bold;" scope="col">1</td>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermCapitalGainAndLoss"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt; 2 or
								    ((count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 5) 
								    and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt; 3 or
								    ((count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 5) 
								    and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt; 4 or
								    ((count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 5) 
								    and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/ShortTermCapitalGainAndLoss) &lt; 5 or
								    ((count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 5) 
								    and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermCapitalGainAndLoss"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'PSOctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END PART I TABLE -->
					<!-- Start Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>2</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Enter short-term capital gain or (loss), if any, from Schedule D-1, line 2
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>2</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermGainOrLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Start Line 3 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>3</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Short-term capital gain from installment sales from Form 6252, line 26 or 37
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:.5px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>3</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermCapGainInstalSales"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 3 -->
					<!-- Start Line 4 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>4</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Short-term capital gain (loss) from like-kind exchanges from Form 8824
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">
							<br/>4</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/ShortTermGainLossFromLikeKind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4-->
					<!-- Start Line 5 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>5</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Partnership's share of net short-term capital gain (loss), including specially allocated short-
							<br/>term capital gains (losses), from other partnerships, estates, and trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;border-bottom-width:1px">
							<br/>5</div>
						<div class="styLNAmountBox" style="height:8mm; padding-top:4mm;
						     border-bottom-width:1px">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/PartnersShareShortTermGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 5 -->
					<!-- Start Line 6 -->
					<div class="styBB" style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>6</div>
						<div class="styLNDesc" style="width:139mm;">
							<span class="styBoldText">
								<br/>Net short-term capital gain or (loss).</span> Combine lines 1 through 5 in column (f). Enter  
								<br/>here and on Form 1065, Schedule K, line 8 or 11
                                <!--Dotted Line-->
							    <span class="styBoldText">
								   <span style="width:5px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                   <span style="width:11px"/>.
                                </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="padding-top:4mm; width:8mm;height:12mm;
						    border-bottom-width:0px;">
							<br/>6</div>
						<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;padding-top:4mm">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/NetShortTermCapitalGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- BEGIN PART 2 TITLE -->
					<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px;">
						<div class="styPartName" style="height:3.75mm;font-size:9pt">Part II</div>
						<div class="styPartDesc" style="float:left;width:167mm;font-size:9pt">
						  Long-Term Capital Gains and Losses<img src="{$ImagePath}/1065SchD_Longdash.gif"
						   alt="Longdash"/>Assets Held More Than One Year</div>
						<div class="styGenericDiv" style="width:1mm;padding-left:2mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermCapitalGainAndLoss"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'OGLctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END PART II TITLE -->
					<!-- BEGIN PART II TABLE -->
					<div class="styTableContainer" style="height:25.5mm;" id="OGLctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead" style="font-size:6.3pt">
								<tr>
									<th class="styTableCellHeader" style="width:1mm;border-right-width:0px;" scope="col"/>
									<th class="styTableCellHeader" style="width:31mm;font-weight:normal;text-align:left" scope="col">
										<b>(a)</b> Description of property<br/>
										<span style="width:4mm"/>(Example: 100 shares
										<br/>
										<span style="width:12mm"/> of "Z" Co.)</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(month, day, year)</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(month, day, year)</th>
									<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styTableCellHeader" style="width:40mm;font-weight:normal;" scope="col">
										<b>(e)</b> Cost or other basis<br><span style="width:1.5mm"/>(see instructions)</br>
									</th>
									<th class="styTableCellHeader" style="width:35mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:7pt">
								<xsl:for-each select="$Form1065SchDData/LongTermCapitalGainAndLoss">
									<xsl:if test="($Print != $Separated) or (count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt;= 5) ">
										<tr style="height:8mm">
											<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;font-weight:bold;"
											 scope="col">
												<span class="styTableCellPad"/>
												<xsl:if test="position() = 1">7</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left;width:51mm;">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PropertyDescription"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:1mm;float:left"/>
												<xsl:if test="DateAcquired">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateAcquired"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DateAcquiredVarious">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:1mm;float:left"/>
												<xsl:if test="DateSold">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateSold"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DateSoldVarious">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DateSoldVarious"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SalesPrice"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:40mm;font-size:6.4pt">
												<span style="float:left">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:30mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLoss"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt; 1 or
								    ((count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right; border-bottom-width:0px;
										      border-right-width:0px; font-weight:bold;" scope="col">7</td>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermCapitalGainAndLoss"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt; 2 or
								    ((count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt; 3 or
								    ((count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt; 4 or
								    ((count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchDData/LongTermCapitalGainAndLoss) &lt; 5 or
								    ((count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col"/>
										<td class="styTableCell" style="text-align:left;width:51mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:33mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:40mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:right;width:30mm;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermCapitalGainAndLoss"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'OGLctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END PART II TABLE -->
					<!-- Start Line 8 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>8</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Enter long-term gain or (loss), if any, from Schedule D-1, line 8
                            <!--Dotted Line-->
							<span class="styBoldText">
							    <span style="width:.5px"/>.
								<span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>8</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermGainOrLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Start Line 9 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/><span style="width:1mm"/>9</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Long-term capital gain from installment sales from Form 6252, line 26 or 37
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>9</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermCapGainInstalSales"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 9 -->
					<!-- Start Line 10 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>10</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>     Long-term capital gain (loss) from like-kind exchanges from Form 8824
                            <!--Dotted Line-->
							<span class="styBoldText">
							    <span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox">
							<br/>10</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/LongTermGainLossFromLikeKind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 10 -->
					<!-- Start Line 11 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>11</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Partnership's share of net long-term capital gain (loss), including specially allocated long-
							<br/>term capital gains (losses), from other partnerships, estates, and trusts
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:13px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;">
							<br/>11</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/PartnersShareLongTermGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 11 -->
					<!-- Start Line 12 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>12</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>Capital gain distributions
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:7px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:1px">
							<br/>12</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/CapitalGainDistributions"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 12 -->
					<!-- Start Line 13 -->
					<div style="width:187mm;border-bottom:solid black 2px;font-size:8pt">
						<div class="styLNLeftNumBox">
							<br/>13</div>
						<div class="styLNDesc" style="width:139mm;">
							<br/>
							<span class="styBoldText">Net long-term capital gain or (loss).</span> Combine lines 7 through 12 in column (f).
							  Enter <br/>here and on Form 1065, Schedule K, line 9a or 11
                            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:2px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                                <span style="width:11px"/>.
                            </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;border-bottom-width:0px;">
							<br/>13</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065SchDData/NetLongTermCapitalGainLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;font-size:7pt">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1065.</span>
							<span style="width:12mm;"/>Cat. No. 11393G
                        </div>
						<div style="float:right;">
							<span class="styBoldText">Schedule D (Form 1065) 2010</span>
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<br/>
					<br/>
					<!--
 ************************************************************************************
-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1065SchDData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 31 - Total Section Property Amount Note</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1065SchDData/TotalSectionPropertyAmount/@note"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32 - Net Gain Note</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1065SchDData/NetGain/@note"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Optional Print Solution for repeating data table Part I, Line 1 -->
					<xsl:if test="(count($Form1065SchDData/ShortTermCapitalGainAndLoss) &gt; 4) 
					    and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">
						Form 1065 Schedule D, Part I, Line 1 - Short-Term Capital Gains and Losses-Assets Held One Year 
						or Less:</span>
						<table class="styDepTbl" style="font-size:6.3pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:31mm;font-weight:normal;text-align:left" scope="col">
										<b>(a)</b> Description of property<br/>
										<span style="width:4mm"/>
										(Example: 100 shares<br/>
										<span style="width:12mm"/> of "Z" Co.)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(month, day, year)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(month, day, year)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styDepTblCell" style="width:40mm;font-weight:normal;" scope="col">
										<b>(e)</b> Cost or other basis<br>(see instructions)</br>
									</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchDData/ShortTermCapitalGainAndLoss">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:51mm;font-size:7pt;">
											<xsl:if test="position() = 1">
												<b>1 </b>
											</xsl:if>
											<span style="float:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDescription"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:33mm;font-size:7pt;">
											<span style="width:1mm;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:33mm;font-size:7pt;">
											<span style="width:1mm;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateSoldVarious"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:30mm;font-size:7pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPrice"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:40mm;font-size:6.4pt">
											<span style="float:left">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:30mm;font-size:7pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLoss"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- Optional Print Solution for repeating data table Part II, Line 6 -->
					<xsl:if test="(count($Form1065SchDData/LongTermCapitalGainAndLoss) &gt; 4) 
					    and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">
						Form 1065 Schedule D, Part II, Line 6 - Long-Term Capital Gains and Losses-Assets Held More Than
						One Year:</span>
						<table class="styDepTbl" style="font-size:6.3pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:31mm;text-align:left;font-weight:normal" scope="col">
										<b>(a)</b> Description of property<br/>
										<span style="width:4mm"/>
										(Example: 100 shares<br/>
										<span style="width:12mm"/> of "Z" Co.)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(month, day, year)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(month, day, year)</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styDepTblCell" style="width:40mm;font-weight:normal;" scope="col">
										<b>(e)</b> Cost or other basis<br>(see instructions)</br>
									</th>
									<th class="styDepTblCell" style="width:35mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form1065SchDData/LongTermCapitalGainAndLoss">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:51mm;font-size:7pt">
											<xsl:if test="position() = 1">
												<b>6 </b>
											</xsl:if>
											<span style="float:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDescription"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:33mm;font-size:7pt">
											<span style="width:1mm;"/>
											<xsl:call-template name="PopulateMonth">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>-<xsl:call-template name="PopulateDay">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>-<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:33mm;font-size:7pt">
											<span style="width:1mm;"/>
											<xsl:call-template name="PopulateMonth">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>-<xsl:call-template name="PopulateDay">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>-<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateSoldVarious"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:30mm;font-size:7pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPrice"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:40mm;font-size:6.4pt">
											<span style="float:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:30mm;font-size:7pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLoss"/>
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
</xsl:stylesheet>
