<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
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
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4797"/>
				<!-- Start F4797 -->
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<!-- Form 4797 CSS Styles are located in the template called below -->
					<xsl:call-template name="IRS4797Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form4797">
					<div class="styGenericDiv" style="width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styTBB" style="width:187mm;height:25mm;">
						<div class="styFNBox" style="border-right-width:2px;height:25mm;width:29mm;">
							<div style="padding-top:1mm;">
							Form<span class="styFormNumber">4797</span>
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
								(Also Involuntary Conversions and Recapture
								Amounts <br/>Under Sections 179 and 280F(b)(2))
						    </div>
							<div class="styFBT" style="height:5mm;">
								<img src="{$ImagePath}/4797_Bullet.gif" alt="Bullet"/> Attach to your tax return.
								<br/>
								<img src="{$ImagePath}/4797_Bullet.gif" alt="Bullet"/>	Information about Form 4797 and its separate instructions is at 
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4797" title="Link to IRS.gov">
									<i>www.irs.gov/form4797.</i>
								</a>
								<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:25mm;border-left-width:2px;">
							<div class="styOMB">OMB No. 1545-0184</div>
							<div class="styTY">20<span class="styTYColor">14</span>
							</div>
							<div class="styTYBox" style="border:none;padding-top:3mm;padding-left: 2mm; text-align: left;">Attachment <br/>
							Sequence No. <span class="styBoldText">27</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">
						  Name(s) shown on return<br/>
							<!-- Choice between input name versus Name from 1040, 1041 and 1120 Return Header Filer info -->
							<!--Input Name per schema-->
							<xsl:choose>
								<!-- Name from Form level -->
								<xsl:when test="normalize-space($Form4797Data/BusinessName/BusinessNameLine1Txt) != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form4797Data/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1120/990/1065 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!-- Name from 1041 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
									</xsl:call-template>
									<br/>
								</xsl:when>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:45mm;padding-left:2mm;font-size:7pt;">
							Identifying number<br/>
							<br/>
							<span style="text-align:left;font-weight:normal;">
								<!-- Choice between input EIN versus Missing EIN against 1040, 1041 and 1120 Return Header Filer Info -->
								<!--Input EIN versus Missign EIN per schema-->
								<xsl:choose>
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
										<!--Choice from 1040, 1041 and 1120 return headers-->
										<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$RtnHdrData/Filer/SSN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">SSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$RtnHdrData/Filer/EIN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">EIN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<!--it should not have missing EIN Reason code in the Return Header Filer Info-->
												<!--<xsl:call-template name="PopulateReturnHeaderFiler">
										  <xsl:with-param name="TargetNode">MissingEINReasonCd</xsl:with-param>
									    </xsl:call-template>-->
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Start Line 1 -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styBB" style="border-bottom-width:2px;width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">1</div>
							<div class="styLNDesc" style="width:145mm;">
							Enter the gross proceeds from sales or exchanges reported to you for 2014 on Form(s) 1099-B or 
						  1099-S (or substitute statement) that you are including on line 2, 10, or 20 (see instructions)
							<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.........</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom:0;">1</div>
							<div class="styIRS4797LNAmountBoxSmall" style="height:8mm;padding-top:4mm;border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/CurrentYearGrossProceedsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 1 -->
						<!-- BEGIN PART I TITLE -->
						<div class="styBB" style="width:187mm;height:8mm;">
							<div class="styPartName" style="height:4mm;">Part I</div>
							<div class="styPartDesc" style="float:left;width:167mm;"> Sales or Exchanges of Property Used in a Trade or Business and
						  Involuntary Conversions From Other Than Casualty or Theft&#151;Most Property Held More Than 1 Year
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
							<xsl:attribute name="class"><xsl:choose><xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when><xsl:otherwise>styTableContainer</xsl:otherwise></xsl:choose></xsl:attribute>
							<xsl:attribute name="style"><xsl:choose><xsl:when test="($Print = $Separated)">height:auto;clear:all;</xsl:when><xsl:otherwise>height:auto;border-bottom:0;</xsl:otherwise></xsl:choose></xsl:attribute>
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
											<b>(a)</b> Description of property</th>
										<th class="styTableCellHeader" style="width:16mm;font-weight:normal;" scope="col">
											<b>(b)</b> Date acquired<br/>(mo., day, yr.)</th>
										<th class="styTableCellHeader" style="width:16mm;font-weight:normal;" scope="col">
											<b>(c)</b> Date sold<br/>(mo., day, yr.)</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(d)</b> Gross sales<br/>price</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(e)</b> Depreciation<br/>allowed<br/>or allowable since<br/>acquisition</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col">
											<b>(f)</b> Cost or other<br/>basis, plus<br/>improvements and<br/>expense of sale</th>
										<th class="styTableCellHeader" style="width:30mm;font-weight:normal;border-right:0;" scope="col">
											<b>(g) Gain or (loss)</b>
											<br/> Subtract (f) from the sum of (d) and (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody style="border:1px solid black;height:auto;clear:all;">
									<xsl:for-each select="$Form4797Data/PropertySaleOrExchange">
										<xsl:if test="($Print != $Separated) or (count($Form4797Data/PropertySaleOrExchange) &lt;= 4) ">
											<tr>
												<td class="styTableCell" style="width:4mm;text-align:right;border-right:0;font-weight:bold;" scope="col">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">
													width:4mm;text-align:right;border-right-width:0px;font-weight:bold;
												</xsl:attribute>
													</xsl:if>
													<span class="styTableCellPad"/>
													<xsl:if test="position() = 1"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">
													text-align:left;width:30mm;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">
													width:16mm;
												</xsl:attribute>
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
														<xsl:attribute name="style">
													width:16mm;
												</xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
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
														<xsl:attribute name="style">
													width:30mm;
												</xsl:attribute>
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
														<xsl:attribute name="style">
													width:30mm;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">
													width:30mm;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;border-right:0;">
													<xsl:if test="position() = last()">
														<xsl:attribute name="style">
													width:30mm;border-right:0;
												</xsl:attribute>
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
													<xsl:attribute name="style">
													border-top:0;width:4mm;text-align:right;border-right:0;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;text-align:left;width:30mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;width:16mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;width:16mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;text-align:right;width:30mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;text-align:right;width:30mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;text-align:right;width:30mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:30mm;border-right:0;">
												<xsl:if test="((count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													border-top:0;width:30mm;border-right:0;
												</xsl:attribute>
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
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">3</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Gain, if any, from Form 4684, line 39 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainForm4684Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 3 -->
						<!-- Start Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">4</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Section 1231 gain from installment sales from Form 6252, line 26 or 37 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainInstallmentSalesFrm6252Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 4 -->
						<!-- Start Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">5</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Section 1231 gain or (loss) from like-kind exchanges from Form 8824 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainLossForm8824Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 5 -->
						<!-- Start Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">6</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Gain, if any, from line 32, from other than casualty or theft </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:2px;">6</div>
							<div class="styIRS4797LNAmountBoxSmall" style="border-bottom-width:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/GainOthThanCasualtyOrTheftAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 6 -->
						<!-- Start Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">7</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Combine lines 2 through 6.  Enter the gain or (loss) here and on the appropriate line as follows: </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.....</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalPropertyGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;margin-left: 1mm;"/>
							<div class="styLNDesc" style="width:145mm;height:11mm;">
								<span class="styBoldText">Partnerships (except electing large partnerships) and S corporations.</span>
							  Report the gain or (loss) following the instructions for 
							  Form 1065, Schedule K, line 10, or Form 1120S, Schedule K, line 9.  Skip lines 8, 9, 11, and 12 below.
						</div>
							<div class="styShading" style="border-left: 1px solid black; width:33mm;height:11mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:14mm;margin-left: 1mm;"/>
							<div class="styLNDesc" style="width:145mm;height:14mm;">
								<span class="styBoldText">Individuals, partners, S corporation shareholders, and all others.</span> 
							  If line 7 is zero or a loss, enter the amount from line 7 on line 11 below and skip lines 8 and 9. If line
							  7 is a gain and you did not have any prior year section 1231 losses, or they were recaptured in an 
							  earlier year, enter the gain from line 7 as a long-term capital gain on the Schedule D filed with your return 
							  and skip lines 8, 9, 11, and 12 below.</div>
							<div class="styShading" style="border-left: 1px solid black; width:33mm;height:14mm;"/>
						</div>
						<!-- End Line 7 -->
						<!-- Start Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">8</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;">Nonrecaptured net section 1231 losses from prior years (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.75mm;border-bottom-width:2px;">8</div>
							<div class="styIRS4797LNAmountBoxSmall" style="height:4.75mm;border-bottom-width:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NonrecapturedNet1231LossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 8 -->
						<!-- Start Line 9 -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBox" style="margin-left: 1mm;">9</div>
							<div class="styLNDesc" style="width:145mm;">
						  Subtract line 8 from line 7. If zero or less, enter -0-. If line 9 is zero, enter the gain from line 7
						  on line 12 below. If line 9 is more than zero, enter the amount from line 8 on line 12 below 
						  and enter the gain from line 9 <span style="float:left;">as a long-term capital gain on the Schedule D  filed with your 
						  return (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">........</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8mm;height:11mm;padding-top:7mm">9</div>
							<div class="styIRS4797LNAmountBoxSmall" style="height:11mm;border-bottom-width:0px;padding-top:8mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 9 -->
						<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc">Ordinary Gains and Losses <span style="font-weight:normal">(see instructions)</span>
							</div>
						</div>
						<!-- END PART II TITLE -->
						<!-- Start Line 10 -->
						<div class="styBB" style="width:187mm;height:4mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDesc" style="width:172mm;float:left;">Ordinary gains and losses not included on lines 11 through 16
						  (include property held 1 year or less):
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
							<xsl:attribute name="class"><xsl:choose><xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when><xsl:otherwise>styTableContainer</xsl:otherwise></xsl:choose></xsl:attribute>
							<xsl:attribute name="style"><xsl:choose><xsl:when test="($Print = $Separated)">height:auto;clear:all;</xsl:when><xsl:otherwise>height:auto;border-bottom:0;</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--						<div class="styTableContainer" style="height:auto;border-bottom:0;" id="OGLctn">
-->
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
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:1mm;text-align:left;border-right:0;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:34mm;text-align:left;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">
													border-bottom:1px solid blackwidth:34mm;text-align:left;
												</xsl:attribute>
													</xsl:if>
													<span style="width:3px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc "/>
													</xsl:call-template>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:16mm;
												</xsl:attribute>
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
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:16mm
												</xsl:attribute>
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
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:30mm;text-align:right;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:30mm;text-align:right;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:30mm;text-align:right;
												</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/OrdinaryGainLoss) != 4)">
														<xsl:attribute name="style">
													border-bottom:1px solid black;width:30mm;text-align:right;border-right:0;
												</xsl:attribute>
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
													<xsl:attribute name="style">
													width:34mm;text-align:left;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:16mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style=";width:16mm;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:16mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:30mm;text-align:right;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:30mm;width:30mm;text-align:right;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:30mm;text-align:right;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;border-right:0;">
												<xsl:if test="((count($Form4797Data/OrdinaryGainLoss) &gt; 4) and ($Print = $Separated))">
													<xsl:attribute name="style">
													width:30mm;text-align:right;border-right:0;
												</xsl:attribute>
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
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Loss, if any, from line 7 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">............................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 11 -->
						<!-- Start Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">12</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Gain, if any, from line 7 or amount from line 8, if applicable </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/PropGainNonrecapturedLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 12 -->
						<!-- Start Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Gain, if any, from line 31 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">...........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt "/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 13 -->
						<!-- Start Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Net gain or (loss) from Form 4684, lines 31 and 38a 
							</span>
								<!--Dotted Line-->
								<div style="float:right;">
									<span class="styDotLn" style="padding-right:3mm;">................</span>
									<span style="width: 10mm;border-bottom:1 solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PassiveActivityLossLiteralCd"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styIRS4797LNAmountBoxSmall" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainLossForm4684Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 14 -->
						<!-- Start Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Ordinary gain from installment sales from Form 6252, line 25 or 36 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">..............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdnryGainInstalSaleFrm6252Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 15 -->
						<!-- Start Line 16-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Ordinary gain or (loss) from like-kind exchanges from Form 8824 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">...............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OrdinaryGainLossForm8824Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 16 -->
						<!-- Start Line 17-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styLNDesc" style="width:146mm;">
								<span style="float:left;">Combine lines 10 through 16 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">..........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styIRS4797LNAmountBoxSmall">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 17 -->
						<!-- Start Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:7.3mm;">18</div>
							<div class="styLNDesc" style="width:145mm;height:7.3mm;">
						  For all except individual returns, enter the amount from line 17 on the appropriate line 
						  of your return and skip lines a and b below. For individual returns, complete lines a and b below:
						</div>
							<div style="float:right;">
								<div class="styShading" style="border-left: 1px solid black; width:33mm;height:7.5mm;"/>
							</div>
						</div>
						<!-- Start Line 18a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">a</div>
							<div class="styLNDesc" style="width:145mm;height:12mm;">
						  If the loss on line 11 includes a loss from Form 4684,
						  line 35, column (b)(ii), enter that part of the loss here. Enter the part of the loss from income-producing property
						  on Schedule A (Form 1040), line 28, and the part  of the loss  from property used as an employee on Schedule A (Form 1040), line 23.
						  Identify as from "Form  4797, line 18a."  See instructions  
							<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">..............................</div>
							</div>
							<div style="float:right;">
								<div class="styShading" style="height:8mm;width:33mm;;border-left: 1px solid black;"/>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="height:5mm;width:8mm;padding-top:1.5mm;">18a</div>
								<div class="styIRS4797LNAmountBoxSmall" style="height:5mm;padding-top:1.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4797Data/Form4684LossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Start Line 18b -->
						<div class="styBB" style="border-bottom-width:2px;width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
							<div class="styLNDesc" style="height:8mm;width:146mm;">Redetermine the gain or (loss) on line 17 excluding the loss, if any, 
							on line 18a. Enter here and on Form 1040,
							<span style="float:left;">line 14 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.................................</div>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4mm;border-bottom:0;">18b</div>
							<div class="styIRS4797LNAmountBoxSmall" style="height:8mm;padding-top:4mm;border-bottom:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/OtherGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 18 -->
						<!-- Page Break and Footer-->
						<div class="styGenericDiv" style="width:187mm;padding-top:0;">
							<div style="float:left;">
								<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
								<span style="width:20mm;"/>                        
								Cat. No. 13086I
						</div>
							<div style="float:right;">
								<span style="width:80px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">4797</span> (2014)
						</div>
						</div>
						<!-- END Page Break and Footer-->
					</div>
					<p style="page-break-before: always"/>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!--Begin Page 2 -->
						<!-- Page Header -->
						<div class="styTBB" style="width:187mm;padding-top:.5mm;">
							<div style="float:left;">Form 4797 (2014)<span style="width:148mm;"/>
							</div>
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</div>
						</div>
						<!-- END Page Header -->
						<!-- BEGIN PART III TITLE -->
						<div class="styBB" style="width:187mm;border-bottom:0;">
							<div class="styPartName" style="height:4mm;">Part III</div>
							<div class="styPartDesc" style="float:left;width:167mm;">Gain From Disposition of Property Under Sections 1245, 1250,
						  1252, 1254, and 1255<br/>
							</div>
							<div class="styBB" style="width:187mm;height:4mm;">
								<div class="styPartDesc" style="float:left;width:182mm;font-weight:normal;padding-left:17mm;">(see instructions)
							
						<div class="styGenericDiv" style="float:right;width:1mm;">
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="containerID" select=" 'GDPctn' "/>
										</xsl:call-template>
										<!-- end button display logic -->
									</div>
								</div>
							</div>
						</div>
						<!-- END PART III TITLE -->
						<!-- BEGIN PART III Line 19 TABLE -->
						<div id="GDPctn">
							<xsl:attribute name="class"><xsl:choose><xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when><xsl:otherwise>styTableContainer</xsl:otherwise></xsl:choose></xsl:attribute>
							<xsl:attribute name="style"><xsl:choose><xsl:when test="($Print = $Separated)">height:auto;clear:all;</xsl:when><xsl:otherwise>height:auto;border-bottom:0;</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--						<div class="styTableContainer" style="height:auto;" id="GDPctn">
-->
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead" style="border:1px solid black;">
									<tr>
										<th class="styTableCellHeader" style="width:6mm;text-align:left;border-right-width:0px;" scope="col">19</th>
										<th class="styTableCellHeader" style="width:148mm;text-align:left;" scope="col">(a)<span class="styNormalText"> 
									  Description of section 1245, 1250, 1252, 1254, or 1255 property:</span>
										</th>
										<th class="styTableCellHeader" style="width:16mm;" scope="col">(b)
									<span class="styNormalText"> Date acquired(mo., day, yr.)</span>
										</th>
										<th class="styTableCellHeader" style="width:17mm;border-right:0;" scope="col">(c)
									<span class="styNormalText"> Date sold(mo., day, yr.)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody style="border:1px solid black;">
									<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
										<xsl:if test="($Print != $Separated) or ((count($Form4797Data/PropertyDispositionGain) &lt;= 4) and ($Print = $Separated))">
											<tr>
												<td class="styTableCell" style="width:6mm;text-align:center;border-right:0;font-weight:bold;" scope="col">
													<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
														<xsl:attribute name="style">
													width:6mm;text-align:center;border-bottom:0;border-right:0;font-weight:bold;
												</xsl:attribute>
													</xsl:if>
													<xsl:number value="position()" format="A"/>
												</td>
												<td class="styTableCell" style="width:148mm;text-align:left;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
														<xsl:attribute name="style">
													width:148mm;text-align:left;border-bottom:0;
												</xsl:attribute>
													</xsl:if>
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellText" style="width:16mm;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
														<xsl:attribute name="style">
													width:16mm;border-bottom:0;
												</xsl:attribute>
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
												<td class="styTableCellText" style="width:17mm;border-right:0;">
													<xsl:if test="(position() = last()) and (count($Form4797Data/PropertyDispositionGain) &lt; 4)">
														<xsl:attribute name="style">
													width:16mm;border-right:0;border-bottom:0;
												</xsl:attribute>
													</xsl:if>
													<span style="width:1px;"/>
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
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="count($Form4797Data/PropertyDispositionGain) &lt; 1 or ((count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="border-bottom:0;
										width:6mm;text-align:center;border-right-width:0px;font-weight:bold;" scope="col">A</td>
											<td class="styTableCell" style="width:148mm;text-align:left;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;border-right:0;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertyDispositionGain) &lt; 2 or ((count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="border-top:1px solid black;border-bottom:0;
										width:6mm;text-align:center;border-right:0;font-weight:bold;" scope="col">B</td>
											<td class="styTableCell" style="width:148mm;text-align:left;border-top:1px solid black;border-bottom:0">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;border-top:1px solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:17mm;border-right:0;border-top:1px solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertyDispositionGain) &lt; 3 or ((count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="border-top:1px solid black;border-bottom:0;
										width:6mm;text-align:center;border-right:0;font-weight:bold;" scope="col">C</td>
											<td class="styTableCell" style="width:148mm;text-align:left;border-top:1px solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:16mm;border-top:1px solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:17mm;border-right:0;border-top:1px solid black;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form4797Data/PropertyDispositionGain) &lt; 4 or ((count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="border-top:1px solid black;border-bottom-width:1px;
										width:6mm;text-align:center;border-right:0;font-weight:bold;" scope="col">
												<xsl:if test="($Print = $Separated)">
													<xsl:attribute name="style">
													border-top:1px solid black;
										width:6mm;text-align:center;border-right:0;font-weight:bold;
												</xsl:attribute>
												</xsl:if>
										D</td>
											<td class="styTableCell" style="border-top:1px solid black;width:148mm;text-align:left;border-bottom:1px solid black;">
												<xsl:if test="($Print = $Separated)">
													<xsl:attribute name="style">
													border-top:1px solid black;width:148mm;text-align:left;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-top:1px solid black;width:16mm;border-bottom-width:1px;">
												<xsl:if test="($Print = $Separated)">
													<xsl:attribute name="style">
													border-top:1px solid black;width:16mm;
												</xsl:attribute>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-top:1px solid black;width:17mm;border-right:0;border-bottom-width:1px;">
												<xsl:if test="($Print = $Separated)">
													<xsl:attribute name="style">
													border-top:1px solid black;width:16mm;border-right:0;
												</xsl:attribute>
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
							<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'GDPctn' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- END PART III Line 19 TABLE -->
						<xsl:if test="count($Form4797Data/PropertyDispositionGain) &gt; 4">
							<div class="styBB" style="width:187mm;">
						  NOTE: Lines 20 through 29 for properties A through D will be displayed in the table immediately below, lines 20 through 29
						  for further properties will be displayed in repeating tables below this table, in groups of 4.
						</div>
						</xsl:if>
						<!--To put HTML without data when the element is missing Ravi Venigalla 10/28/03-->
						<xsl:if test="not($Form4797Data/PropertyDispositionGain)  or ((count($Form4797Data/PropertyDispositionGain) &gt; 4) and ($Print = $Separated))">
							<xsl:if test="(position() mod 4) = 1">
								<xsl:variable name="curPos">
									<xsl:value-of select="position()"/>
								</xsl:variable>
								<xsl:if test="position() != 1">
									<div class="styBB" style="width:187mm;height:4mm;"/>
								</xsl:if>
								<div class="styBB" style="width:187mm;">
									<div class="styLNDesc" style="width:83mm;height:7mm;padding-top:4.5mm;text-align:center;font-weight:bold;">
										<span class="styArialText" style="padding-left:9mm;">These columns relate to the properties on lines 19A through 19D.
									</span>
										<img src="{$ImagePath}/4797_Bullet.gif" alt="Bullet"/>
									</div>
									<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property A</div>
									<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property B</div>
									<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property C</div>
									<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property D</div>
								</div>
								<!-- Start Line 20 -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">20</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span class="stySmallText">
										Gross sales price (<span class="styBoldText">Note:</span>
											<span style="width:4px;"/>
											<span class="styItalicText">See line 1 before completing.</span>)
										</span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;font-size:7pt;text-align:left;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain"/>
											<xsl:with-param name="ShortMessage" select="'true'"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- start of line 21-->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">21</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span style="float:left;">Cost or other basis plus expense of sale </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">...</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start line 22-->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
								  Depreciation (or depletion) allowed or allowable<div class="styDotLn" style="float:right;">.</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start line 23-->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span style="float:left;">Adjusted basis. Subtract line 22 from line 21 </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start line 24-->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span style="float:left;">Total gain. Subtract line 23 from line 20 </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">...</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start line 25-->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span class="styBoldText">If section 1245 property:</span>
									</div>
									<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
								</div>
								<!-- Start line 25a-->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
								  Depreciation allowed or allowable from line 22<div class="styDotLn" style="float:right;">.</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">25a</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start line 25b-->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">b</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 25a </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.....</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">25b</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- End Line 25b -->
								<!-- Start Line 26 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:11mm;">26</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:11mm;">
										<span class="styBoldText">If section 1250 property:</span>
									  If straight line depreciation was used, enter -0- on line 26g, except for a
									  corporation subject to section 291.
								</div>
									<div class="styLNRightNumBoxNBB" style="height:11mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
								</div>
								<!-- Start Line 26a -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span class="stySmallText">Additional depreciation after 1975 (see instructions)</span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">26a</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26b -->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;height:8mm;">b</div>
									<div class="styLNDesc" style="width:66mm;height:8mm;">
									Applicable percentage multiplied by the <span class="styBoldText">smaller</span>
										<span style="float:left;"> of line 24 or line 26a (see instructions) </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">....</div>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">26b</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26c -->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;height:10mm;">c</div>
									<div class="styLNDesc" style="width:66mm;height:11mm;">
								  Subtract line 26a from line 24. If residential rental property
								  <b> or </b> line 24 is not more than line 26a, skip lines 26d and 26e 
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..........</div>
									</div>
									<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26c</div>
									<div class="styLNAmountBoxSmall" style="height:11mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:11mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:11mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:11mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26d -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">d</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span class="stySmallText">Additional depreciation after 1969 and before 1976</span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">26d</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26e -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">e</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 26c or 26d </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">....</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">26e</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26f -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">f</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Sections 291 amount (corporations only) </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">...</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">26f</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 26g -->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">g</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Add lines 26b, 26e, and 26f </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.......</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">26g</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 27 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:14mm;">27</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:14mm;">
										<span class="styBoldText">If section 1252 property:</span>
									Skip this section if you did not dispose of farmland or if this form is being
									completed for a partnership (other than an electing large partnership).
								</div>
									<div class="styLNRightNumBoxNBB" style="height:14mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
								</div>
								<!-- Start Line 27a -->
								<div style="width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Soil, water, and land clearing expenses </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">...</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">27a</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 27b -->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="height:8mm;margin-left: 1mm;">b</div>
									<div class="styLNDesc" style="width:66mm;">
									Line 27a multiplied by applicable percentage 
									<span style="float:left;">(see instructions) </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..........</div>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">27b</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 27c -->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left: 1mm;">c</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 27b </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.....</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">27c</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- End Line 27 -->
								<!-- Start Line 28 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span class="styBoldText">If section 1254 property:</span>
										<br/>
									</div>
									<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
								</div>
								<!-- Start Line 28a -->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left:1mm;height:14mm;">a</div>
									<div class="styLNDesc" style="width:66mm;height:14mm;">
									Intangible drilling and development costs, expenditures for
									development of mines and other natural deposits, mining exploration costs, and 
									<span style="float:left;">depletion (see instructions) </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.......</div>
									</div>
									<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">28a</div>
									<div class="styLNAmountBoxSmall" style="height:14mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:14mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:14mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:14mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 28b -->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left:1mm">b</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 28a </span>
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">.....</div>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;">28b</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- End Line 28 -->
								<!-- Start Line 29 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
									<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
										<span class="styBoldText">If section 1255 property:</span>
										<br/>
									</div>
									<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
								</div>
								<!-- Start Line 29a -->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="margin-left:1mm;height:8mm;">a</div>
									<div class="styLNDesc" style="width:66mm;height:8mm;">
									Applicable percentage of payments excluded from income under section 126 (see instructions) 
										<!--Dotted Line-->
										<div class="styDotLn" style="float:right;">..</div>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29a</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:8mm;">
										<span style="width:4px;"/>
									</div>
								</div>
								<!-- Start Line 29b -->
								<div class="styBB" style="border-bottom-width:2px;width:187mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="margin-left:1mm;">b</div>
									<div class="styLNDesc" style="width:66mm;height:4.5mm;">
										<span class="stySmallText">Enter the <span class="styBoldText">smaller</span> of line 24 or 29a (see instructions)
									</span>
										<div class="styDotLn" style="float:right;">..</div>
									</div>
									<div class="styLNRightNumBoxNBB" style="height:4.5mm;">29b</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
									<div class="styLNAmountBoxSmall" style="height:4.5mm;">
										<span style="width:4px;"/>
									</div>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$Print != $Separated or count($Form4797Data/PropertyDispositionGain) &lt;= 4">
							<!-- PROPERTY DETAILS SECTION (LINES 20 THRU 29) (Repeats) -->
							<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
								<xsl:if test="(position() mod 4) = 1">
									<xsl:variable name="curPos">
										<xsl:value-of select="position()"/>
									</xsl:variable>
									<xsl:if test="position() != 1">
										<div class="styBB" style="width:187mm;height:4mm;"/>
									</xsl:if>
									<div class="styBB" style="width:187mm;">
										<div class="styLNDesc" style="width:83mm;height:7mm;padding-top:4.5mm;padding-left:9mm;text-align:center;font-weight:bold;">
											<span class="styArialText">These columns relate to the properties on lines 19A through 19D.</span>
											<img src="{$ImagePath}/4797_Bullet.gif" alt="Bullet"/>
										</div>
										<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property <xsl:number value="position()" format="A"/>
										</div>
										<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property <xsl:number value="position() + 1" format="A"/>
										</div>
										<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property <xsl:number value="position() + 2" format="A"/>
										</div>
										<div class="styLNAmountBoxNBB" style="width:26mm;height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">Property <xsl:number value="position() + 3" format="A"/>
										</div>
									</div>
									<!-- Start Line 20 -->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">20</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span class="stySmallText">	Gross sales price (<b>Note: </b>
												<span style="width:4px;"/>
												<i>See line 1 before completing.</i>)
											</span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GrossSalesPriceAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GrossSalesPriceAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GrossSalesPriceAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 21-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">21</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span style="float:left;">Cost or other basis plus expense of sale </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">...</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/CostOrOtherBasisExpenseSaleAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 22-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
									  Depreciation (or depletion) allowed or allowable <div class="styDotLn" style="float:right;">.</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationDepletionAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/DepreciationDepletionAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/DepreciationDepletionAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/DepreciationDepletionAllwAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 23-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span style="float:left;">Adjusted basis. Subtract line 22 from line 21 </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">..</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AdjustedBasisAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AdjustedBasisAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AdjustedBasisAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 24-->
									<div class="styBB" style="width:187mm;">
										<div class="styLNLeftNumBox">24</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;">
											<span style="float:left;">Total gain. Subtract line 23 from line 20 </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">...</div>
										</div>
										<div class="styLNRightNumBox">24</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalGainAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/TotalGainAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/TotalGainAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/TotalGainAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 25-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span class="styBoldText">If section 1245 property:</span>
										</div>
										<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									</div>
									<!-- Start Line 25a-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
									  Depreciation allowed or allowable from line 22 <div class="styDotLn" style="float:right;">.</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">25a</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1245DepreciationAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245DepreciationAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245DepreciationAllwAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245DepreciationAllwAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 25b-->
									<div class="styBB" style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">b</div>
										<div class="styLNDesc" style="width:66mm;">
											<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 25a </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.....</div>
										</div>
										<div class="styLNRightNumBox">25b</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1245PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1245PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1245PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1245PropertyAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:11mm;">26</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:11mm;">
											<span class="styBoldText">If section 1250 property:</span>
										If straight line depreciation was used, enter -0- on line 26g, except for a
										corporation subject to section 291.
									</div>
										<div class="styLNRightNumBoxNBB" style="height:11mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:11mm;"/>
									</div>
									<!-- Start Line 26a-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span class="stySmallText">Additional depreciation after 1975 (see instructions)</span>
											<div class="styDotLn" style="float:right;">..</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">26a</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AddnlDepreciationAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciationAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciationAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciationAfter1975Amt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26b-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;height:8mm;">b</div>
										<div class="styLNDesc" style="width:66mm;height:8mm;">
									  Applicable percentage multiplied by the <span class="styBoldText">smaller</span>
											<span style="float:left;"> of line 24 or line 26a (see instructions) </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">....</div>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">26b</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ApplicablePercentageAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplicablePercentageAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplicablePercentageAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplicablePercentageAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26c-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;height:10mm;">c</div>
										<div class="styLNDesc" style="width:66mm;height:11mm;">
										Subtract line 26a from line 24. If residential rental property
										<span class="styBoldText">or</span> line 24 is not more than line 
										<span style="float:left;">26a, skip lines 26d and 26e </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.......</div>
										</div>
										<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">26c</div>
										<div class="styLNAmountBoxSmall" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainLessDeprecAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/GainLessDeprecAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GainLessDeprecAfter1975Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:11mm;padding-top:7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/GainLessDeprecAfter1975Amt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26d-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">d</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span class="stySmallText">Additional depreciation after 1969 and before 1976</span>
											<div class="styDotLn" style="float:right;">..</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">26d</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AddnlDepreciation1969To1976Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/AddnlDepreciation1969To1976Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/AddnlDepreciation1969To1976Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/AddnlDepreciation1969To1976Amt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26e-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">e</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 26c or 26d </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">....</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">26e</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SmllrReducedGainAddnlDeprecAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SmllrReducedGainAddnlDeprecAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SmllrReducedGainAddnlDeprecAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SmllrReducedGainAddnlDeprecAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26f-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">f</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span style="float:left;">Sections 291 amount (corporations only) </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">...</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">26f</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section291Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section291Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section291Amt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section291Amt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 26g-->
									<div class="styBB" style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">g</div>
										<div class="styLNDesc" style="width:66mm;">
											<span style="float:left;">Add lines 26b, 26e, and 26f </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.......</div>
										</div>
										<div class="styLNRightNumBox">26g</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1250PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1250PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1250PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1250PropertyAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 27-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:14mm;">27</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:14mm;">
											<span class="styBoldText">If section 1252 property:</span>
										Skip this section if you did not dispose of farmland or if this form is being
										completed for a partnership (other than an electing large partnership).
									</div>
										<div class="styLNRightNumBoxNBB" style="height:14mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:14mm;"/>
									</div>
									<!-- Start Line 27a-->
									<div style="width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">a</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span style="float:left;">Soil, water, and land clearing expenses </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">...</div>
										</div>
										<div class="styLNRightNumBox" style="height:4.5mm;">27a</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SoilWaterLandClearExpenseAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/SoilWaterLandClearExpenseAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/SoilWaterLandClearExpenseAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/SoilWaterLandClearExpenseAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 27b-->
									<div style="width:187mm;height:8.0mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">b</div>
										<div class="styLNDesc" style="width:66mm;height:8.0mm;">
										Line 27a multiplied by applicable percentage 
										<span style="float:left;">(see instructions) </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">..........</div>
										</div>
										<div class="styLNRightNumBox" style="height:8.0mm;padding-top:4.0mm;">27b</div>
										<div class="styLNAmountBoxSmall" style="height:8.0mm;padding-top:4.0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ApplcblPctSoilWtrClearExpnAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8.0mm;padding-top:4.0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctSoilWtrClearExpnAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8.0mm;padding-top:4.0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctSoilWtrClearExpnAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8.0mm;padding-top:4.0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctSoilWtrClearExpnAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 27c-->
									<div class="styBB" style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left: 1mm;">c</div>
										<div class="styLNDesc" style="width:66mm;">
											<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 27b </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.....</div>
										</div>
										<div class="styLNRightNumBox">27c</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1252PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1252PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1252PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1252PropertyAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 28-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span class="styBoldText">If section 1254 property:</span>
											<br/>
										</div>
										<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									</div>
									<!-- Start Line 28a-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left:1mm;height:14mm;">a</div>
										<div class="styLNDesc" style="width:66mm;height:14mm;">
										Intangible drilling and development costs, expenditures for
										development of mines and other natural deposits, mining exploration costs, and 
									 <span style="float:left;">depletion (see instructions) </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.......</div>
										</div>
										<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">28a</div>
										<div class="styLNAmountBoxSmall" style="height:14mm;padding-top:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntangibleDrillingDevCostAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:14mm;padding-top:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/IntangibleDrillingDevCostAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:14mm;padding-top:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/IntangibleDrillingDevCostAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:14mm;padding-top:10mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/IntangibleDrillingDevCostAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 28b-->
									<div class="styBB" style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left:1mm">b</div>
										<div class="styLNDesc" style="width:66mm;">
											<span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 24 or 28a </span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">.....</div>
										</div>
										<div class="styLNRightNumBox">28b</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1254PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1254PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1254PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1254PropertyAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 29-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
										<div class="styLNDesc" style="margin-left:1mm;width:66mm;height:4.5mm;">
											<span class="styBoldText">If section 1255 property:</span>
											<br/>
										</div>
										<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;"/>
									</div>
									<!-- Start Line 29a-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="margin-left:1mm;height:8mm;">a</div>
										<div class="styLNDesc" style="width:66mm;height:8mm;">
										Applicable percentage of payments excluded from income under section 126 (see
										  instructions) 
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">..</div>
										</div>
										<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29a</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ApplcblPctPaymentExcludedAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/ApplcblPctPaymentExcludedAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctPaymentExcludedAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmall" style="height:8mm;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctPaymentExcludedAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<!-- Start Line 29b-->
									<div class="styBB" style="border-bottom-width:2px;width:187mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="margin-left:1mm;">b</div>
										<div class="styLNDesc" style="width:66mm;height:4.5mm;">
											<span class="stySmallText">Enter the <span class="styBoldText">smaller</span> of line 24 or 29a (see instructions)</span>
											<!--Dotted Line-->
											<div class="styDotLn" style="float:right;">..</div>
										</div>
										<div class="styLNRightNumBoxNBB" style="height:4.5mm;">29b</div>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section1255PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section1255PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1255PropertyAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxSmallNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1255PropertyAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:if>
							</xsl:for-each>
							<!-- END PROPERTY DETAILS SECTION (LINES 20 THRU 29) -->
						</xsl:if>
						<div class="styBB" style="width:187mm;float:left;">
							<div class="styPartDesc" style="width:187mm;float:left;height:4mm;">Summary of Part III Gains. 
							<span style="font-weight:normal;">Complete property columns A through D through line 29b before going to line 30.</span>
							</div>
						</div>
						<!--Start line 30 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">30</div>
							<div class="styLNDesc" style="margin-left:1mm;width:137mm;height:4mm;">
								<span style="float:left;">Total gains for all properties.  Add property columns A through D, line 24 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">...........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">30</div>
							<div class="styLNAmountBox" style="height:4mm;width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalGainsForAllPropertiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 30 -->
						<!-- Start Line 31 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;">31</div>
							<div class="styLNDesc" style="margin-left:1mm;width:137mm;height:4mm;padding-top:0mm;">
								<span style="float:left;">Add property columns A through D,
								lines 25b, 26g, 27c, 28b, and 29b. Enter here and on line 13
								<span style="width:2px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 31 - Total Section Property Amount Note</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt/@notApplicableCd"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">31</div>
							<div class="styLNAmountBox" style="height:4mm;padding-top:0mm;width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/TotalSectionPropertyAmt "/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 31 -->
						<!-- Start Line 32 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">32</div>
							<div class="styLNDesc" style="margin-left:1mm;width:137mm;height:8mm;"> 
						  Subtract line 31 from line 30. Enter the portion from casualty or theft on Form 4684, line 33. Enter the 
						  <span style="float:left;">portion from other than casualty or theft on Form 4797, line 6 
						  <span style="width:1px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 32 - Net Gain Note</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainAmt/@notApplicableCd"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.............</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:3.5mm;">32</div>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:3.5mm;width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4797Data/NetGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End Line 32 -->
						<!-- BEGIN PART IV TITLE -->
						<div class="styBB" style="width:187mm;border-top-width:2px;height:8mm;">
							<div class="styPartName" style="height:4mm;">Part IV</div>
							<div class="styPartDesc">Recapture Amounts Under Sections 179 and 280F(b)(2) When
						  Business Use Drops to 50% or Less <span style="font-weight:normal;">(see instructions)</span>
							</div>
						</div>
						<!-- END PART IV TITLE -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;"/>
							<div class="styLNRightNumBox" style="border-bottom:0;height:8mm;border-left:0;"/>
							<div class="styLNAmountBox" style="border-bottom:0;height:8mm;text-align:center;font-weight:bold;">
							(a) Section <br/> 179
							</div>
							<div class="styLNAmountBox" style="border-bottom:0;height:8mm;text-align:center;font-weight:bold;">
							(b) Section <br/>280F(b)(2)
							</div>
						</div>
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 33 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Sect179DedDepreciationPYAmt) &lt;= 1) and (count($Form4797Data/Sect280DedDepreciationPYAmt) &lt;= 1)) or 
((($Print = $Separated) and  ((count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 1) or (count($Form4797Data/Sect280DedDepreciationPYAmt) &gt; 1))))">
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">33</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;">
											Section 179 expense deduction or depreciation allowable in prior years
											<div class="styDotLn" style="float:right;">...</div>
									</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">33</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect179DedDepreciationPYAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="width:36mm;border-top-width:1px;border-bottom:0;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect280DedDepreciationPYAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">33</div>
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
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">33</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
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
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;">
									</th>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Sect179DedDepreciationPYAmt) &gt;  count($Form4797Data/Sect280DedDepreciationPYAmt) ">
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
									<xsl:when test=" count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; count($Form4797Data/Sect280DedDepreciationPYAmt) ">
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
																<td class="styLNDesc" style="width:102.5mm;">
											Section 179 expense deduction or depreciation allowable in prior years
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
																<td class="styLNLeftNumBox" style="text-align:left;border:none;font-weight:bold;" scope="col">33</td>
																<td class="styLNDesc" style="width:102.5mm;">
											Section 179 expense deduction or depreciation allowable in prior years
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
									<xsl:when test=" count($Form4797Data/Sect179DedDepreciationPYAmt) &gt; count($Form4797Data/Sect280DedDepreciationPYAmt) ">
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
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& END line 33 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 34 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Sect179RcmptDepreciationAmt) &lt;= 1) and (count($Form4797Data/Sect280RcmptDepreciationAmt) &lt;= 1)) or 
((($Print = $Separated) and  ((count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; 1) or (count($Form4797Data/Sect280RcmptDepreciationAmt) &gt; 1))))">
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">34</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;">
Recomputed depreciation (see instructions)
<div class="styDotLn" style="float:right;">...........</div>
									</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; 1))">
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">34</div>
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
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">34</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
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
											<div class="styLNRightNumBox" style="border-top-width:1px;border-bottom:0;">34</div>
											<div class="styLNAmountBox" style="border-top-width:1px;border-bottom:0;">
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
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Sect179RcmptDepreciationAmt) &gt;  count($Form4797Data/Sect280RcmptDepreciationAmt) ">
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
									<xsl:when test=" count($Form4797Data/Sect179RcmptDepreciationAmt) &gt; count($Form4797Data/Sect280RcmptDepreciationAmt) ">
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
																<td class="styLNDesc" style="width:102.5mm;">
