<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc)  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4797Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4797Data" select="$RtnDoc/IRS4797"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form4797Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching  -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4797"/>
				<!-- Start F4797 -->
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
				    <!-- Print Statement -->
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 4797 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS4797Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form4797">
					<div class="styGenericDiv" style="width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styTBB" style="width:187mm;height:25mm;">
						<div class="styFNBox" style="border-right-width:2px;height:25mm;width:29mm;">
							<div style="padding-top:1mm;">
							Form<span class="styFormNumber" style="padding-left:2mm;">4797</span>
								<!--General Dependency Push Pin  -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form4797Data"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:7mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service </span>
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;">
							<div class="styMainTitle" style="padding-top:1mm;">Sales of Business Property</div>
							<div class="styFST" style="height:9mm;font-size:9pt;margin-left:3mm;">
								(Also Involuntary Conversions and Recapture Amounts <br/>Under Sections 179 and 280F(b)(2))
						    </div>
							<div class="styFBT" style="height:5mm;">
								<img src="{$ImagePath}/4797_Bullet.gif" alt="Right Pointing Arrow"/>Attach to your tax return.
								<br/>
								<img src="{$ImagePath}/4797_Bullet.gif" alt="Right Pointing Arrow"/>&#160;Go to 
	                 			  <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4797">
									<i>www.irs.gov/Form4797</i>
								</a> for instructions and the latest information.
								<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:25mm;border-left-width:2px;">
							<div class="styOMB">OMB No. 1545-0184</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div class="styTYBox" style="border:none;padding-top:3mm;padding-left: 2mm; text-align: left;">Attachment <br/>
							Sequence No. <span class="styBoldText">27</span>
							</div>
						</div>
					</div>
					<!--   ************************************************************************************  -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">Name(s) shown on return<br/>
							<!-- Choice between input name versus 
                                      Name from 1040, 1041 and 1120 Return Header 
                                     Filer info -->
							<xsl:choose>
								<!-- Name from Form level -->
								<xsl:when test="normalize-space($Form4797Data/BusinessName/BusinessNameLine1Txt) != '' ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- Name from 1040, 1041 and 1120 Return Header Filer info -->
									<xsl:call-template name="PopulateFilerName">
										<xsl:with-param name="TargetNode" select="$Form4797Data"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:45mm;padding-left:2mm;font-size:7pt;">Identifying number<br/>
							<br/>
							<span style="text-align:left;font-weight:normal;">
								<!-- Choice between input EIN versus Missing EIN against 1040, 1041 and 1120
                                        Return Header Filer Info -->
								<!--Input EIN versus Missign EIN per schema-->
								<xsl:choose>
									<!-- TIN  from Form level -->
									<xsl:when test="normalize-space($Form4797Data/EIN) != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form4797Data/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($Form4797Data/MissingEINReasonCd) != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4797Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<!-- EIN from 1040, 1041 and 1120 Return Header Filer info -->
										<xsl:call-template name="PopulateFilerTIN">
											<xsl:with-param name="TargetNode" select="$Form4797Data"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   ************************************************************************************  -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Start Line 1 -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:8mm;">1</span>
							<span class="styIRS4797LNText" style="height:8mm;width:145mm;">
								Enter the gross proceeds from sales or exchanges reported to you for 2020 on
								Form(s) 1099-B or 1099-S (or substitute statement) that you are including on line 2, 10, or 20. See instructions
								<span class="styIRS4797DotLn">..........</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="float:none;height:8mm;padding-top:4.5mm;border-bottom:0;">1</span>
							<span class="styIRS4797LNAmountBoxSmall" style="height:8mm;padding-top:5mm;border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/CurrentYearGrossProceedsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- End Line 1 -->
						<!-- BEGIN PART I TITLE -->
						<div class="styBB" style="width:187mm"/>
						<div class="styBB" style="width:187mm;height:8mm;">
							<div class="styPartName" style="height:4mm;">Part I</div>
							<div class="styPartDesc" style="float:left;width:167mm;">
								Sales or Exchanges of Property Used in a Trade or Business and Involuntary Conversions From Other Than Casualty or Theft&#151; Most Property Held More Than 1 Year
						        <span class="styNormalText">(see instructions)</span>
							</div>
							<div class="styGenericDiv" style="width:1mm;padding-top:4mm;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form4797Data/PropertySaleOrExchange"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'PSOctn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- END PART I TITLE -->
						<!-- BEGIN PART I TABLE -->
						<div id="PSOctn">
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when>
									<xsl:otherwise>styTableContainer</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">height:auto;clear:all;</xsl:when>
									<xsl:otherwise>height:auto;border-bottom:0;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead" style="border:1px solid black;">
									<tr>
										<th class="styTableCellHeader" style="padding-top:3.5mm;width:4mm;font-size:7pt;border-right-width:0px;padding-left:2.5mm;" scope="col">2
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:29mm;font-weight:normal;" scope="col">
											<b>(a)</b> Description <br/>of property
										</th>
										<th class="styTableCellHeader" style="width:16mm;font-weight:normal;" scope="col">
											<b>(b)</b> Date acquired<br/>(mo., day, yr.)
										</th>
										<th class="styTableCellHeader" style="width:16mm;font-weight:normal;" scope="col">
											<b>(c)</b> Date sold<br/>(mo., day, yr.)
										</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(d)</b> Gross sales<br/>price
										</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(e)</b> Depreciation<br/>allowed<br/>or allowable since<br/>acquisition
										</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(f)</b> Cost or other<br/>basis, plus<br/>improvements and<br/>expense of sale
										</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;border-right:0;" scope="col">
											<b>(g) Gain or (loss)</b><br/> Subtract (f) from the sum of (d) and (e)
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody style="border:1px solid black;height:auto;clear:all;">
									<xsl:for-each select="$Form4797Data/PropertySaleOrExchange">
										<xsl:if test="($Print != $Separated)  or (count($Form4797Data/PropertySaleOrExchange) &lt;= 4) ">
											<tr>
												<td class="styTableCell" style="width:4mm;text-align:right;border-right:0;font-weight:bold;" scope="col">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">width:4mm;text-align:right;border-right-width:0px;font-weight:bold;</xsl:attribute>
													</xsl:if>
													<span class="styTableCellPad"/>
													<xsl:if test="position() = 1"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">text-align:left;width:30mm;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">width:16mm;</xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
													<xsl:if test="AcquiredDt">
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="AcquiredDt"/>
														</xsl:call-template>-<xsl:call-template name="PopulateDay">
															<xsl:with-param name="TargetNode" select="AcquiredDt"/>
														</xsl:call-template>-<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="AcquiredDt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="DateAcquiredInheritedCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">	width:16mm;</xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
													<!-- choice of -->
													<xsl:if test="SoldDt">
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="SoldDt"/>
														</xsl:call-template>-<xsl:call-template name="PopulateDay">
															<xsl:with-param name="TargetNode" select="SoldDt"/>
														</xsl:call-template>-<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="SoldDt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="VariousCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="VariousCd"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<!--*******************2d********************** -->
												<td class="styTableCell" style="width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">	width:30mm;</xsl:attribute>
													</xsl:if>
													<xsl:choose>
														<xsl:when test="GrossSalesPriceAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="GrossSalesPriceCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">width:30mm; </xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">width:30mm; </xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;border-right:0;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">width:30mm;border-right:0; </xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="count($Form4797Data/PropertySaleOrExchange) &lt; 1 or ((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:4mm;text-align:right;border-right:0;font-weight:bold;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:30mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form4797Data/PropertySaleOrExchange"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertySaleOrExchange) &lt; 2 or ((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:4mm;text-align:right;border-right:0;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertySaleOrExchange) &lt; 3 or ((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:4mm;text-align:right;border-right-width:0px;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertySaleOrExchange) &lt; 4 or ((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:4mm;text-align:right;border-right:0;" scope="col">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;width:4mm;text-align:right;border-right:0;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;text-align:left;width:30mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;width:16mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;width:16mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;text-align:right;width:30mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:1;text-align:right;width:30mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;text-align:right;width:30mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;border-right:0;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">border-top:0;width:30mm;border-right:0;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form4797Data/PropertySaleOrExchange"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'PSOctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- END PART I TABLE -->
						<!-- Start Line 3 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">3</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Gain, if any, from Form 4684, line 39
								<span class="styIRS4797DotLn">........................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">3</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainForm4684Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 3 -->
						<!-- Start Line 4 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">4</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Section 1231 gain from installment sales from Form 6252, line 26 or 37
								<span class="styIRS4797DotLn">.............</span>
							</span>
							<span class="styIRS4797LNRightNumBox">4</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainInstallmentSalesFrm6252Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 4 -->
						<!-- Start Line 5 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">5</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Section 1231 gain or (loss) from like-kind exchanges from Form 8824
								<span class="styIRS4797DotLn">..............</span>
							</span>
							<span class="styIRS4797LNRightNumBox">5</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainLossForm8824Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 5 -->
						<!-- Start Line 6 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">6</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Gain, if any, from line 32, from other than casualty or theft 
								<span class="styIRS4797DotLn">.................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">6</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainOthThanCasualtyOrTheftAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 6 -->
						<!-- Start Line 7 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">7</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Combine lines 2 through 6.  Enter the gain or (loss) here and on the appropriate line as follows: 
								<span class="styIRS4797DotLn">......</span>
							</span>
							<span class="styIRS4797LNRightNumBox">7</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalPropertyGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 7 -->
						<!-- Start Line 7 Instructions -->
						<div class="styGenericDiv" style="width:187mm;height:20mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:20mm;"/>
							<span class="styIRS4797LNText" style="width:145mm;">
								<b>Partnerships and S corporations.&#160;&#160;</b>
								Report the gain or (loss) following the instructions for Form 1065, Schedule K, 
								line 10, or Form 1120S, Schedule K, line 9. Skip lines 8, 9, 11, and 12 below.<br/>
								<span style="padding-top:1mm;">
									<b>Individuals, partners, S corporation shareholders, and all others.</b> 
									If line 7 is zero or a loss, enter the amount from line 7 on line 11 below and skip lines 8 
								    and 9. If line 7 is a gain and you didn't have any prior year section 1231 losses, 
								    or they were recaptured in an earlier year, enter the gain from line 7 as a long-term
								    capital gain on the Schedule D filed with your return 
								    and skip lines 8, 9, 11, and 12 below.
							    </span>
							</span>
							<span class="styIRS4797LNAmountBoxSmall" style="width:34mm;height:20mm;background-color:lightgrey;"/>
						</div>
						<!-- End Line 7 Instructions -->
						<!-- Start Line 8 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">8</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Nonrecaptured net section 1231 losses from prior years. See instructions 
								<span class="styIRS4797DotLn">.............</span>
							</span>
							<span class="styIRS4797LNRightNumBox">8</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NonrecapturedNet1231LossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 8 -->
						<!-- Start Line 9 -->
						<div class="styGenericDiv" style="width:187mm;height:10mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:10mm;">9</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Subtract line 8 from line 7. If zero or less, enter -0-. If line 9 is zero, enter the gain 
						        from line 7 on line 12 below. If line 9 is more than zero, enter the amount from line 8
								on line 12 below and enter the gain from line 9 as a long-term capital gain on the 
								Schedule D  filed with your return. See instructions 
								<span class="styIRS4797DotLn">............</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="border-bottom:0;height:10mm;padding-top:6.5mm;">9</span>
							<div class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;height:10mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 9 -->
						<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc">
							Ordinary Gains and Losses <span style="font-weight:normal">(see instructions)</span>
							</div>
						</div>
						<!-- END PART II TITLE -->
						<!-- Start Line 10 -->
						<div class="styBB" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDesc" style="width:172mm;float:left;">
							Ordinary gains and losses not included on lines 11 through 16 (include property held 1 year or less):
					    	</div>
							<div class="styGenericDiv" style="padding-bottom:0;width:1mm;padding-left:1mm;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryGainLoss"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'OGLctn' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<!-- End Line 10 -->
						<!-- BEGIN PART II TABLE -->
						<div id="OGLctn">
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">styGenericDiv </xsl:when>
									<xsl:otherwise>styTableContainer</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">height:auto;clear:all; </xsl:when>
									<xsl:otherwise>height:auto;border-bottom:0; </xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<!--<div class="styTableContainer" style="height:auto;border-bottom:0;" id="OGLctn">-->
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead/>
								<tfoot/>
								<tbody style="border:1px solid black;">
									<xsl:for-each select="$Form4797Data/OrdinaryGainLoss">
										<xsl:if test="($Print != $Separated) or ((count($Form4797Data/OrdinaryGainLoss) &lt;= 4) and ($Print = $Separated))">
											<tr>
												<td class="styTableCellText" style="width:1mm;text-align:left;border-right:0;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">	border-bottom:0; solid black;width:1mm;text-align:left;border-right:0; </xsl:attribute>
													</xsl:if>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:34mm;text-align:left;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid blackwidth:34mm;text-align:left; </xsl:attribute>
													</xsl:if>
													<span style="width:3px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc "/>
													</xsl:call-template>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:16mm; </xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
													<xsl:if test="AcquiredDt">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="AcquiredDt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="DateAcquiredInheritedCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:16mm</xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
													<xsl:if test="SoldDt">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="SoldDt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="VariousCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="VariousCd"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:30mm;text-align:right;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:30mm;text-align:right;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:30mm;text-align:right;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">border-bottom:1px solid black;width:30mm;text-align:right;border-right:0; </xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="count($Form4797Data/OrdinaryGainLoss) &lt; 1 or ((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:34mm;text-align:left;" colspan="2">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryGainLoss"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/OrdinaryGainLoss) &lt; 2 or ((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:34mm;text-align:left;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/OrdinaryGainLoss) &lt; 3 or ((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:34mm;text-align:left;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/OrdinaryGainLoss) &lt; 4 or ((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:34mm;text-align:left;" colspan="2">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:34mm;text-align:left;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:16mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style=";width:16mm;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:16mm;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:30mm;text-align:right;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:30mm;width:30mm;text-align:right; </xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:30mm;text-align:right;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">width:30mm;text-align:right;border-right:0;</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryGainLoss"/>
							<xsl:with-param name="headerHeight" select="0"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'OGLctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- END PART II TABLE -->
						<!-- Start Line 11 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">11</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Loss, if any, from line 7
								<span class="styIRS4797DotLn">............................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">11</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 11 -->
						<!-- Start Line 12 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">12</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Gain, if any, from line 7 or amount from line 8, if applicable
								<span class="styIRS4797DotLn">.................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">12</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/PropGainNonrecapturedLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 12 -->
						<!-- Start Line 13 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">13</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Gain, if any, from line 31
								<span class="styIRS4797DotLn">............................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">13</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 13 -->
						<!-- Start Line 14 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">14</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								<span style="float:left;">Net gain or (loss) from Form 4684, lines 31 and 38a </span>
								<!--Dotted Line-->
								<span style="float:right;">
									<!--09/20/16 WT: Choice for write in literal "PAL" or ... (blank) -->
									<xsl:choose>
										<xsl:when test="$Form4797Data/PassiveActivityLossLiteralCd !=''">
											<span class="styDotLn" style="padding-right:2mm;">................</span>
											<span style="text-decoration: underline;width:10mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form4797Data/PassiveActivityLossLiteralCd"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="styIRS4797DotLn" style="float:right;">...................</span>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
							<span class="styIRS4797LNRightNumBox">14</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainLossForm4684Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 14 -->
						<!-- Start Line 15 -->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">15</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Ordinary gain from installment sales from Form 6252, line 25 or 36
								<span class="styIRS4797DotLn">...............</span>
							</span>
							<span class="styIRS4797LNRightNumBox">15</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdnryGainInstalSaleFrm6252Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 15 -->
						<!-- Start Line 16-->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">16</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Ordinary gain or (loss) from like-kind exchanges from Form 8824
							<span class="styIRS4797DotLn">...............</span>
							</span>
							<span class="styIRS4797LNRightNumBox">16</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryGainLossForm8824Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 16 -->
						<!-- Start Line 17-->
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox">17</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								Combine lines 10 through 16
							<span class="styIRS4797DotLn">..........................</span>
							</span>
							<span class="styIRS4797LNRightNumBox">17</span>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 17 -->
						<!-- Start Line 18 -->
						<div class="styGenericDiv" style="width:187mm;height:7mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:7mm;">18</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								For all except individual returns, enter the amount from line 17 on the appropriate
								line of your return and skip lines a and b below.  For individual returns, complete lines a and b below.
							  </span>
							<span class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;width:34mm;height:7mm;background-color:lightgrey;"/>
						</div>
						<!-- Start Line 18a -->
						<div class="styGenericDiv" style="width:187mm;height:6mm;">
							<span class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;">a</span>
							<span class="styIRS4797LNText" style="width:145mm;">
								If the loss on line 11 includes a loss from Form 4684, line 35, column (b)(ii), enter that part of the
								loss here. Enter the part of the loss from income-producing property on Schedule A (Form 1040),
								line 28. The amount from 
							</span>
							<span class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;width:34mm;height:6.5mm;background-color:lightgrey;"/>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styIRS4797LNLeftNumBox"/>
							<span class="styIRS4797LNText" style="width:145mm;">
								property used as an employee cannot be deducted.  Identify as from "Form 4797, line 18a."  See instructions. 
							<span class="styIRS4797DotLn">..</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="height:4mm;">18a</span>
							<span class="styIRS4797LNAmountBoxSmall" style="height:3.5mm;padding-top:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/Form4684LossAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Start Line 18b -->
						<div class="styGenericDiv" style="width:187mm;border-bottom:1px solid black;">
							<span class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;">b</span>
							<span class="styIRS4797LNText" style="width:145mm;font-size:6.5pt;">
								Redetermine the gain or (loss) on line 17 excluding the loss, if any, on line 18a. 
								Enter here and on Form 1040, line 14 
							</span>
							<span class="styIRS4797LNRightNumBox" style="border-bottom:0;">18b</span>
							<span class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OtherGainLossAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- End Line 18 -->
						<!-- Page Break and Footer-->
						<p>
							<div class="pageEnd" style="width:187mm;padding-top:0mm;border-top-width:1px;">
								<div style="float:left;">
									<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
									<span style="width:13mm;"/>Cat. No. 13086I
                        </div>
								<div style="float:right;">
									<span style="width:40px;"/>
                                Form <span class="styBoldText" style="font-size:8pt;">4797</span> (2020)
                           </div>
							</div>
						</p>
						<!-- END Page Break and Footer-->
						<!--Begin Page 2 -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
						<!-- Aug 25, 2019 Redesign Part III so line 19 - 29b display and repeat in the same group -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
						<!--Begin Page 2 -->
						<!-- Page Header -->
						<div class="styBB" style="width:187mm;padding-top:.5mm;">
							<div style="float:left;">Form 4797 (2020)<span style="width:148mm;border-bottom-width:5mm"/>
							</div>
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;border-bottom-width:1px">2</span>
							</div>
						</div>
						<!-- END Page Header -->
						<!-- BEGIN PART III TITLE -->
						<div class="styNBB" style="width:187mm;">
							<div class="styPartName" style="height:4mm;">Part III</div>
							<div class="styPartDesc" style="float:left;width:167mm;">Gain From Disposition of Property Under Sections 1245, 1250,1252, 1254, and 1255<br/>
							</div>
							<div class="styNBB" style="width:187mm;height:4mm;">
								<div class="styPartDesc" style="float:left;width:182mm;font-weight:normal;padding-left:17mm;">(see instructions)
								</div>
							</div>
						</div>
						<!-- END PART III TITLE -->
						<xsl:choose>
							<xsl:when test="($Print != $Separated) or (count($Form4797Data/PropertyDispositionGain) &lt;= 4)">
								<xsl:call-template name="PopulatePartIIITable"/>
							</xsl:when>
							<xsl:when test="($Print = $Separated) and (count($Form4797Data/PropertyDispositionGain) &gt; 4)">
								<xsl:call-template name="PopulatePartIIIEmptyTable"/>
							</xsl:when>
							<!--
						<xsl:when test="not($Form4797Data/PropertyDispositionGain)">
							<xsl:call-template name="PopulatePartIIIEmptyTable"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulatePartIIIEmptyTable"/>
						</xsl:otherwise>
-->
						</xsl:choose>
						<xsl:if test="not($Form4797Data/PropertyDispositionGain)">
							<xsl:call-template name="PopulatePartIIIEmptyTable"/>
						</xsl:if>
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
						<div class="styPartDesc" style="width:187mm;height:4mm;;text-align:left;border-bottom:1px solid black;padding-left:0;font-weight:normal;">
							<b>Summary of Part III Gains.  </b>  Complete property columns A through D through line 29b before going to line 30.
					</div>
						<!--Start line 30 -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:8mm;padding-top:4.5mm;">30</span>
							<span class="styIRS4797LNText" style="height:8mm;width:145mm;padding-top:4mm;">
							Total gains for all properties.  Add property columns A through D, line 24
							<span class="styIRS4797DotLn">............</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="float:none;height:8mm;padding-top:4.5mm;">30</span>
							<div class="styIRS4797LNAmountBoxSmall" style="height:8mm;padding-top:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalGainsForAllPropertiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 30 -->
						<!-- Start Line 31 -->
						<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
							<span class="styIRS4797LNLeftNumBox" style="padding-top:1.5mm;">31</span>
							<span class="styIRS4797LNText" style="width:145mm;">
							Add property columns A through D, lines 25b, 26g, 27c, 28b, and 29b. Enter here and on line 13
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">
										Line 31 - Total Section Property Amount Note</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt/@notApplicableCd"/>
								</xsl:call-template>
								<span class="styIRS4797DotLn">....</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="height:4.5mm; padding-top:.5mm; float:none;">31</span>
							<div class="styIRS4797LNAmountBoxSmall" style="height:4.5mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 31 -->
						<!-- Start Line 32 -->
						<div class="styGenericDiv" style="width:187mm; height:8mm;">
							<span class="styIRS4797LNLeftNumBox" style="height:8mm;">32</span>
							<span class="styIRS4797LNText" style="height:8mm; width:145mm; padding-top:.5mm;">
						        Subtract line 31 from line 30. Enter the portion from casualty or theft on Form 4684, line 33.
								Enter the portion from other than casualty or theft on Form 4797, line 6 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32 - Net Gain Note</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainAmt/@notApplicableCd"/>
								</xsl:call-template>
								<span class="styIRS4797DotLn">...................</span>
							</span>
							<span class="styIRS4797LNRightNumBox" style="float:none; height:8mm; padding-top:4.5mm; border-bottom:0;">32</span>
							<div class="styIRS4797LNAmountBoxSmall" style="height:8mm;padding-top:5mm;border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 32 -->
						<!--<p style="page-break-before: always"/>-->
						<!-- BEGIN PART IV TITLE -->
						<div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;">
							<div class="styPartName" style="height:4mm;">Part IV</div>
							<div class="styPartDesc">Recapture Amounts Under Sections 179 and 280F(b)(2) When Business Use Drops to 50% or Less <span style="font-weight:normal;">
						             (see instructions)</span>
							</div>
						</div>
						<!-- END PART IV TITLE -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;"/>
							<div class="styLNRightNumBox" style="border-bottom:0;height:8mm;border-left:0;"/>
							<div class="styLNAmountBox" style="border-bottom:0;height:8mm;text-align:center;font-weight:bold;">(a) Section <br/> 179
							</div>
							<div class="styLNAmountBox" style="border-bottom:0;height:8mm;text-align:center;font-weight:bold;">(b) Section <br/>280F(b)(2)
							</div>
						</div>
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 33 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Sect179DedDepreciationPYAmt) &lt;= 1) and 
							(count($Form4797Data/Sect280DedDepreciationPYAmt) &lt;= 1)) or ((($Print = $Separated) and                               ((count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 1) or  (count($Form4797Data/Sect280DedDepreciationPYAmt) &gt; 1))))">
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">33</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;">Section 179 expense deduction or depreciation allowable in prior years
											<div class="styDotLn" style="float:right;">...</div>
									</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) 
										and  (count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">33
											</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top:1;border-bottom:0;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:when test="(($Print = $Separated) 
										and  (count($Form4797Data/Sect280DedDepreciationPYAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">33
											</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:1;">33
											</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:1;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt "/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt"/>
												</xsl:call-template>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styTableContainer" style="height:auto;border-bottom-width:0;">
									<!-- print logic -->
									<!-- end -->
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead" style="border:1px solid black;">
											<tr>
												<th class="styLNLeftNumBox" scope="col" style="height:5mm;width:8mm;"/>
												<th class="styLNDesc" style="height:5mm;width:102.5mm;"/>
												<th class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;border-left-width:1px;height:5mm;width:8mm;"/>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;
												     height:5mm;width:32mm;">
												</th>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;
												        height:5mm;width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Sect179DedDepreciationPYAmt) 
															&gt; count($Form4797Data/Sect280DedDepreciationPYAmt) ">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line33TPctn' "/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line33TPctn' "/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
														<!-- end button display logic -->
													</div>
												</th>
											</tr>
										</thead>
										<tfoot/>
									</table>
								</div>
								<xsl:choose>
									<xsl:when test=" count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 
									count($Form4797Data/Sect280DedDepreciationPYAmt) ">
										<div class="styTableContainer" style="height:25.5mm;border-bottom-width:0;" id="line33TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Sect179DedDepreciationPYAmt">
														<xsl:if test="($Print != $Separated) or ( count($Form4797Data/Sect179DedDepreciationPYAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="text-align:left;border:none;font-weight:bold;" scope="col">33</td>
																<td class="styLNDesc" style="width:102.5mm;">Section 179 expense deduction or depreciation allowable in prior years
										                    	<div class="styDotLn" style="float:right;">...</div>
																</td>
																<xsl:variable name="Counter33a">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;width:8mm;">33</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt[$Counter33a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;">33</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt[$Counter33a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styTableContainer" style="border-bottom-width:0;" id="line33TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Sect280DedDepreciationPYAmt">
														<xsl:if test="($Print != $Separated) or (count($Form4797Data/Sect280DedDepreciationPYAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="text-align:left;border:none;font-weight:bold;" scope="col">33
															</td>
																<td class="styLNDesc" style="width:102.5mm;"> Section 179 expense deduction or depreciation allowable in prior years
											                        <div class="styDotLn" style="float:right;">...</div>
																</td>
																<xsl:variable name="Counter33b">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;width:8mm;height:4.5mm;">33</td>
																		<td class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt[$Counter33b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;">33</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt[$Counter33b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Set Initial Height of Above Table -->
								<xsl:choose>
									<xsl:when test=" count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 
									count($Form4797Data/Sect280DedDepreciationPYAmt) ">
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line33TPctn' "/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280DedDepreciationPYAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line33TPctn' "/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& END line 33 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 34 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Sect179RcmptDepreciationAmt) &lt;= 1) and    
							             (count($Form4797Data/Sect280RcmptDepreciationAmt) &lt;= 1)) or 
                                         ((($Print = $Separated) 
                                         and  ((count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; 1) or    
                                         (count($Form4797Data/Sect280RcmptDepreciationAmt) &gt; 1))))">
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">34</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;">Recomputed depreciation See instructions
                                               <div class="styDotLn" style="float:right;">...........</div>
									</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) 
										and  (count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">
											34</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect280RcmptDepreciationAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:0px;border-bottom:0;">34</div>
											<div class="styLNAmountBox" style="border-top-width:0px;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNRightNumBox" style="border-top-width:0px;border-bottom:0;">34</div>
											<div class="styLNAmountBox" style="border-top-width:0px;border-bottom:0;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt "/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt"/>
												</xsl:call-template>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styTableContainer" style="height:auto;border-bottom-width:0;">
									<!-- print logic -->
									<!-- end -->
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead" style="border:1px solid black;">
											<tr>
												<th class="styLNLeftNumBox" scope="col" style="height:5mm;width:8mm;"/>
												<th class="styLNDesc" style="height:5mm;width:102.5mm;"/>
												<th class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;border-left-width:1px;height:5mm;width:8mm;"/>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;">
												</th>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm; width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Sect179RcmptDepreciationAmt)
															 &gt;  count($Form4797Data/Sect280RcmptDepreciationAmt) ">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line34TPctn' "/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line34TPctn' "/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
														<!-- end button display logic -->
													</div>
												</th>
											</tr>
										</thead>
										<tfoot/>
									</table>
								</div>
								<xsl:choose>
									<xsl:when test=" count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; 
									                            count($Form4797Data/Sect280RcmptDepreciationAmt) ">
										<div class="styTableContainer" style="height:25.5mm;border-bottom-width:0;" id="line34TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Sect179RcmptDepreciationAmt">
														<xsl:if test="($Print != $Separated) or ( count($Form4797Data/Sect179RcmptDepreciationAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="text-align:left;border:none;font-weight:bold;" scope="col">34</td>
																<td class="styLNDesc" style="width:102.5mm;">Recomputed depreciation (see instructions)
                                                               <div class="styDotLn" style="float:right;">...........</div>
																</td>
																<xsl:variable name="Counter34a">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;width:8mm;">34</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt[$Counter34a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;width:8mm;">34</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:0px;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:0px;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt[$Counter34a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styTableContainer" style="border-bottom-width:0;" id="line34TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Sect280RcmptDepreciationAmt">
														<xsl:if test="($Print != $Separated) or (count($Form4797Data/Sect280RcmptDepreciationAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="text-align:left;border:none;font-weight:bold;" scope="col">34</td>
																<td class="styLNDesc" style="width:102.5mm;">Recomputed depreciation (see instructions)
                                                                       <div class="styDotLn" style="float:right;">...........</div>
																</td>
																<xsl:variable name="Counter34b">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;width:8mm;height:4.5mm;">34</td>
																		<td class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt[$Counter34b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;">34</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt[$Counter34b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Set Initial Height of Above Table -->
								<xsl:choose>
									<xsl:when test=" count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; count($Form4797Data/Sect280RcmptDepreciationAmt) ">
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179RcmptDepreciationAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line34TPctn' "/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RcmptDepreciationAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line34TPctn' "/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& END line 34 &&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 35 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Section179RecaptureAmt) &lt;= 1) and 							             (count($Form4797Data/Sect280RecaptureAmt) &lt;= 1)) or ((($Print = $Separated) and  ((count($Form4797Data/Section179RecaptureAmt) &gt; 1) or  (count($Form4797Data/Sect280RecaptureAmt) &gt; 1))))">
								<div class="styBB" style="width:187mm;height:9mm">
									<div class="styLNLeftNumBox">35</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;height:8mm;">
                                               Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
                                               <div class="styDotLn" style="float:right;">......................</div>
									</div>
									<div class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;height:9mm;padding-top:4mm;">35 
									</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Section179RecaptureAmt) &gt; 1))">
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:9mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;height:9mm;padding-top:4mm;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect280RecaptureAmt) &gt; 1))">
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:9mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;height:9mm;padding-top:4mm;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:9mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt "/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;
											height:9mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt"/>
												</xsl:call-template>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styTableContainer" style="height:auto;border-bottom-width:0;">
									<!-- print logic -->
									<!-- end -->
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead" style="border:1px solid black;">
											<tr>
												<th class="styLNLeftNumBox" scope="col" style="height:5mm;width:8mm;"/>
												<th class="styLNDesc" style="height:5mm;width:102.5mm;"/>
												<th class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;border-left-width:1px;
									         			height:5mm;width:8mm;"/>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;
									        			height:5mm;width:32mm;">
												</th>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;
						     						 width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Section179RecaptureAmt) &gt;   
															       count($Form4797Data/Sect280RecaptureAmt) ">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line35TPctn' "/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="1"/>
																	<xsl:with-param name="containerID" select=" 'line35TPctn' "/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
														<!-- end button display logic -->
													</div>
												</th>
											</tr>
										</thead>
										<tfoot/>
									</table>
								</div>
								<xsl:choose>
									<xsl:when test=" count($Form4797Data/Section179RecaptureAmt) &gt; 
									                           count($Form4797Data/Sect280RecaptureAmt) ">
										<div class="styTableContainer" style="height:25.5mm;border-bottom-width:1px;" id="line35TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;float:none">
												<tfoot/>
												<tbody style="border:1px solid black;;float:none">
													<xsl:for-each select="$Form4797Data/Section179RecaptureAmt">
														<xsl:if test="($Print != $Separated) or ( count($Form4797Data/Section179RecaptureAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="height:8mm;text-align:left;border:none;font-weight:bold;float:none" scope="col">35</td>
																<td class="styLNDesc" style="width:102.5mm;height:8mm;float:none">
                                                                      Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
                                                                      <div class="styDotLn" style="float:right;">......................</div>
																</td>
																<xsl:variable name="Counter35a">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px; border-top-width:0px;width:8mm;
                                                                                padding-top:4mm;float:none">35</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt[$Counter35a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="eight:8mm;border-bottom-width:0px;border-top-width:1px; width:8mm;padding-top:4mm;float:none">35</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;height:8mm;
												         						 padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;border-top-width:1px;
																		       padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt[$Counter35a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styTableContainer" style="border-bottom-width:0px;" id="line35TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;float:none">
												<tfoot/>
												<tbody style="border:1px solid black;float:none">
													<xsl:for-each select="$Form4797Data/Sect280RecaptureAmt">
														<xsl:if test="($Print != $Separated) or (count($Form4797Data/Sect280RecaptureAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="height:8mm;text-align:left;border:none;font-weight:bold; float:none;padding-bottom:3.5mm" scope="col">35</td>
																<td class="styLNDesc" style="width:102.5mm;height:8mm;float:none">Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
                                                                     <div class="styDotLn" style="float:right;">......................</div>
																</td>
																<xsl:variable name="Counter35b">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;border-top-width:0px;
																		           width:8mm;padding-top:4mm;float:none">35</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;
																		                 padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt[$Counter35b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;
																		 height:8mm;padding-top:4mm;float:none">35</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;height:8mm;
																		padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt[$Counter35b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;
																		 width:32mm;height:8mm;padding-top:4mm;float:none">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</tbody>
											</table>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Set Initial Height of Above Table -->
								<xsl:choose>
									<xsl:when test="count($Form4797Data/Section179RecaptureAmt) &gt;
									      count($Form4797Data/Sect280RecaptureAmt) ">
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line35TPctn' "/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="SetInitialDynamicTableHeight">
											<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt"/>
											<xsl:with-param name="headerHeight" select="0"/>
											<xsl:with-param name="containerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'line35TPctn' "/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<!-- Page Break and Footer-->
						<div class="styBB" style="width:187mm;clear:all;height:auto;"/>
						<div class="pageEnd" style="width:187mm;">
							<div style="float:right;">
								<span style="width:80px;"/>  
					    		Form <span class="styBoldText" style="font-size:8pt;">4797</span> (2020)
					    	</div>
						</div>
						<!-- END Page Break and Footer-->
						<br class="pageEnd"/>
						<!-- *************************************************************************************************************************** -->
					    <!-- Start Additonal Data Title Bar and Button -->
					    <!-- *************************************************************************************************************************** -->	
						<!-- Additonal Data Title Bar and Button -->
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<br/>
							<br/>
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
								<xsl:with-param name="TargetNode" select="$Form4797Data"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 31 - Total Section Property Amount Note</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt/@notApplicableCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 32 - Net Gain Note</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainAmt/@notApplicableCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
						<!-- END Left Over Table -->
						<!-- *************************************************************************************************************************** -->
						<!-- End Additonal Data Title Bar and Button -->
						<!-- *************************************************************************************************************************** -->		
						<!-- Optional Print Solution for repeating data table Part I, Line 2 -->
						<xsl:if test="(count($Form4797Data/PropertySaleOrExchange) &gt; 4)
						 and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part I, Line 2 - Sales or Exchanges of Property Used in a Trade or Business and Involuntary Conversions From Other Than Casualty or Theft - Most Property Held More Than 1 Year:</span>
							<table class="styDepTbl" style="font-size:7pt;border-bottom:1;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="border-bottom:1;">
										(a) Description of property</th>
										<th class="styDepTblCell" scope="col" style="border-bottom:1;">
										(b) Date acquired (mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col" style="border-bottom:1;">
										(c) Date sold (mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col" style="border-bottom:1;">
										(d) Gross sales price</th>
										<th class="styDepTblCell" scope="col">(e) Depreciation allowed or allowable 
										since acquisition</th>
										<th class="styDepTblCell" scope="col">(f) Cost or other basis, plus
										 improvements and expense of sale</th>
										<th class="styDepTblCell" scope="col">(g) Gain or (loss). Subtract (f) 
										from the sum of (d) and (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form4797Data/PropertySaleOrExchange">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
										        	</xsl:when><xsl:otherwise>styDepTblRow2
										        	</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- First Column -->
											<td class="styDepTblCell" style="text-align:left;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<!-- Second Column -->
											<td class="styDepTblCell" style="text-align:center;width:18mm;font-size:6pt;">
												<xsl:if test="AcquiredDt">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DateAcquiredInheritedCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Third Column -->
											<td class="styDepTblCell" style="text-align:center;width:18mm;font-size:6pt;">
												<xsl:if test="SoldDt">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="VariousCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VariousCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Fourth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:choose>
													<xsl:when test="GrossSalesPriceAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="GrossSalesPriceCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- Fifth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
												</xsl:call-template>
											</td>
											<!-- Sixth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
												</xsl:call-template>
											</td>
											<!-- Seventh Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
						<br/>
						<!-- Optional Print Solution for repeating data table Part II, Line 10 -->
						<xsl:if test="(count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part II, Line 10 - Ordinary gains and losses not included on lines 11 through 16 (include property held 1 year or less):
							 </span>
							<table class="styDepTbl" style="font-size:7pt;">
								<tbody>
									<xsl:for-each select="$Form4797Data/OrdinaryGainLoss">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
										        	</xsl:when><xsl:otherwise>styDepTblRow2
										        	</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- First Column -->
											<td class="styDepTblCell" style="text-align:left;width:30mm;font-size:6pt;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
												<span style="padding-left:4px;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</span>
											</td>
											<!-- Second Column -->
											<td class="styDepTblCell" style="text-align:center;width:16mm;font-size:6pt;">
												<xsl:if test="AcquiredDt">
													<xsl:call-template name="PopulateMonth">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateDay">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DateAcquiredInheritedCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Third Column -->
											<td class="styDepTblCell" style="text-align:center;width:16mm;font-size:6pt;">
												<xsl:if test="SoldDt">
													<xsl:call-template name="PopulateMonth">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateDay">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="VariousCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VariousCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Fourth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
												</xsl:call-template>
											</td>
											<!-- Fifth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
												</xsl:call-template>
											</td>
											<!-- Sixth Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
												</xsl:call-template>
											</td>
											<!-- Seventh Column -->
											<td class="styDepTblCell" style="text-align:right;width:30mm;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
						<br/>
						<!-- Optional Print Solution for repeating data table Part III, Line 19 -->
						<xsl:if test="(count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">
						      	Form 4797, Part III, Line 19 - Gain From Disposition of Property Under Sections 1245, 1250, 1252, 1254, and 1255:
					      	</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">19 
										<span style="width:3mm;"/> (a) Description of section 1245, 1250, 1252, 1254, or 1255 property:</th>
										<th class="styDepTblCell" scope="col">(b) Date acquired(mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col">(c) Date sold (mo., day, yr.)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
						     				    	</xsl:when><xsl:otherwise>styDepTblRow2
						    			    		</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- First Column -->
											<td class="styDepTblCell" style="text-align:left;width:154mm;font-size:6pt;">
												<xsl:number value="position()" format="A"/>
												<span style="width:3mm;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<!-- Second Column -->
											<td class="styDepTblCell" style="text-align:center;width:16mm;font-size:6pt;">
												<xsl:if test="AcquiredDt">
													<xsl:call-template name="PopulateMonth">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateDay">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DateAcquiredInheritedCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!-- Third Column -->
											<td class="styDepTblCell" style="text-align:center;width:16mm;font-size:6pt;">
												<xsl:if test="SoldDt">
													<xsl:call-template name="PopulateMonth">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateDay">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>-<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="SoldDt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="VariousCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VariousCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
						<br/>
						<!-- Repeating vertical table for Part III lines 20 through 29b -->
						<xsl:if test="(count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part III, Lines 20 through 29b - Gain From Disposition of Property Under Sections 1245, 1250, 1252, 1254, and 1255:
					    	</span>
							<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
								<xsl:if test="(position() mod 4) = 1">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<table class="styDepTbl" style="font-size:7pt;">
										<thead class="styTableThead">
											<!-- Label the Column Headers -->
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" scope="col" style="width:154mm;border-right-width:0px;font-size:7pt">
												These columns relate to the properties on lines 19A through 19D.</th>
												<th class="styDepTblCell" scope="col" style="width:6mm;border-left-width:0px;"/>
												<th class="styDepTblCell" scope="col" style="width:22mm;">Property <xsl:number value="position()" format="A"/>
												</th>
												<th class="styDepTblCell" scope="col" style="width:22mm;">
					        							Property <xsl:number value="position() + 1" format="A"/>
												</th>
												<th class="styDepTblCell" scope="col" style="width:22mm;">Property <xsl:number value="position() + 2" format="A"/>
												</th>
												<th class="styDepTblCell" scope="col" style="width:22mm;">Property <xsl:number value="position() + 3" format="A"/>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-weight:bold;padding-right:1mm;">20</span>
												  Gross sales price (<span style="font-weight:bold;padding-right:1mm;">Note:
												  </span>
													<span class="styItalicText">See line 1 before completing</span>.)
												</td>
												<td class="styDepTblCell" style="font-weight:bold;">20</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GrossSalesPriceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GrossSalesPriceAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GrossSalesPriceAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-weight:bold;padding-right:1mm;">21</span>
												  Cost or other basis plus expense of sale 
									    		</td>
												<td class="styDepTblCell" style="font-weight:bold;">21</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/CostOrOtherBasisExpenseSaleAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/	 CostOrOtherBasisExpenseSaleAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/CostOrOtherBasisExpenseSaleAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-weight:bold;padding-right:1mm;">22</span>
												  Depreciation (or depletion) allowed or allowable
											</td>
												<td class="styDepTblCell" style="font-weight:bold;">22</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationDepletionAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/DepreciationDepletionAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/DepreciationDepletionAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/DepreciationDepletionAllwAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-weight:bold;padding-right:1mm;">23</span>
												  Adjusted basis. Subtract line 22 from line 21
										    	</td>
												<td class="styDepTblCell" style="font-weight:bold;">23</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AdjustedBasisAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AdjustedBasisAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AdjustedBasisAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-bottom:0;">
													<span style="font-weight:bold;padding-right:1mm;border-bottom:0;">24</span>
												  Total gain. Subtract line 23 from line 20 
											</td>
												<td class="styDepTblCell" style="font-weight:bold;border-bottom:0;">24</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalGainAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/TotalGainAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/TotalGainAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="text-align:right;font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/TotalGainAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2" style="border: 0 solid black;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="font-weight:bold;padding-right:2mm;">25</span>
													<span style="font-weight:bold;">If section 1245 property:</span>
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<span style="font-weight:bold;padding-right:1mm;padding-left:3mm;">	a</span>
													<span style="float-left;">Depreciation allowed or allowable from line 22</span>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;">25a</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1245DepreciationAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245DepreciationAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245DepreciationAllwAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245DepreciationAllwAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;">
													<span style="font-weight:bold;padding-right:1mm;padding-left:3mm;">b</span>
													<span style="float-left;">Enter the</span>
													<span style="font-weight:bold;">smaller</span> of line 24 or 25a
											</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;">25b</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1245PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1" style="height:12mm;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="float:left;font-weight:bold;padding-right:2mm;height:12mm;">26</span>
													<b>If section 1250 property: </b>If straight line depreciation was used, enter -0- on line 26g, except for 			a corporation subject to section 291.
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<span style="font-weight:bold;padding-right:1mm;padding-left:3mm;">	a</span>
													<span style="float-left;">Additional depreciation after 1975. See instructions.</span>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;">26a</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlDepreciationAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciationAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciationAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciationAfter1975Amt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="height:8mm;text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="height:8mm;float-left;font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">b</div>
													Applicable percentage multiplied by the  <b> smaller </b> of line 24 or line 26a. See instructions.
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26b</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ApplicablePercentageAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplicablePercentageAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplicablePercentageAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplicablePercentageAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="height:8mm;text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="height:8mm;font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">c</div>
													Subtract line 26a from line 24. If residential rental property <b> or </b>line 24 isn't more than line 26a, skip lines 26d and 26e 
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26c
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GainLessDeprecAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GainLessDeprecAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
									      			 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GainLessDeprecAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
									     			 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GainLessDeprecAfter1975Amt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">d</div>
													<div style="float:left;">Additional depreciation after 1969 and before 1976</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26d
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlDepreciation1969To1976Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciation1969To1976Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciation1969To1976Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciation1969To1976Amt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">e</div>
													<div style="float:left;">Enter the smaller of line 26c or 26d</div>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26e
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="SmllrReducedGainAddnlDeprecAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SmllrReducedGainAddnlDeprecAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SmllrReducedGainAddnlDeprecAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SmllrReducedGainAddnlDeprecAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">f</div>
													<div style="float:left;">Sections 291 amount (corporations only)</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26f
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
							     					 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
									     			 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section291Amt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;">
													<div style="font-weight:bold;padding-right:3mm;padding-left:3mm;	width:3mm;float:left;">g</div>
													<div style="float:left;">Add lines 26b, 26e, and 26f </div>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26g</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
										     		 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
								      				 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2" style="height:12mm;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="float:left;font-weight:bold;padding-right:2mm;height:12mm;">27</span>
													<b> If section 1252 property: </b> Skip this section if you didn't dispose of farmland or if this form is being completed for a partnership. 
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<span style="font-weight:bold;padding-right:3mm;padding-left:3mm;">a</span>
													<span style="float-left;">Soil, water, and land clearing expenses</span>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;">27a</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="SoilWaterLandClearExpenseAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SoilWaterLandClearExpenseAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SoilWaterLandClearExpenseAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SoilWaterLandClearExpenseAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">b</div>
													<div style="float:left;">Line 27a multiplied by applicable percentage. See instructions.</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">27b
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
										     		 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;
												       text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">c</div>
													<div style="float:left;">
													Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 27b 
													</div>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">27c
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1252PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1252PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1252PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/	Section1252PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1" style="border: 0 solid black;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="font-weight:bold;padding-right:2mm;">28</span>
													<span style="font-weight:bold;">If section 1254 property: </span>
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="height:12mm;font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">a   
													</div>
												      	Intangible drilling and development costs, expenditures for development of 									      	 mines and other natural deposits, and mining exploration costs. See instructions.
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">28a
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
												         vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
												       vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
												       vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
												      vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">b</div>
													<div style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 28a 
													</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">28b
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1254PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1254PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1254PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1254PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2" style="border: 0 solid black;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="font-weight:bold;padding-right:2mm;">29</span>
													<span style="font-weight:bold;">If section 1255 property: </span>
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="height:8mm;font-weight:bold;padding-right:3mm;
													padding-left:3mm;width:3mm;
													float:left;">a</div>
													Applicable percentage of payments excluded from income under section 126. See instructions.
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">29a
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ApplcblPctPaymentExcludedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctPaymentExcludedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctPaymentExcludedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctPaymentExcludedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">b</div>
													<div style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 29a. See instructions.
													    </div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">29b
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1255PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;
											      	 vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1255PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1255PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1255PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<!--<br/>-->
						<!-- Optional Print Solution for repeating data table Part IV, Line 33, Columns (a) and (b) -->
						<xsl:variable name="colACount">
							<xsl:value-of select="count($Form4797Data/Sect179DedDepreciationPYAmt)"/>
						</xsl:variable>
						<xsl:variable name="colBCount">
							<xsl:value-of select="count($Form4797Data/Sect280DedDepreciationPYAmt)"/>
						</xsl:variable>
						<xsl:variable name="maxCount">
							<xsl:choose>
								<xsl:when test="$colACount &gt; $colBCount">
									<xsl:value-of select="$colACount"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$colBCount"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="(($colACount &gt; 1) or ($colBCount &gt; 1)) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 33, Section 179 expense deduction or depreciation allowable in prior years:
							</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">(a) Section 179</th>
										<th class="styDepTblCell" scope="col">(b) Section 280F(b)(2)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateDualTable">
										<xsl:with-param name="Target1" select="$Form4797Data/Sect179DedDepreciationPYAmt"/>
										<xsl:with-param name="Target2" select="$Form4797Data/Sect280DedDepreciationPYAmt"/>
										<xsl:with-param name="maximumCount" select="$maxCount"/>
										<xsl:with-param name="counter" select="1"/>
									</xsl:call-template>
								</tbody>
							</table>
						</xsl:if>
						<br/>
						<!-- Optional Print Solution for repeating data table Part IV, Line 34, Columns (a) and (b) -->
						<xsl:variable name="col34ACount">
							<xsl:value-of select="count($Form4797Data/Sect179RcmptDepreciationAmt)"/>
						</xsl:variable>
						<xsl:variable name="col34BCount">
							<xsl:value-of select="count($Form4797Data/Sect280RcmptDepreciationAmt)"/>
						</xsl:variable>
						<xsl:variable name="max34Count">
							<xsl:choose>
								<xsl:when test="$col34ACount &gt; $col34BCount">
									<xsl:value-of select="$col34ACount"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$col34BCount"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="(($col34ACount &gt; 1) or ($col34BCount &gt; 1)) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 34, Recomputed depreciation (see instructions):
							</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">(a) Section 179</th>
										<th class="styDepTblCell" scope="col">(b) Section 280F(b)(2)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateDualTable">
										<xsl:with-param name="Target1" select="$Form4797Data/Sect179RcmptDepreciationAmt"/>
										<xsl:with-param name="Target2" select="$Form4797Data/Sect280RcmptDepreciationAmt"/>
										<xsl:with-param name="maximumCount" select="$max34Count"/>
										<xsl:with-param name="counter" select="1"/>
									</xsl:call-template>
								</tbody>
							</table>
						</xsl:if>
						<br/>
						<!-- Optional Print Solution for repeating data table Part IV, Line 35, Columns (a) and (b) -->
						<xsl:variable name="col35ACount">
							<xsl:value-of select="count($Form4797Data/Section179RecaptureAmt)"/>
						</xsl:variable>
						<xsl:variable name="col35BCount">
							<xsl:value-of select="count($Form4797Data/Sect280RecaptureAmt)"/>
						</xsl:variable>
						<xsl:variable name="max35Count">
							<xsl:choose>
								<xsl:when test="$col35ACount &gt; $col35BCount">
									<xsl:value-of select="$col35ACount"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$col35BCount"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="(($col35ACount &gt; 1) or ($col35BCount &gt; 1)) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 35, Recapture amount. Subtract line 34 from line 33. See the instructions for where to report:
				      			</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">(a) Section 179</th>
										<th class="styDepTblCell" scope="col">(b) Section 280F(b)(2)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateDualTable">
										<xsl:with-param name="Target1" select="$Form4797Data/Section179RecaptureAmt"/>
										<xsl:with-param name="Target2" select="$Form4797Data/Sect280RecaptureAmt"/>
										<xsl:with-param name="maximumCount" select="$max35Count"/>
										<xsl:with-param name="counter" select="1"/>
									</xsl:call-template>
								</tbody>
							</table>
						</xsl:if>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- This template was created for the additional data table repeating data elements in lines 33, 34, 
           and 35. Though these data fields are unrelated to each other, since they are on the same 
           l ine we will put them in the same table.  This template recursively writes out the data based on the 
           maximum amount of data in the two fields it receives as parameters.-->
	<xsl:template name="PopulateDualTable">
		<xsl:param name="Target1"/>
		<xsl:param name="Target2"/>
		<xsl:param name="maximumCount"/>
		<xsl:param name="counter"/>
		<xsl:if test="$counter &lt;= $maximumCount">
			<tr>
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$counter mod 2 = 1">styDepTblRow1
			        	</xsl:when><xsl:otherwise>
			             	styDepTblRow2
			        	</xsl:otherwise></xsl:choose></xsl:attribute>
				<!-- First Column -->
				<td class="styDepTblCell" style="text-align:right;padding-right:35mm;width:93mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Target1[$counter]"/>
					</xsl:call-template>
				</td>
				<!-- Second Column -->
				<td class="styDepTblCell" style="text-align:right;padding-right:35mm;width:93mm;">
					<xsl:call-template name="PopulateAmount">
						<!-- $curPos is apparently a string and not an integer, so adding '+0' converts to an integer, 
                               making the statement work correctly. -->
						<xsl:with-param name="TargetNode" select="$Target2[$counter]"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="PopulateDualTable">
				<xsl:with-param name="Target1" select="$Target1"/>
				<xsl:with-param name="Target2" select="$Target2"/>
				<xsl:with-param name="maximumCount" select="$maximumCount"/>
				<xsl:with-param name="counter" select="$counter + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PopulatePartIIITable">
		<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
			<xsl:if test="(position() mod 4) = 1">
				<xsl:variable name="curPos">
					<xsl:value-of select="position()"/>
				</xsl:variable>
				<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
				<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
				<div class="styTableContainer" id="GDPctn" style="width:187mm;border-top:1px solid black;border-bottom:0;">
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
					<!-- Table line 19-->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
					<table class="styTable" cellspacing="0" width="187mm;">
						<thead class="styTableThead" style="width:187mm;font-size:7pt;">
							<tr>
								<th class="styIRS4797LNLeftNumBox" style="height:8mm;padding-top:2.5mm;border-bottom-width:1px;" scope="col">19</th>
								<th class="styIRS4797LNTableCellHeader" style="border-left:0;width:127mm;text-align:left;" scope="col" colspan="4">
													(a) <span style="font-weight:normal;"> Description of section 1245, 1250, 1252, 1254, or 1255 property: </span>
								</th>
								<th class="styIRS4797LNTableCellHeader" style="font-weight:normal;" scope="col">
									<b>(b) </b> Date acquired (mo., day, yr.)
							</th>
								<th class="styIRS4797LNTableCellHeader" style="font-weight:normal;" scope="col">
									<b>(c) </b> Date sold (mo., day, yr.)
							</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:if test="($Print != $Separated) or ((count($Form4797Data/PropertyDispositionGain) &lt;= 4) and ($Print = $Separated))">
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
										<xsl:number value="position()" format="A"/>
									</td>
									<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PropertyDesc"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="AcquiredDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="DateAcquiredInheritedCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="SoldDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="VariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="VariousCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
										<xsl:number value="position() + 1" format="A"/>
									</td>
									<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/PropertyDesc"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AcquiredDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AcquiredDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 1]/DateAcquiredInheritedCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/DateAcquiredInheritedCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SoldDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SoldDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 1]/VariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/VariousCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
										<xsl:number value="position() + 2" format="A"/>
									</td>
									<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/PropertyDesc"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AcquiredDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AcquiredDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 2]/DateAcquiredInheritedCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/DateAcquiredInheritedCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styIRS4797LNDate">
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SoldDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SoldDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 2]/VariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/VariousCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
										<!--														<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
															<xsl:attribute name="style"> width:6mm;text-align:center; border-right:0;font-weight:bold;   </xsl:attribute>
														</xsl:if>-->
										<b>
											<xsl:number value="position() + 3" format="A"/>
										</b>
									</td>
									<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4">
										<!--														<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
															<xsl:attribute name="style">width:129mm;text-align:left;</xsl:attribute>
														</xsl:if>-->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/PropertyDesc"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNDate">
										<!--														<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
															<xsl:attribute name="style">width:26mm;</xsl:attribute>
														</xsl:if>-->
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AcquiredDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AcquiredDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 3]/DateAcquiredInheritedCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/DateAcquiredInheritedCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styIRS4797LNDate">
										<!--														<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
															<xsl:attribute name="style">width:26mm;border-right:0;</xsl:attribute>
														</xsl:if>-->
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SoldDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SoldDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form4797Data/PropertyDispositionGain[$curPos + 3]/VariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/VariousCd"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
					<!-- Table lines 20 through 29 -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
					<table class="styTable" cellspacing="0" width="187mm;">
						<thead class="styTableThead" style="border:1px solid black;width:187mm;">
							<tr style="height:8mm;font-size:7pt;">
								<th class="styLNLeftNumBox" style="height:8mm;border-bottom:1px solid black;border-right:0;" scope="col"/>
								<th class="styIRS4797LNTableCellHeader" style="border-left:0;vertical-align:bottom;width:75mm;" scope="col" colspan="2">
									<span class="styArialText">
														These columns relate to the properties on lines 19A through 19D. 
														<img src="{$ImagePath}/4797_Bullet.gif" alt="Right Pointing Arrow"/>
									</span>
								</th>
								<th class="styIRS4797LNTableCellHeader" scope="col">Property <xsl:number value="position()" format="A"/>
								</th>
								<th class="styIRS4797LNTableCellHeader" scope="col">Property <xsl:number value="position() + 1" format="A"/>
								</th>
								<th class="styIRS4797LNTableCellHeader" scope="col">Property  <xsl:number value="position() + 2" format="A"/>
								</th>
								<th class="styIRS4797LNTableCellHeader" scope="col">Property  <xsl:number value="position() + 3" format="A"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:if test="($Print != $Separated) or ((count($Form4797Data/PropertyDispositionGain) &lt;= 4) and ($Print = $Separated))">
								<!--            *************************************************************************************************************            -->
								<!-- Start Line 20 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">20</td>
									<td class="styIRS4797LNText" style="width:67mm;border:none;font-size:6.5pt;" scope="col">
										Gross sales price (<b>Note: </b>
										<span style="width:4px;"/>
										<i>See line 1 before completing.</i>)
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">20</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GrossSalesPriceAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GrossSalesPriceAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GrossSalesPriceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 21 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">21</td>
									<td class="styIRS4797LNText" scope="col">
														Cost or other basis plus expense of sale
														<span class="styIRS4797DotLn">....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">21</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/CostOrOtherBasisExpenseSaleAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/CostOrOtherBasisExpenseSaleAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/CostOrOtherBasisExpenseSaleAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 22 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">22</td>
									<td class="styIRS4797LNText" scope="col">
														Depreciation (or depletion) allowed or allowable 
														<span class="styIRS4797DotLn">.</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">22</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DepreciationDepletionAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/DepreciationDepletionAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/DepreciationDepletionAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/DepreciationDepletionAllwAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 23 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">23</td>
									<td class="styIRS4797LNText" scope="col">
														Adjusted basis. Subtract line 22 from line 21
														<span class="styIRS4797DotLn">..</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">23</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 24 -->
								<tr style="height:8mm;vertical-align:bottom;">
									<td class="styIRS4797LNLeftNumBox" style="height:8mm;padding-top:4.5mm;border-bottom-width:1px;" scope="col">24</td>
									<td class="styIRS4797LNText" style="border-bottom-width:1px;" scope="col">
														Total gain. Subtract line 23 from line 20 &#160;
														<span class="styIRS4797DotLn">...</span>
									</td>
									<td class="styIRS4797LNRightNumBox" style="height:8mm;padding-top:4.5mm;" scope="col">24</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalGainAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/TotalGainAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/TotalGainAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/TotalGainAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 25 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">25</td>
									<td class="styIRS4797LNText" scope="col">
										<b>If section 1245 property:</b>
									</td>
									<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
								</tr>
								<!-- Start Line 25a -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
									<td class="styIRS4797LNText" scope="col">
														  Depreciation allowed or allowable from line 22 
														<span class="styIRS4797DotLn">..</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">25a</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1245DepreciationAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245DepreciationAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245DepreciationAllwAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245DepreciationAllwAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 25b -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
									<td class="styIRS4797LNText" style="border-bottom-width:1px;" scope="col">
														  Enter the <b> smaller </b> of line 24 or 25a 
														<span class="styIRS4797DotLn">.....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">25b</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1245PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245PropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26 -->
								<tr style="height:10mm;">
									<td class="styIRS4797LNLeftNumBox" style="height:10mm;" scope="col">26</td>
									<td class="styIRS4797LNText" scope="col">
										<b>If section 1250 property: </b>	If straight line depreciation was used, enter -0- on  
														line 26g, except for a corporation subject to section 291.
													</td>
									<td class="styIRS4797LNRightNumBox" style="height:10mm;border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
								</tr>
								<!-- Start Line 26a -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
									<td class="styIRS4797LNText" scope="col">
														  Additional depreciation after 1975. See instructions
													</td>
									<td class="styIRS4797LNRightNumBox" scope="col">26a</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AddnlDepreciationAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciationAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciationAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciationAfter1975Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26b -->
								<tr style="height:8mm;">
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">b</td>
									<td class="styIRS4797LNText" scope="col">
														Applicable percentage multiplied by the <b>smaller</b>
														of line 24 or line 26a. See instructions
														<span class="styIRS4797DotLn">.....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">26b</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ApplicablePercentageAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplicablePercentageAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplicablePercentageAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplicablePercentageAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26c -->
								<tr style="height:10mm;">
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:10mm;" scope="col">c</td>
									<td class="styIRS4797LNText" scope="col">
														Subtract line 26a from line 24. If residential rental property <b>or</b> 
														line 24 isn't more than line 26a, skip lines 26d and 26e 
														<span class="styIRS4797DotLn">..........</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col" style="height:10mm;padding-top:6mm;">26c</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GainLessDeprecAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GainLessDeprecAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GainLessDeprecAfter1975Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GainLessDeprecAfter1975Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26d -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">d</td>
									<td class="styIRS4797LNText" scope="col">
														  Additional depreciation after 1969 and before 1976
													</td>
									<td class="styIRS4797LNRightNumBox" scope="col">26d</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AddnlDepreciation1969To1976Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciation1969To1976Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciation1969To1976Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciation1969To1976Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26e -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">e</td>
									<td class="styIRS4797LNText" scope="col">
														Enter the <b> smaller </b> of line 26c or 26d
														<span class="styIRS4797DotLn">.....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">26e</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SmllrReducedGainAddnlDeprecAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SmllrReducedGainAddnlDeprecAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SmllrReducedGainAddnlDeprecAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SmllrReducedGainAddnlDeprecAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26f -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">f</td>
									<td class="styIRS4797LNText" scope="col">
														Section 291 amount (corporations only)
														<span class="styIRS4797DotLn">...</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">26f</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section291Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section291Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section291Amt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section291Amt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 26g -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">g</td>
									<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Add lines 26b, 26e, and 26f
														<span class="styIRS4797DotLn">.......</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">26g</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1250PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1250PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1250PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1250PropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 27 -->
								<tr style="height:10mm;">
									<td class="styIRS4797LNLeftNumBox" style="height:10mm;" scope="col">27</td>
									<td class="styIRS4797LNText" scope="col">
										<b>If section 1252 property: </b>	Skip this section if you didn't dispose of farmland or
														 if this form is being completed for a partnership.
													</td>
									<td class="styIRS4797LNRightNumBox" style="height:10mm;border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
								</tr>
								<!-- Start Line 27a -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
									<td class="styIRS4797LNText" scope="col">
														Soil, water, and land clearing expenses
														<span class="styIRS4797DotLn">....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">27a</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SoilWaterLandClearExpenseAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SoilWaterLandClearExpenseAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SoilWaterLandClearExpenseAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SoilWaterLandClearExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 27b -->
								<tr style="height:8mm;">
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">b</td>
									<td class="styIRS4797LNText" scope="col">
														Line 27a multiplied by applicable percentage.  See instructions
														<span class="styIRS4797DotLn">............</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">27b</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ApplcblPctSoilWtrClearExpnAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctSoilWtrClearExpnAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctSoilWtrClearExpnAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctSoilWtrClearExpnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 27c -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">c</td>
									<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller</b> of line 24 or 27b 
														<span class="styIRS4797DotLn">.....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">27c</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1252PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1252PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1252PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1252PropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 28 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">28</td>
									<td class="styIRS4797LNText" scope="col">
										<b>If section 1254 property:</b>
									</td>
									<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
								</tr>
								<!-- Start Line 28a -->
								<tr style="height:13mm;">
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:13mm;" scope="col">a</td>
									<td class="styIRS4797LNText" scope="col">
														Intangible drilling and development costs, expenditures for development of mines and 
													   other natural deposits, mining exploration costs, and depletion. See instructions
														<span class="styIRS4797DotLn">........</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col" style="height:13mm;padding-top:9mm;">28a</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="IntangibleDrillingDevCostAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/IntangibleDrillingDevCostAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/IntangibleDrillingDevCostAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/IntangibleDrillingDevCostAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 28b -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
									<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller </b> of line 24 or 28a 
														<span class="styIRS4797DotLn">.....</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col">28b</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1254PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1254PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1254PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1254PropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 29 -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" scope="col">29</td>
									<td class="styIRS4797LNText" scope="col">
										<b>If section 1255 property:</b>
									</td>
									<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
									<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
								</tr>
								<!-- Start Line 29a -->
								<tr style="height:8mm;">
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">a</td>
									<td class="styIRS4797LNText" scope="col">
														Applicable percentage of payments excluded from income under section 126. See instructions
														<span class="styIRS4797DotLn">..</span>
									</td>
									<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">29a</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ApplcblPctPaymentExcludedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctPaymentExcludedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctPaymentExcludedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctPaymentExcludedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Start Line 29b -->
								<tr>
									<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
									<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller	</b> of line 24 or 29a. See instructions
								</td>
									<td class="styIRS4797LNRightNumBox" scope="col">29b</td>
									<td class="styIRS4797LNAmountBoxSmall" scope="col">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Section1255PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1255PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1255PropertyAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4797LNAmountBoxSmall">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1255PropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</xsl:if>
			<xsl:if test="(position() != last()) and ((position() mod 4) = 1)">
				<div class="pageEnd" style="width:187mm;"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PopulatePartIIIEmptyTable">
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
		<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
		<div class="styTableContainer" id="GDPctn" style="width:187mm;border-top:1px solid black;border-bottom:0;">
			<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			<!-- Table line 19-->
			<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			<table class="styTable" cellspacing="0" width="187mm;">
				<thead class="styTableThead" style="width:187mm;font-size:7pt;">
					<tr>
						<th class="styIRS4797LNLeftNumBox" style="height:8mm;padding-top:2.5mm;border-bottom-width:1px;" scope="col">19</th>
						<th class="styIRS4797LNTableCellHeader" style="border-left:0;width:127mm;text-align:left;" scope="col" colspan="4">
													(a) <span style="font-weight:normal;"> Description of section 1245, 1250, 1252, 1254, or 1255 property: </span>
						</th>
						<th class="styIRS4797LNTableCellHeader" style="font-weight:normal;" scope="col">
							<b>(b) </b> Date acquired (mo., day, yr.)
							</th>
						<th class="styIRS4797LNTableCellHeader" style="font-weight:normal;" scope="col">
							<b>(c) </b> Date sold (mo., day, yr.)
							</th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
									A
								</td>
						<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4">
							<xsl:if test="($Print = $Separated)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styIRS4797LNDate"/>
						<td class="styIRS4797LNDate"/>
					</tr>
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
									B
								</td>
						<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4"/>
						<td class="styIRS4797LNDate"/>
						<td class="styIRS4797LNDate"/>
					</tr>
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
									C
								</td>
						<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4"/>
						<td class="styIRS4797LNDate"/>
						<td class="styIRS4797LNDate"/>
					</tr>
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:1mm;border-bottom-width:1px;" scope="col">
									D
								</td>
						<td class="styIRS4797LNText" style="width:127mm;border-bottom-width:1px;" colspan="4"/>
						<td class="styIRS4797LNDate"/>
						<td class="styIRS4797LNDate"/>
					</tr>
				</tbody>
			</table>
			<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			<!-- Table lines 20 through 29 -->
			<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
			<table class="styTable" cellspacing="0" width="187mm;">
				<thead class="styTableThead" style="border:1px solid black;width:187mm;">
					<tr style="height:8mm;font-size:7pt;">
						<th class="styLNLeftNumBox" style="height:8mm;border-bottom:1px solid black;border-right:0;" scope="col"/>
						<th class="styIRS4797LNTableCellHeader" style="border-left:0;vertical-align:bottom;width:75mm;" scope="col" colspan="2"/>
						<th class="styIRS4797LNTableCellHeader" scope="col">Property A</th>
						<th class="styIRS4797LNTableCellHeader" scope="col">Property B</th>
						<th class="styIRS4797LNTableCellHeader" scope="col">Property C</th>
						<th class="styIRS4797LNTableCellHeader" scope="col">Property D</th>
					</tr>
				</thead>
				<tbody>
					<!--            *************************************************************************************************************            -->
					<!-- Start Line 20 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">20</td>
						<td class="styIRS4797LNText" style="width:67mm;border:none;font-size:6.5pt;" scope="col">
										Gross sales price (<b>Note: </b>
							<span style="width:4px;"/>
							<i>See line 1 before completing.</i>)
									</td>
						<td class="styIRS4797LNRightNumBox" scope="col">20</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 21 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">21</td>
						<td class="styIRS4797LNText" scope="col">
														Cost or other basis plus expense of sale
														<span class="styIRS4797DotLn">....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">21</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 22 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">22</td>
						<td class="styIRS4797LNText" scope="col">
														Depreciation (or depletion) allowed or allowable 
														<span class="styIRS4797DotLn">.</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">22</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 23 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">23</td>
						<td class="styIRS4797LNText" scope="col">
														Adjusted basis. Subtract line 22 from line 21
														<span class="styIRS4797DotLn">..</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">23</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 24 -->
					<tr style="height:8mm;vertical-align:bottom;">
						<td class="styIRS4797LNLeftNumBox" style="height:8mm;padding-top:4.5mm;border-bottom-width:1px;" scope="col">24</td>
						<td class="styIRS4797LNText" style="border-bottom-width:1px;" scope="col">
														Total gain. Subtract line 23 from line 20 &#160;
														<span class="styIRS4797DotLn">...</span>
						</td>
						<td class="styIRS4797LNRightNumBox" style="height:8mm;padding-top:4.5mm;" scope="col">24</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 25 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">25</td>
						<td class="styIRS4797LNText" scope="col">
							<b>If section 1245 property:</b>
						</td>
						<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
					</tr>
					<!-- Start Line 25a -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
						<td class="styIRS4797LNText" scope="col">
														  Depreciation allowed or allowable from line 22 
														<span class="styIRS4797DotLn">..</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">25a</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 25b -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
						<td class="styIRS4797LNText" style="border-bottom-width:1px;" scope="col">
														  Enter the <b> smaller </b> of line 24 or 25a 
														<span class="styIRS4797DotLn">.....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">25b</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26 -->
					<tr style="height:10mm;">
						<td class="styIRS4797LNLeftNumBox" style="height:10mm;" scope="col">26</td>
						<td class="styIRS4797LNText" scope="col">
							<b>If section 1250 property: </b>	If straight line depreciation was used, enter -0- on  
														line 26g, except for a corporation subject to section 291.
													</td>
						<td class="styIRS4797LNRightNumBox" style="height:10mm;border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
					</tr>
					<!-- Start Line 26a -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
						<td class="styIRS4797LNText" scope="col">
														  Additional depreciation after 1975. See instructions
													</td>
						<td class="styIRS4797LNRightNumBox" scope="col">26a</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26b -->
					<tr style="height:8mm;">
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">b</td>
						<td class="styIRS4797LNText" scope="col">
														Applicable percentage multiplied by the <b>smaller</b>
														of line 24 or line 26a. See instructions
														<span class="styIRS4797DotLn">.....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">26b</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26c -->
					<tr style="height:10mm;">
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:10mm;" scope="col">c</td>
						<td class="styIRS4797LNText" scope="col">
														Subtract line 26a from line 24. If residential rental property <b>or</b> 
														line 24 isn't more than line 26a, skip lines 26d and 26e 
														<span class="styIRS4797DotLn">..........</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col" style="height:10mm;padding-top:6mm;">26c</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26d -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">d</td>
						<td class="styIRS4797LNText" scope="col">
														  Additional depreciation after 1969 and before 1976
													</td>
						<td class="styIRS4797LNRightNumBox" scope="col">26d</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26e -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">e</td>
						<td class="styIRS4797LNText" scope="col">
														Enter the <b> smaller </b> of line 26c or 26d
														<span class="styIRS4797DotLn">.....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">26e</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26f -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">f</td>
						<td class="styIRS4797LNText" scope="col">
														Section 291 amount (corporations only)
														<span class="styIRS4797DotLn">...</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">26f</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 26g -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">g</td>
						<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Add lines 26b, 26e, and 26f
														<span class="styIRS4797DotLn">.......</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">26g</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 27 -->
					<tr style="height:10mm;">
						<td class="styIRS4797LNLeftNumBox" style="height:10mm;" scope="col">27</td>
						<td class="styIRS4797LNText" scope="col">
							<b>If section 1252 property: </b>	Skip this section if you didn't dispose of farmland or
														 if this form is being completed for a partnership.
													</td>
						<td class="styIRS4797LNRightNumBox" style="height:10mm;border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
					</tr>
					<!-- Start Line 27a -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;" scope="col">a</td>
						<td class="styIRS4797LNText" scope="col">
														Soil, water, and land clearing expenses
														<span class="styIRS4797DotLn">....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">27a</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 27b -->
					<tr style="height:8mm;">
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">b</td>
						<td class="styIRS4797LNText" scope="col">
														Line 27a multiplied by applicable percentage.  See instructions
														<span class="styIRS4797DotLn">............</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">27b</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 27c -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">c</td>
						<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller</b> of line 24 or 27b 
														<span class="styIRS4797DotLn">.....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">27c</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 28 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">28</td>
						<td class="styIRS4797LNText" scope="col">
							<b>If section 1254 property:</b>
						</td>
						<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
					</tr>
					<!-- Start Line 28a -->
					<tr style="height:13mm;">
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:13mm;" scope="col">a</td>
						<td class="styIRS4797LNText" scope="col">
														Intangible drilling and development costs, expenditures for development of mines and 
													   other natural deposits, mining exploration costs, and depletion. See instructions
														<span class="styIRS4797DotLn">........</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col" style="height:13mm;padding-top:9mm;">28a</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 28b -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
						<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller </b> of line 24 or 28a 
														<span class="styIRS4797DotLn">.....</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col">28b</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 29 -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" scope="col">29</td>
						<td class="styIRS4797LNText" scope="col">
							<b>If section 1255 property:</b>
						</td>
						<td class="styIRS4797LNRightNumBox" style="border-bottom:0;height:4mm;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" style="border-bottom:0;" scope="col"/>
					</tr>
					<!-- Start Line 29a -->
					<tr style="height:8mm;">
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;height:8mm;" scope="col">a</td>
						<td class="styIRS4797LNText" scope="col">
														Applicable percentage of payments excluded from income under section 126. See instructions
														<span class="styIRS4797DotLn">..</span>
						</td>
						<td class="styIRS4797LNRightNumBox" scope="col" style="height:8mm;padding-top:4.5mm;">29a</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
					<!-- Start Line 29b -->
					<tr>
						<td class="styIRS4797LNLeftNumBox" style="text-align:right;padding-right:2mm;border-bottom-width:1px;" scope="col">b</td>
						<td class="styIRS4797LNText" scope="col" style="border-bottom-width:1px;">
														Enter the <b>smaller	</b> of line 24 or 29a. See instructions
								</td>
						<td class="styIRS4797LNRightNumBox" scope="col">29b</td>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
						<td class="styIRS4797LNAmountBoxSmall" scope="col"/>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
