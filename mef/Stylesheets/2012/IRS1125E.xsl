<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1125EStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1125EData" select="$RtnDoc/IRS1125E"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1125EData)"/>
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
				<meta name="Description" content="Form IRS1125E"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--  Print Statement -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1125EStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1125E">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<div style="width:187mm;" class="styTBB">
						<div style="width:38mm;height:24.5mm;" class="styFNBox">
							<div style="height:12mm;">Form<span class="styFormNumber">1125-E</span>
								<br/>(December 2012)
							</div>
							<div style="height:11mm;padding-top:5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div style="width:110mm;height:23.5mm;" class="styFTBox">
							<div class="styMainTitle" style="height:10mm;padding-top:1mm;">
							  Compensation of Officers
							</div>
							<div style="height:3.5mm;font-size:7pt;padding-top:.5mm;border:0px;" class="styFST">
								<img src="{$ImagePath}/1125E_Bullet.gif" alt="Bullet Image"/>
								  Attach to Form 1120, 1120-C, 1120-F, 1120-RIC, and 1120-REIT.
							</div>
							<div style="height:3.5mm;font-size:7pt;padding-top:.5mm;border:0px;" class="styFST">
								<img src="{$ImagePath}/1125E_Bullet.gif" alt="Bullet Image"/>Information about Form 1125e and its separate instructions is at
								<a href="http://www.irs.gov/form1125e" title="Link to IRS.gov">
									<i>www.irs.gov/form1125e.</i>
								</a>
							</div>
						</div>
						<div style="width:38mm;height:24.5mm;" class="styTYBox">
							<div style="height:8mm;padding-top:10mm;border-bottom-width:0px;" class="styOMB">
							  OMB No. 1545-2225
							</div>
							<div style="height:8mm;text-align:left;padding-left:1mm;border-bottom-width:0px;padding-top:4mm;" class="styOMB">
								<!--    Attachment <br />Sequence No. <span class="styBoldText">84 </span>-->
							</div>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
							Name<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:49mm;height:4mm;padding-left:2mm;font-weight:normal;font-size:7pt;" class="styEINBox">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<span style="font-weight:normal;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Begin Part I -->
					<div style="width:187mm;" class="styBB">
						<div style="height:4mm;padding-top:2mm;">
							<b>Note. </b>
							Complete Form 1125-E only if total receipts are $500,000 or more.   See instructions for definition of total receipts.
						</div>
						<div class="styGenericDiv" style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1125EData/Officer"/>
								<xsl:with-param name="containerHeight" select="20"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Beginning table -->
					<div id="TPctn" class="styTableContainer">
						<xsl:call-template name="SetInitialState"/>
						<table id="TYTable" name="TYTable" cellspacing="0" class="styTable">
							<thead class="styTableThead" style="border-color:black;font-size: 7pt;">
								<tr>
									<th scope="col" style="width:50mm;font-weight:normal;text-align:center" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(a)</span> Name of officer
									</th>
									<th scope="col" style="width:38mm;border-right-width:1px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(b)</span> Social security number
									</th>
									<th scope="col" style="width:24mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(c)</span> Percent of time devoted to business
									</th>
									<th scope="col" style="width:42mm;font-weight:normal;text-align:center;" class="styTableCellHeader" colspan="2">
									  Percent of stock owned
									</th>
									<th scope="col" style="width:33mm;border-right-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(f)</span> Amount of compensation
									</th>
								</tr>
								<tr>
									<th scope="col" style="width:21mm;font-weight:normal;text-align:center;" class="styTableCellHeader">
										<span class="styBoldText">(d)</span> Common
									</th>
									<th scope="col" style="width:21mm;font-weight:normal;text-align:center;" class="styTableCellHeader">
										<span class="styBoldText">(e)</span> Preferred
									</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:choose>
								<xsl:when test="$Form1125EData/Officer">
									<tbody style="border-color:black;">
										<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form1125EData/Officer) &lt;20))">
											<xsl:for-each select="$Form1125EData/Officer">
												<tr style="vertical-align:bottom;font-size: 7pt; font-weight: normal;">
													<td style="width:50mm;text-align:left;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;=20">
															<xsl:attribute name="style">width:50mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<div style="width:5mm;height:4mm;" class="styGenericDiv">
															<xsl:choose>
																<xsl:when test="position() = 1">
																	<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">1</div>
																</xsl:when>
																<xsl:otherwise>
																	<div class="styLNLeftNumBox" style="padding-left: 2.5mm;"/>
																</xsl:otherwise>
															</xsl:choose>
														</div>
														<div class="styGenericDiv" style="vertical-align:bottom;float:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="NameOfOfficer"/>
															</xsl:call-template>
															<span style="width:1px;"/>
														</div>
													</td>
													<td style="width:38mm;text-align:center;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;=20">
															<xsl:attribute name="style">width:38mm;text-align:center;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SocialSecurityNumber"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:24mm;text-align:right;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;=20">
															<xsl:attribute name="style">width:24mm;text-align:right;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="PercentTimeDevotedToBusiness"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:21mm;border-right-width:1px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 20">
															<xsl:attribute name="style">width:21mm;border-right-width:1px;border-bottom-width:0px;text-align:right;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="PercentCommonStockOwned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:21mm;border-left-width:0px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 20">
															<xsl:attribute name="style">width:21mm;border-right-width:1px;border-bottom-width:0px;text-align:right;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="PercentPreferredStockOwned"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:33mm;border-right-width:0px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 20">
															<xsl:attribute name="style">width:33mm;border-right-width:0px;border-bottom-width:0px;text-align:right;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="AmountOfCompensation"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 1) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index">1</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 2) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 3) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 4) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 5) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 6) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 7) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 8) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 9) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 10) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 11) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 12) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 13) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 14) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 15) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 16) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 17) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 18) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt; 19) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1125EData/Officer)&lt;20) or (($Print=$Separated) and (count($Form1125EData/Officer) &gt;20))">
											<xsl:call-template name="Populateirs1125EemptyCells">
												<xsl:with-param name="index"/>
												<xsl:with-param name="end">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</tbody>
								</xsl:when>
								<xsl:otherwise>
									<tbody style="border-color:black;">
										<xsl:call-template name="Populateirs1125EemptyCells">
											<xsl:with-param name="index">1</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="Populateirs1125EemptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="Populateirs1125EemptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="Populateirs1125EemptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="Populateirs1125EemptyCells">
											<xsl:with-param name="index"/>
											<xsl:with-param name="end">true</xsl:with-param>
										</xsl:call-template>
									</tbody>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1125EData/Officer"/>
								<xsl:with-param name="containerHeight" select="20"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</table>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">2</div>
						<div class="styLNDesc" style="width:145.5mm;">
							<span style="float:left;">Total compensation of officers</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
						</div>
						<div class="styLNAmountBox" style="text-align:right;width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1125EData/TotalCompensationOfOfficers"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">3</div>
						<div class="styLNDesc" style="width:145.5mm;">
							<span style="float:left;">Compensation of officers claimed on Form 1125-A or elesewhere on return</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
						</div>
						<div class="styLNAmountBox" style="text-align:right;width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1125EData/CompensationClmOnF1125AAndElse"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">4</div>
						<div class="styLNDesc" style="width:145.5mm;">
						 Subtract line 3 from line 2. Enter the result here and on Form 1120, page 1, line 12 or the appropriate line of
						 <span style="float:left;"> your tax return</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;text-align:right;width:33mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1125EData/NetCompensationOfOfficers"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:both;">
						<div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions. </div>
						<div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 55989C</div>
						<div style="float:right;" class="styGenericDiv">
							<span class="styBoldText">1125-E</span> (12-2012)</div>
					</div>
					<p class="pageend"/>
					<!-- *********************************************************** -->
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle"> Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1125EData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="($Print = $Separated) and (count($Form1125EData/Officer) &gt;20)">
						<br/>
						<!-- <span class="styRepeatingDataTitle">
						Form 1125E - Inconsistent or Administrative Adjustment Request (AAR) Items
						</span> -->
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styDepTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" style="width:50mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(a)</span> Name of officer
									</th>
									<th scope="col" style="width:38mm;border-right-width:1px;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(b)</span> Social security number
								    </th>
									<th scope="col" style="width:24mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(c)</span> Percent of time devoted to business
								    </th>
									<th scope="col" style="width:42mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" colspan="2">
										Percent of stock owned
								    </th>
									<th scope="col" style="width:33mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(f)</span> Amount of compensation
								    </th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" style="width:21mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell">
										<span class="styBoldText">(d)</span> Common
								    </th>
									<th scope="col" style="width:21mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell">
										<span class="styBoldText">(e)</span> Preferred
								    </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="border-color:black;">
								<xsl:for-each select="$Form1125EData/Officer">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:50mm;text-align:left;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;=20">
												<xsl:attribute name="style">text-align:left;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<div class="styGenericDiv">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfOfficer"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</div>
										</td>
										<td style="width:38mm;text-align:center;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 20">
												<xsl:attribute name="style">text-align:center;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SocialSecurityNumber"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:24mm;text-align:right;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 20">
												<xsl:attribute name="style">text-align:right;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentTimeDevotedToBusiness"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:21mm;border-right-width:1px;text-align:right;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 20">
												<xsl:attribute name="style">text-align:right;border-right-width:1px;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentCommonStockOwned"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:21mm;border-left-width:0px;text-align:right;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 20">
												<xsl:attribute name="style">text-align:right;border-right-width:1px;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentPreferredStockOwned"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:33mm;border-right-width:0px;text-align:right;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 20">
												<xsl:attribute name="style">text-align:right;border-right-width:0px;border-bottom-width:0px;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmountOfCompensation"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- *********************************************************** -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="Populateirs1125EemptyCells">
		<xsl:param name="index"/>
		<xsl:param name="end">false</xsl:param>
		<tr>
			<xsl:if test="($end = 'false')">
				<td class="styTableCell" style="width:50mm;text-align:left;font-weight:bold;font-size: 7pt;">
					<span style="width:3mm;"/>
					<xsl:value-of select="$index"/>
					<span style="width:2mm;"/>
					<span style="font-weight: normal">
						<xsl:if test="($Print=$Separated) and (count($Form1125EData/Officer) &gt;20) and ($index = 1)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form1125EData/Officer/NameOfOfficer"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td style="width:38mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:21mm;border-right-width:1px;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:21mm;border-left-width:0px;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm;border-right-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
			<xsl:if test="($end != 'false')">
				<td style="width:50mm;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:38mm;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm;border-bottom-width:0px;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:21mm;border-right-width:1px;border-bottom-width:0px;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:21mm;border-left-width:0px;border-bottom-width:0px;font-size: 7pt;" class="styTableCell">%
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm;border-right-width:0px;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
</xsl:stylesheet>