Recomputed depreciation (see instructions)
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
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;">34</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;">
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
																<td class="styLNDesc" style="width:102.5mm;">
Recomputed depreciation (see instructions)
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
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& END line 34 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& START line 35 &&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<xsl:choose>
							<xsl:when test=" ((count($Form4797Data/Section179RecaptureAmt) &lt;= 1) and (count($Form4797Data/Sect280RecaptureAmt) &lt;= 1)) or 
((($Print = $Separated) and  ((count($Form4797Data/Section179RecaptureAmt) &gt; 1) or (count($Form4797Data/Sect280RecaptureAmt) &gt; 1))))">
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:8mm;">35</div>
									<div class="styLNDesc" style="margin-left:1mm;width:101.5mm;height:8mm;">
Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
<div class="styDotLn" style="float:right;">......................</div>
									</div>
									<div class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;height:8mm;padding-top:4mm;">35</div>
									<xsl:choose>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Section179RecaptureAmt) &gt; 1))">
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:8mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;height:8mm;padding-top:4mm;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:when test="(($Print = $Separated) and  (count($Form4797Data/Sect280RecaptureAmt) &gt; 1))">
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:8mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage" select="'true'"/>
													<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt"/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;height:8mm;padding-top:4mm;">
												<span class="styTableCellPad"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNAmountBox" style="border-bottom:0;border-top-width:1px;height:8mm;padding-top:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt "/>
												</xsl:call-template>
											</div>
											<div class="styLNAmountBox" style="border-bottom:0;width:36mm;border-top-width:1px;height:8mm;padding-top:4mm;">
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
												<th class="styLNRightNumBox" style="border-bottom:0;border-top-width:1px;border-left-width:1px;height:5mm;width:8mm;"/>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;">
