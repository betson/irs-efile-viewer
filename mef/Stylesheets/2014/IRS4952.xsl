<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:include href="PopulateTemplate.xsl"/>

	<xsl:include href="CommonPathRef.xsl"/>

	<xsl:include href="AddHeader.xsl"/>

	<xsl:include href="AddOnTable.xsl"/>

	<xsl:include href="IRS4952Style.xsl"/>

	<xsl:output method="html" indent="yes"/>

	<xsl:strip-space elements="*"/>

	<xsl:param name="Form4952Data" select="$RtnDoc/IRS4952"/>

	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->

	<xsl:template name="CreateBox">

		<xsl:param name="TargetNode"/>

		<xsl:param name="AmountBoxStyle"/>

		<xsl:param name="PopulateAsText"/>

		<xsl:param name="StaticText"/>

		<xsl:param name="Number"/>

		<xsl:param name="NumberBoxStyle"/>

		<xsl:param name="Width">29mm</xsl:param>

		<xsl:param name="Height">5mm</xsl:param>

		<div class="styLNAmountBox">

			<xsl:attribute name="style">

				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;

				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;

				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>

			<xsl:choose>

				<xsl:when test="$TargetNode">

					<xsl:choose>

						<xsl:when test="$PopulateAsText">

							<xsl:call-template name="PopulateText">

								<xsl:with-param name="TargetNode" select="$TargetNode"/>

							</xsl:call-template>

						</xsl:when>

						<xsl:otherwise>

							<xsl:call-template name="PopulateAmount">

								<xsl:with-param name="TargetNode" select="$TargetNode"/>

							</xsl:call-template>

						</xsl:otherwise>

					</xsl:choose>

					<xsl:if test="$TargetNode/@referenceDocumentId">

						<xsl:call-template name="SetFormLinkInline">

							<xsl:with-param name="TargetNode" select="$TargetNode"/>

						</xsl:call-template>

					</xsl:if>

				</xsl:when>

				<xsl:when test="$StaticText">

					<xsl:value-of select="$StaticText"/>

				</xsl:when>

			</xsl:choose>

		</div>

		<div class="styLNRightNumBox">

			<xsl:attribute name="style">

				float:right;

				padding:2px 0px 0px 0px;

				border-right-width:0px;font-size:8pt;

				height:<xsl:value-of select="$Height"/>;

				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>

			<xsl:if test="$Number">

				<xsl:value-of select="$Number"/>

			</xsl:if>

		</div>

	</xsl:template>

	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<xsl:template match="/">

		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

		<html lang="EN-US">

			<head>

				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

				<title>

					<xsl:call-template name="FormTitle">

						<xsl:with-param name="RootElement" select="local-name($Form4952Data)"/>

					</xsl:call-template>

				</title>

				<!--  No Browser Caching  -->

				<meta http-equiv="Pragma" content="no-cache"/>

				<meta http-equiv="Cache-Control" content="no-cache"/>

				<meta http-equiv="Expires" content="0"/>

				<!-- No Proxy Caching -->

				<meta http-equiv="Cache-Control" content="private"/>

				<!-- Define Character Set  -->

				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>

				<meta name="Description" content="IRS Form 4952"/>

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>

				<xsl:call-template name="InitJS"/>

				<style type="text/css">

					<xsl:if test="not($Print) or $Print=''">

						<xsl:call-template name="IRS4952Style"/>

						<xsl:call-template name="AddOnStyle"/>

					</xsl:if>

				</style>

				<xsl:call-template name="GlobalStylesForm"/>

			</head>

			<body class="styBodyClass">

				<form name="IRS4952" style="font-family:arial;">

					<!--  Begin Header section 1 -->

					<div style="width:187mm;">

						<xsl:call-template name="DocumentHeader"/>			

						<div class="styBB" style="width:187mm;border-bottom-width:1px;">

							<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:1px;padding-top:.5mm;">

								<div style="padding-top:1mm;">

									Form<span style="padding-left:1.5mm;" class="styFormNumber">  4952</span>

								</div>

								<!--General Dependency Push Pin-->

								<xsl:call-template name="SetFormLinkInline">

									<xsl:with-param name="TargetNode" select="$Form4952Data"/>

								</xsl:call-template>

								<br/>

								 <div class="styAgency" style="padding-top:2mm;height:0mm;padding:bottom:0mm;">

									Department of the Treasury<br/>Internal Revenue Service (99)

								 </div>

							</div>

						

							<div class="styFTBox" style="width:125mm;">

								<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

								<div class="styMainTitle" style="height:8mm;padding-top:1mm;">

									Investment Interest Expense Deduction

								</div>

								<div class="styFST" style="height:5mm;font-size:8pt;margin-left:2mm;text-align:center;">

									<span style="text-align:center;font-weight:bold;">

										<div style="width:100%;height:5mm;padding-left:5px;">

											<div style="width:100%;height:5mm;padding-top:2.5mm;font-size:8pt;">

												<br/>

												<img src="{$ImagePath}/4952_Bullet_Sm.gif" alt="SmallBullet"/> 

												Information about Form 4952 and its instructions is at <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4952" title="Link to IRS.gov"><i>www.irs.gov/form4952.</i></a>

												<br/>

												<img src="{$ImagePath}/4952_Bullet_Sm.gif" alt="SmallBullet"/> 

												Attach to your tax return.

											</div>

										</div>

									</span>

								</div>

							</div>

							<div class="styTYBox" style="width:30mm;height:22mm;border-left-width:1px;">

								<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0191</div>

								<div class="styTY">20<span class="styTYColor">14</span>

								</div>

								<div style="margin-left:5mm;text-align:left;font-size:7pt;">

									Attachment<br/>Sequence No. 

									<span class="styBoldText" style="font-size:9pt;">51</span>

								</div>

							</div>

						</div>

						<!--  End Header section 1 -->

						<!-- Begin Names and Identifying number section -->

						<div class="styBB" style="width:187mm;">

							<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">

								Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							</div>

							<div style="height:8mm;width:50mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">

								Identifying number

								<br/>

								<span style="font-weight:normal;text-align:left;padding-top:2mm;width:100%">

									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>

								</span>

							</div>

						</div>

						<!-- End Names and Identifying number section -->

						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

						<!-- Begin Part I																								 -->

						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

						<!-- Header -->

						<div style="width:187mm;padding:3px 0px 3px 0px;" class="styBB">

							<!-- Content -->

							<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part I</div>

							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">

								Total Investment Interest Expense

							</div>

						</div>

						<!-- Body -->

						<div class="styBB" style="width:187mm;height:auto;">

							<!-- (1) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">1 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Investment interest expense paid or accrued in 2014 (see instructions)

										<span class="styDotLn" style="float:right;">...........</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">1</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;width:32mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentInterestExpenseAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							<!-- (2) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">2 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Disallowed investment interest expense from 2013 Form 4952, line 7

										<span class="styDotLn" style="float:right;">...........</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">2</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;width:32mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/PriorYrDisallowInvsmtIntExpAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							<!-- (3) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">3 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										<b>Total investment interest expense.</b> Add lines 1 and 2

										<span class="styDotLn" style="float:right;">................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;border-bottom-width:0mm;">3</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;width:32mm;border-bottom-width:0mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/TotalInvestmentInterestExpAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

						</div>

						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

						<!-- Begin Part II																								 -->

						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

						<!-- Header -->

						<div style="width:187mm;padding:3px 0px 3px 0px;" class="styBB">

							<!-- Content -->

							<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part II</div>

							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">

								Net Investment Income

							</div>

						</div>

						<!-- Body -->

						<div class="styBB" style="width:187mm;">

							<!-- (4a) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-left:3mm;width:5mm;">4a</div>

									<div class="styLNDesc" style="width:106mm;height:7.5mm;padding-left:3mm;">

										Gross income from property held for investment (excluding any net

										gain from the disposition of property held for investment)

										<span class="styDotLn" style="float:right;">..........</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="position:relative;height:8.5mm;padding-top:4.6mm;">4a</div>							

									<div class="styLNAmountBox" style="height:8.5mm;padding-top:4.6mm;width:28mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropGrossIncomeAmt"/>

										</xsl:call-template>

									</div>

									<div class="styShadingCell" style="height:8.5mm;width:8mm;"/>

									<div class="styLNRightNumBox" style="height:8.5mm;width:32mm;border-bottom-width:0mm;"/>

								</span>

							</div>

							<!-- (4b) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">b </div>

									<div class="styLNDesc" style="width:106mm;height:5.5mm;padding-left:3mm;">

										Qualified dividends included on line 4a

										<!--<span class="styDotLn" style="float:right;padding-left:1.6mm;">...........</span>-->

										<span class="styDotLn" style="float:right;">.............</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="position:relative;height:5.5mm;padding-top:1.6mm;">4b</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;width:28mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropQualDividendsAmt"/>

										</xsl:call-template>

									</div>

									<div class="styShadingCell" style="height:5.5mm;width:8mm;"/>

									<div class="styLNRightNumBox" style="height:5.5mm;width:32mm;border-bottom-width:0mm;"/>

								</span>

							</div>

							<!-- (4c) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">c </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Subtract line 4b from line 4a

										

										<span class="styDotLn" style="float:right;">.........................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">4c</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropNetGrossIncAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							

							<!-- (4d) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">d </div>

									<div class="styLNDesc" style="width:106mm;height:5.5mm;padding-left:3mm;">

										Qualified dividends included on line 4a

										<span class="styDotLn" style="float:right;padding-left:1.6mm;">............</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="position:relative;height:5.5mm;padding-top:1.6mm;">4d</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;width:28mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentPropNetDispGainAmt"/>

										</xsl:call-template>

									</div>

									<div class="styShadingCell" style="height:5.5mm;width:8mm;"/>

									<div class="styLNRightNumBox" style="height:5.5mm;width:32mm;border-bottom-width:0mm;"/>

								</span>

							</div>

							

							<!-- (4e) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-left:4.5mm;width:5mm;">e </div>

									<div class="styLNDesc" style="width:106mm;height:7.5mm;padding-left:3mm;">

											Enter the <b>smaller</b> of line 4d or your net capital gain from the

											disposition of <br/>property held for investment (see instructions)

											<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd">

												<span style="width:3px;"/>

												<xsl:call-template name="LinkToLeftoverDataTableInline">

													<xsl:with-param name="Desc">Investment Property Gain Elected Code</xsl:with-param>

													<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd"/>

												</xsl:call-template>

											</xsl:if>

											<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt">

												<span style="width:2px;"/>

												<xsl:call-template name="LinkToLeftoverDataTableInline">

													<xsl:with-param name="Desc">Investment Property Gain Elected Amount</xsl:with-param>

													<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt"/>

												</xsl:call-template>

											</xsl:if>

											<span class="styDotLn" style="float:right;">.......</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="position:relative;height:8.5mm;padding-top:4.6mm;">4e</div>							

									<div class="styLNAmountBox" style="height:8.5mm;padding-top:4.6mm;width:28mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt"/>

										</xsl:call-template>

									</div>

									<div class="styShadingCell" style="height:8.5mm;width:8mm;"/>

									<div class="styLNRightNumBox" style="height:8.5mm;width:32mm;border-bottom-width:0mm;"/>

								</span>

							</div>

							

							<!-- (4f) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">f </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Subtract line 4e from line 4d

										<span class="styDotLn" style="float:right;">.........................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">4f</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentNetGainLessSmallAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							<!-- (4g) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">g </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Enter the amount from lines 4b and 4e that you elect to include in investment income (see instructions)

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">4g</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentIncomeElectionAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>	

							

							<!-- (4h) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:4.5mm;width:5mm;">h </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Investment income. Add lines 4c, 4f, and 4g

										<span class="styDotLn" style="float:right;">....................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">4h</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentIncomeAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							<!-- (5) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">5 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										Investment expenses (see instructions)

										<span class="styDotLn" style="float:right;">....................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;">5</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentExpenseAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

							<!-- (6) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">6 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										<b>Net investment income.</b> Subtract line 5 from line 4h. If zero or less, enter -0-

										<span class="styDotLn" style="float:right;">........</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;border-bottom-width:0mm;">6</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;border-bottom-width:0mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/NetInvestmentIncomeAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div> 

						</div>

						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

						<!-- Begin Part III																								 -->

						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

						<!-- Header -->

						<div style="width:187mm;padding:3px 0px 3px 0px;" class="styBB">

							<!-- Content -->

							<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part III</div>

							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;height:auto;">

								Investment Interest Expense Deduction

							</div>

						</div>

						<!-- Body -->

						<div class="styTBB" style="width:187mm;height:auto;">

							<!-- (7) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-left:3mm;width:5mm;">7 </div>

									<div class="styLNDesc" style="width:141mm;height:7.5mm;padding-left:3mm;">

										Disallowed investment interest expense to be carried forward to 2015. Subtract line 6 from line 3.<br/>

											<span style="float:left;">If zero or less, enter -0-</span>

										<span class="styDotLn" style="float:right;">..........................</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.6mm;">7</div>							

									<div class="styLNAmountBox" style="height:8.5mm;padding-top:4.6mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/DisallowedCarryForwardExpAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div> 

							<!-- (8) ////////////////////////////////////////////////////-->

							<div style="width:187mm;">

								<span style="float:left;font-size:8.5pt;">

									<div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-left:3mm;width:5mm;">8 </div>

									<div class="styLNDesc" style="width:141mm;height:5.5mm;padding-left:3mm;">

										<b>Investment interest expense deduction.</b> Enter the <b>smaller</b> of line 3 or 6. See instructions

										<span class="styDotLn" style="float:right;">...</span>

									</div>

								</span>

								<span style="float:right;font-size:8pt;">

									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.6mm;border-bottom-width:0mm;">8</div>							

									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.6mm;border-bottom-width:0mm;">

										<xsl:call-template name="PopulateAmount">

											<xsl:with-param name="TargetNode" select="$Form4952Data/InvestmentInterestExpDeductAmt"/>

										</xsl:call-template>

									</div>

								</span>

							</div>

						</div>

						<!-- Footer -->

						<div style="width:187mm;padding-top:.3mm;font-size:7pt">

							<div class="styGenericDiv" style="text-align:left;font-weight:bold">For Paperwork Reduction Act Notice, see page 4.</div>

							<div class="styGenericDiv" style="margin-left:35mm;text-align:center">Cat. No. 13177Y</div>

							<div class="styGenericDiv" style="float:right;text-align:right">Form <b>4952</b> (2014)</div>

						</div>

					</div>

					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

					<div class="pageEnd" style="page-break-after:always;display:block;"/>				

					<!-- Additonal Data Title Bar and Button -->

					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">

						<div class="styLeftOverTitle">

							Additional Data        

						</div>

						<div class="styLeftOverButtonContainer">

							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>

						</div>

					</div>

					<!-- Additional Data Table -->

					<xsl:variable name="TableWidth">100</xsl:variable>

					<table class="styLeftOverTbl">

						<xsl:call-template name="PopulateCommonLeftover">

							<xsl:with-param name="TargetNode" select="$Form4952Data"/>

							<xsl:with-param name="DescWidth" select="$TableWidth"/>

						</xsl:call-template>

						<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd">

							<xsl:call-template name="PopulateLeftoverRow">

								<xsl:with-param name="Desc">Part II - Line 4(e) - Investment Property Gain Elected Code</xsl:with-param>

								<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedCd"/>

								<xsl:with-param name="DescWidth" select="$TableWidth"/>

							</xsl:call-template>

						</xsl:if>

						<xsl:if test="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt">

							<xsl:call-template name="PopulateLeftoverRowAmount">

								<xsl:with-param name="Desc">Part II - Line 4(e) - Investment Property Gain Elected Amount</xsl:with-param>

								<xsl:with-param name="TargetNode" select="$Form4952Data/PropertyDspstnCapGainInvIncAmt/@investmentPropGainElectedAmt"/>

								<xsl:with-param name="DescWidth" select="$TableWidth"/>

							</xsl:call-template>

						</xsl:if>

					</table>

				</form>

			</body>

		</html>

	</xsl:template>

</xsl:stylesheet>