</th>
												<th class="styLNRightNumBoxNBB" style="border-top-width:1px;border-bottom-width:0px;height:5mm;width:32mm;" scope="col">
													<div class="styGenericDiv" style="float:right;width:1mm;border-bottom-width:1px;">
														<!-- button display logic -->
														<xsl:choose>
															<xsl:when test="count($Form4797Data/Section179RecaptureAmt) &gt;  count($Form4797Data/Sect280RecaptureAmt) ">
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
									<xsl:when test=" count($Form4797Data/Section179RecaptureAmt) &gt; count($Form4797Data/Sect280RecaptureAmt) ">
										<div class="styTableContainer" style="height:25.5mm;border-bottom-width:1px;" id="line35TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Section179RecaptureAmt">
														<xsl:if test="($Print != $Separated) or ( count($Form4797Data/Section179RecaptureAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="height:8mm;text-align:left;border:none;font-weight:bold;" scope="col">35</td>
																<td class="styLNDesc" style="width:102.5mm;height:8mm;">
Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
<div class="styDotLn" style="float:right;">......................</div>
																</td>
																<xsl:variable name="Counter35a">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;border-top-width:0px;width:8mm;padding-top:4mm;">35</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Sect280RecaptureAmt[$Counter35a+1]"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;border-top-width:1px;width:8mm;padding-top:4mm;">35</td>
																		<td class="styLNAmountBoxNBB" style="width:32mm;border-top-width:1px;height:8mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;border-top-width:1px;padding-top:4mm;">
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
										<div class="styTableContainer" style="border-bottom-width:1px;" id="line35TPctn">
											<!-- print logic -->
											<xsl:call-template name="SetInitialState"/>
											<!-- end -->
											<table class="styTable" cellspacing="0" style="font-size:7pt;">
												<tfoot/>
												<tbody style="border:1px solid black;">
													<xsl:for-each select="$Form4797Data/Sect280RecaptureAmt">
														<xsl:if test="($Print != $Separated) or (count($Form4797Data/Sect280RecaptureAmt) &lt;= 1)">
															<tr>
																<td class="styLNLeftNumBox" style="height:8mm;text-align:left;border:none;font-weight:bold;" scope="col">35</td>
																<td class="styLNDesc" style="width:102.5mm;height:8mm;">
Recapture amount. Subtract line 34 from line 33. See the instructions for where to report
<div class="styDotLn" style="float:right;">......................</div>
																</td>
																<xsl:variable name="Counter35b">
																	<xsl:value-of select="position() - 1"/>
																</xsl:variable>
																<xsl:choose>
																	<xsl:when test="position()  = 1">
																		<td class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;border-top-width:0px;width:8mm;padding-top:4mm;">35</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt[$Counter35b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="height:8mm;width:32mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="current()"/>
																			</xsl:call-template>
																		</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:1px;width:8mm;height:8mm;padding-top:4mm;">35</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;height:8mm;padding-top:4mm;">
																			<xsl:call-template name="PopulateAmount">
																				<xsl:with-param name="TargetNode" select="$Form4797Data/Section179RecaptureAmt[$Counter35b+1]"/>
																			</xsl:call-template>
																		</td>
																		<td class="styLNAmountBoxNBB" style="border-top-width:1px;width:32mm;height:8mm;padding-top:4mm;">
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
									<xsl:when test=" count($Form4797Data/Section179RecaptureAmt) &gt; count($Form4797Data/Sect280RecaptureAmt) ">
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
						<!-- &&&&&&&&&&&&&&&&&&&&&&&&& END line 35 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- Page Break and Footer-->
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;"/>
<!--						<div class="pageEnd" style="width:187mm;">
-->							<div style="float:right;">
								<span style="width:80px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">4797</span> (2014)
<!--						</div>
-->						</div>
						<!-- END Page Break and Footer-->
						<p style="page-break-before: always"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
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
						<!-- Optional Print Solution for repeating data table Part I, Line 2 -->
						<xsl:if test="(count($Form4797Data/PropertySaleOrExchange) &gt; 4) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle">Form 4797, Part I, Line 2 - Sales or Exchanges of Property Used in a Trade or Business and Involuntary Conversions 
						From Other Than Casualty or Theft - Most Property Held More Than 1 Year:</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">(a) Description of property</th>
										<th class="styDepTblCell" scope="col">(b) Date acquired (mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col">(c) Date sold (mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col">(d) Gross sales price</th>
										<th class="styDepTblCell" scope="col">(e) Depreciation allowed or allowable since acquisition</th>
										<th class="styDepTblCell" scope="col">(f) Cost or other basis, plus improvements and expense of sale</th>
										<th class="styDepTblCell" scope="col">(g) Gain or (loss). Subtract (f) from the sum of (d) and (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form4797Data/PropertySaleOrExchange">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
							<span class="styRepeatingDataTitle">Form 4797, Part II, Line 10 - Ordinary gains and losses not included on lines 11 through 16 (include property held 1 year or less):</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<tbody>
									<xsl:for-each select="$Form4797Data/OrdinaryGainLoss">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
							Form 4797, Part III, Line 19 - Gain From Disposition of Property Under Sections 1245, 1250, 1252, 1254, and 1255:</span>
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<!-- Label the Column Headers -->
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col">
										19 <span style="width:3mm;"/> (a) Description of section 1245, 1250, 1252, 1254, or 1255 property:</th>
										<th class="styDepTblCell" scope="col">(b) Date acquired(mo., day, yr.)</th>
										<th class="styDepTblCell" scope="col">(c) Date sold(mo., day, yr.)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form4797Data/PropertyDispositionGain">
										<tr>
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
							<span class="styRepeatingDataTitle">
							Form 4797, Part III, Lines 20 through 29b - Gain From Disposition of Property Under Sections 1245, 1250, 1252, 1254, and 1255:
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
												<th class="styDepTblCell" scope="col" style="width:154mm;border-right-width:0px;">
												These columns relate to the properties on lines 19A through 19D.</th>
												<th class="styDepTblCell" scope="col" style="width:6mm;border-left-width:0px;"/>
												<th class="styDepTblCell" scope="col" style="width:22mm;">Property <xsl:number value="position()" format="A"/>
												</th>
												<th class="styDepTblCell" scope="col" style="width:22mm;">Property <xsl:number value="position() + 1" format="A"/>
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
												  Gross sales price (<span style="font-weight:bold;padding-right:1mm;">Note:</span>
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
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/CostOrOtherBasisExpenseSaleAmt"/>
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
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-weight:bold;padding-right:1mm;">24</span>
												  Total gain. Subtract line 23 from line 20 
											</td>
												<td class="styDepTblCell" style="font-weight:bold;">24</td>
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
													<span style="font-weight:bold;padding-right:1mm;padding-left:3mm;">a</span>
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
													<b>If section 1250 property: </b> 
													If straight line depreciation was used, enter -0- on line 26g, except for a corporation subject to section 291.
												</td>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
												<td class="styDepTblRow1Cell" style="border-bottom-width:0px"/>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<span style="font-weight:bold;padding-right:1mm;padding-left:3mm;">a</span>
													<span style="float-left;">Additional depreciation after 1975 (see instructions)</span>
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
													Applicable percentage multiplied by the  <b> smaller </b> of line 24 or line 26a (see instructions)
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
													Subtract line 26a from line 24. If residential rental property <b> or </b> line 24 is not more than line 26a, skip lines 26d and 26e 
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26c</td>
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
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/GainLessDeprecAfter1975Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
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
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26d</td>
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
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26e</td>
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
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">26f</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section291Amt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section291Amt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;">
													<div style="font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">g</div>
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
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1250PropertyAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2" style="height:12mm;">
												<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
													<span style="float:left;font-weight:bold;padding-right:2mm;height:12mm;">27</span>
													<b> If section 1252 property: </b> Skip this section if you did not dispose of farmland or if this form
														 is being completed for a partnership (other than an electing large partnership). 
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
													<div style="float:left;">Line 27a multiplied by applicable percentage (see instructions)</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">27b</td>
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
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/ApplcblPctSoilWtrClearExpnAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">c</div>
													<div style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 27b </div>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">27c</td>
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
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/Section1252PropertyAmt"/>
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
													<div style="height:12mm;font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">a</div>
													Intangible drilling and development costs, expenditures for development of mines and other natural deposits, and 
													mining exploration costs (see instructions)
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">28a</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 1]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 2]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form4797Data/PropertyDispositionGain[$curPos + 3]/IntangibleDrillingDevCostAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="text-align:left;border-top-width:0px;border-bottom-width:0px;">
													<div style="font-weight:bold;width:3mm;float:left;padding-right:3mm;padding-left:3mm;">b</div>
													<div style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 28a </div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">28b</td>
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
													<div style="height:8mm;font-weight:bold;padding-right:3mm;padding-left:3mm;width:3mm;float:left;">a</div>
													Applicable percentage of payments excluded from income under section 126 (see instructions)
												</td>
												<td class="styDepTblRow1Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">29a</td>
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
													<div style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 24 or 29a (see instructions)</div>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-weight:bold;vertical-align:bottom;">29b</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Section1255PropertyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblRow2Cell" style="border-top-width:0px;font-size:6pt;text-align:right;vertical-align:bottom;">
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
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 33, Section 179 expense deduction or depreciation allowable in prior years:</span>
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
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 34, Recomputed depreciation (see instructions):</span>
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
							<span class="styRepeatingDataTitle">Form 4797, Part IV, Line 35, Recapture amount. Subtract line 34 from line 33. See the instructions for where to report:</span>
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
						<br/>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- This template was created for the additional data table repeating data elements in lines 33, 34, and 35.  Though these data fields 
       are unrelated to each other, since they are on the same line we will put them in the same table.  This template recursively writes out 
       the data based on the maximum amount of data in the two fields it receives as parameters.-->
	<xsl:template name="PopulateDualTable">
		<xsl:param name="Target1"/>
		<xsl:param name="Target2"/>
		<xsl:param name="maximumCount"/>
		<xsl:param name="counter"/>
		<xsl:if test="$counter &lt;= $maximumCount">
			<tr>
				<!-- Define background colors to the rows -->
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$counter mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<!-- First Column -->
				<td class="styDepTblCell" style="text-align:right;padding-right:35mm;width:93mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Target1[$counter]"/>
					</xsl:call-template>
				</td>
				<!-- Second Column -->
				<td class="styDepTblCell" style="text-align:right;padding-right:35mm;width:93mm;">
					<xsl:call-template name="PopulateAmount">
						<!-- $curPos is apparently a string and not an integer, so adding '+0' converts to an integer, making the statement work correctly. -->
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
</xsl:stylesheet>
